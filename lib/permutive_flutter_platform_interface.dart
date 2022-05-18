import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'permutive_flutter_method_channel.dart';

abstract class PermutiveFlutterPlatform extends PlatformInterface {
  /// Constructs a PermutiveFlutterPlatform.
  PermutiveFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PermutiveFlutterPlatform _instance = MethodChannelPermutiveFlutter();

  /// The default instance of [PermutiveFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelPermutiveFlutter].
  static PermutiveFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PermutiveFlutterPlatform] when
  /// they register themselves.
  static set instance(PermutiveFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> initPermutive({
    required String apiKey,
    required String organisationId,
    required String workspaceId,
  }) {
    throw UnimplementedError('initPermutive() has not been implemented.');
  }

  Future<String?> disposePermutive() {
    throw UnimplementedError('disposePermutive() has not been implemented.');
  }
}
