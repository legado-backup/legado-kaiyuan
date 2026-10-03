import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('policy', Path(__file__).with_name('check_public_source.py'))
policy = importlib.util.module_from_spec(spec)
spec.loader.exec_module(policy)


class PublicSourcePolicyTest(unittest.TestCase):
    def check_file(self, name, content):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            file = root / name
            file.parent.mkdir(parents=True, exist_ok=True)
            file.write_text(content)
            with patch.object(policy, 'ROOT', root):
                return policy.check([name], {'files': [name]})

    def test_rejects_excluded_code_even_if_manifest_approves_path(self):
        self.assertTrue(self.check_file('lib/services/account/client.dart', 'class Client {}'))
        self.assertTrue(self.check_file('lib/local.dart', "import 'services/account/client.dart';"))

    def test_rejects_operational_metadata_without_reporting_value(self):
        findings = self.check_file('lib/config.dart', "const endpoint = 'https://private-service.example/" + "api/v1/auth';")
        self.assertTrue(findings)
        self.assertNotIn('https://', '\n'.join(findings))
        self.assertTrue(self.check_file('ios/config.xcconfig', 'DEVELOPMENT_TEAM' + ' = PRIVATE_TEAM;'))

    def test_rejects_paid_dependency_and_home_path(self):
        self.assertTrue(self.check_file('pubspec.yaml', 'dependencies:\n  in_app_purchase: any\n'))
        self.assertTrue(self.check_file('README.md', '/Users/' + 'developer/certs/'))

    def test_rejects_signing_password_and_environment_file(self):
        findings = self.check_file('android/signing.properties', 'storePassword' + ' = sensitive-example')
        self.assertTrue(findings)
        self.assertNotIn('sensitive-example', '\n'.join(findings))
        self.assertTrue(self.check_file('.env.production', 'SERVICE_TOKEN=value'))
        self.assertTrue(self.check_file('ios/project.pbxproj', 'PRODUCT_BUNDLE_IDENTIFIER = private.example.reader;'))
        self.assertFalse(self.check_file('android/build.gradle.kts', 'applicationId = "org.example.xxread"'))

    def test_rejects_extensionless_key_and_native_network(self):
        self.assertTrue(self.check_file('id_ed25519', '-----BEGIN ' + 'PRIVATE KEY-----'))
        self.assertTrue(self.check_file('ios/Client.swift', 'let session = URLSession.shared'))

    def test_rejects_truncated_action_revision(self):
        self.assertTrue(self.check_file('.github/workflows/ci.yml', 'steps:\n  - uses: owner/action@' + 'a' * 38))
        self.assertFalse(self.check_file('.github/workflows/ci.yml', 'steps:\n  - uses: owner/action@' + 'a' * 40))

    def test_allows_basic_reader_code_and_public_release_link(self):
        self.assertFalse(self.check_file('lib/reader.dart', 'class LocalReader {}'))
        self.assertFalse(self.check_file('README.md', 'https://github.com/miloquinn/origo-x/releases'))


if __name__ == '__main__':
    unittest.main()
