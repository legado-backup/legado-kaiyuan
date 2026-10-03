"""Validate the reviewed local-reader source boundary before publishing."""
from __future__ import annotations

import json
import hashlib
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
FORBIDDEN_PATHS = (
    'lib/book_sources/', 'lib/features/book_sources/', 'lib/pages/book_sources/',
    'lib/pages/discover/', 'lib/services/account/', 'lib/pages/account/',
    'lib/services/ai/', 'lib/reader_core/ai/', 'lib/services/sync/',
    'lib/services/backup/', 'lib/services/export/', 'lib/pages/export/',
    'lib/pages/membership/', 'lib/pages/premium/', 'server/', 'marketing/',
    'ohos/', 'coverage/', 'omx_wiki/',
)
FORBIDDEN_DEPENDENCIES = (
    'dio', 'flutter_js', 'in_app_purchase', 'flutter_secure_storage',
    'passkeys', 'sign_in_with_apple', 'google_sign_in', 'flutter_web_auth_2',
    'audioplayers', 'pdfx', 'kindle_unpack', 'pointycastle',
)
# Only report path and finding type, never matched values.
CONTENT_CHECKS = {
    'private home path': re.compile(r'(?:/Users/|/home/)[A-Za-z0-9_.-]+/|[A-Za-z]:\\Users\\'),
    'private key': re.compile(r'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----'),
    'stored signing password': re.compile(r'(?:keyPassword|storePassword)\s*[:=]\s*[\"\']?[^\s,;\"\']+', re.I),
    'access credential': re.compile(r'\b(?:github_pat_[A-Za-z0-9_]{20,}|gh[pousr]_[A-Za-z0-9]{30,}|AKIA[A-Z0-9]{16}|AIza[A-Za-z0-9_-]{30,})\b'),
    'production backend': re.compile(r'/api/' r'v1/|(?:^|\s)sshpass(?:\s|$)|appstoreconnect\.env'),
    'developer signing identity': re.compile(r'DEVELOPMENT_TEAM\s*=\s*[^;\s"]|PROVISIONING_PROFILE_SPECIFIER\s*=\s*[^;\s"]', re.I),
}
DART_CHECKS = {
    'excluded implementation reference': re.compile(
        r'HttpClient|WebSocket|package:http/|package:dio/|book_sources/|services/(?:account|ai|sync|backup|export)/|reader_core/ai/'
        r'|MemberAccountController|ReadingCloud|WebDav|ReaderAi|AIChat|AiService'
        r'|StorePurchaseService|OfflineReaderLicense|PremiumMembership|CloudTts|ORSP'
    ),
}
TEXT_SUFFIXES = {'.dart', '.py', '.md', '.yaml', '.yml', '.json', '.arb', '.xml', '.plist', '.pbxproj', '.xcconfig', '.swift', '.kt', '.kts', '.gradle', '.properties', '.html', '.js', '.cmake', '.cpp', '.h', '.txt', '.entitlements', '.sh', '.ps1'}


def tracked_files() -> list[str]:
    result = subprocess.run(['git', 'ls-files', '-z'], cwd=ROOT, check=True, capture_output=True)
    return sorted(path for path in result.stdout.decode().split('\0') if path)


def check(paths: list[str], manifest: dict) -> list[str]:
    findings = []
    approved = set(manifest['files'])
    actual = set(paths)
    for path in sorted(actual - approved):
        findings.append(f'{path}: not in reviewed file manifest')
    for path in sorted(approved - actual):
        findings.append(f'{path}: manifest entry missing from tracked tree')
    for name in paths:
        path = ROOT / name
        if path.is_symlink() or not path.is_file():
            findings.append(f'{name}: symlink or missing file')
            continue
        if any(name.startswith(prefix) for prefix in FORBIDDEN_PATHS):
            findings.append(f'{name}: excluded implementation family')
        if Path(name).name.startswith('.env'):
            findings.append(f'{name}: private environment configuration')
        if name.endswith(('.p12', '.p8', '.jks', '.keystore', '.mobileprovision', '.key', '.pem')):
            findings.append(f'{name}: signing or private-key material')
        if any(token in name for token in ('donation_qr', 'cyber_begging', 'GoogleService-Info', 'google-services.json')):
            findings.append(f'{name}: personal account asset or service configuration')
        data = path.read_bytes()
        reviewed_hash = manifest.get('third_party_assets', {}).get(name)
        verified_third_party = reviewed_hash is not None and hashlib.sha256(data).hexdigest() == reviewed_hash
        if reviewed_hash is not None and not verified_third_party:
            findings.append(f'{name}: third-party asset checksum mismatch')
        if CONTENT_CHECKS['private key'].search(data.decode('utf-8', errors='replace')):
            findings.append(f'{name}: private key material')
        if path.suffix not in TEXT_SUFFIXES:
            continue
        content = data.decode('utf-8')
        for label, pattern in CONTENT_CHECKS.items():
            if pattern.search(content):
                findings.append(f'{name}: {label}')
        if path.suffix in {'.pbxproj', '.xcconfig', '.kts'}:
            identifiers = re.findall(r'\b(?:PRODUCT_BUNDLE_IDENTIFIER|applicationId|namespace)\s*=\s*"?([^"\s;]+)', content)
            for identifier in identifiers:
                if identifier not in {'org.example.xxread', 'org.example.xxread.RunnerTests'}:
                    findings.append(f'{name}: non-neutral application identity')
        if path.suffix == '.dart':
            for label, pattern in DART_CHECKS.items():
                if pattern.search(content):
                    findings.append(f'{name}: {label}')
        if path.suffix in {'.swift', '.kt', '.java', '.js', '.cpp'} and not verified_third_party:
            if re.search(r'URLSession|HttpURLConnection|OkHttpClient|java\.net\.(?:Socket|URL)|fetch\s*\(|XMLHttpRequest|WebSocket', content):
                findings.append(f'{name}: native backend network implementation')
        if name == 'pubspec.yaml':
            for package in FORBIDDEN_DEPENDENCIES:
                if re.search(rf'^  {re.escape(package)}:', content, re.M):
                    findings.append(f'{name}: excluded dependency {package}')
    return findings


def main() -> int:
    manifest = json.loads((ROOT / 'public_source_manifest.json').read_text())
    findings = check(tracked_files(), manifest)
    if findings:
        print('\n'.join(findings), file=sys.stderr)
        return 1
    print(f'Public source boundary verified: {len(manifest["files"])} tracked files')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
