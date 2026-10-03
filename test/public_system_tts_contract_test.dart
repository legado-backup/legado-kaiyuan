import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xxread/services/tts_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('flutter_tts');
  final calls = <MethodCall>[];
  late TtsService service;

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    SharedPreferences.setMockInitialValues(<String, Object>{
      'tts_speech_rate': 0.65,
      'tts_speech_volume': 0.7,
      'tts_speech_pitch': 1.1,
      'tts_language': 'zh-CN',
    });
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          return switch (call.method) {
            'getLanguages' => <String>['zh-CN', 'en-US'],
            'getVoices' => <Map<String, String>>[
              <String, String>{
                'name': 'System Chinese',
                'locale': 'zh-CN',
                'quality': 'premium',
              },
            ],
            'isLanguageAvailable' => true,
            _ => 1,
          };
        });
    service = TtsService();
  });

  tearDown(() async {
    await service.stop();
    service.dispose();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    debugDefaultTargetPlatformOverride = null;
  });

  test('uses the system plugin for voices, parameters, and speech', () async {
    await service.initialize();
    expect(service.isInitialized, isTrue, reason: service.lastError);

    await service.ensureVoicesLoaded();
    expect(service.availableVoices.single.name, 'System Chinese');
    expect(service.availableVoices.single.quality, 'premium');

    await service.speak('本地系统朗读');
    await service.stop();

    final methods = calls.map((call) => call.method).toList(growable: false);
    expect(
      methods,
      containsAll(<String>[
        'awaitSpeakCompletion',
        'getLanguages',
        'getVoices',
        'setLanguage',
        'setSpeechRate',
        'setVolume',
        'setPitch',
        'speak',
        'stop',
      ]),
    );
    expect(
      methods,
      everyElement(
        isIn(<String>{
          'awaitSpeakCompletion',
          'getLanguages',
          'getVoices',
          'isLanguageAvailable',
          'setLanguage',
          'setVoice',
          'setSpeechRate',
          'setVolume',
          'setPitch',
          'speak',
          'stop',
        }),
      ),
    );
    expect(
      calls.lastWhere((call) => call.method == 'speak').arguments,
      '本地系统朗读',
    );
  });
}
