import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permutive_flutter/permutive_flutter_method_channel.dart';

void main() {
  MethodChannelPermutiveFlutter platform = MethodChannelPermutiveFlutter();
  const MethodChannel channel = MethodChannel('permutive_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
