import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'permutive_flutter_platform_interface.dart';

/// An implementation of [PermutiveFlutterPlatform] that uses method channels.
class MethodChannelPermutiveFlutter extends PermutiveFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('permutive_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> initPermutive({
    required String apiKey,
    required String organisationId,
    required String workspaceId,
  }) async {
    var result = await methodChannel.invokeMethod('initPermutive', {
      "apiKey": apiKey,
      "organisationId": organisationId,
      "workspaceId": workspaceId,
    });
    return result;
  }

  @override
  Future<String?> disposePermutive() async {
    var result = await methodChannel.invokeMethod('disposePermutive');
    return result;
  }
}
