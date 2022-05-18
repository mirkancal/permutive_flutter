import 'package:flutter_test/flutter_test.dart';
import 'package:permutive_flutter/permutive_flutter.dart';
import 'package:permutive_flutter/permutive_flutter_platform_interface.dart';
import 'package:permutive_flutter/permutive_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPermutiveFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements PermutiveFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PermutiveFlutterPlatform initialPlatform = PermutiveFlutterPlatform.instance;

  test('$MethodChannelPermutiveFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPermutiveFlutter>());
  });

  test('getPlatformVersion', () async {
    PermutiveFlutter permutiveFlutterPlugin = PermutiveFlutter();
    MockPermutiveFlutterPlatform fakePlatform = MockPermutiveFlutterPlatform();
    PermutiveFlutterPlatform.instance = fakePlatform;
  
    expect(await permutiveFlutterPlugin.getPlatformVersion(), '42');
  });
}
