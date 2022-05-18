import 'permutive_flutter_platform_interface.dart';

class PermutiveFlutter {
  Future<String?> getPlatformVersion() {
    return PermutiveFlutterPlatform.instance.getPlatformVersion();
  }

  Future<String?> initPermutive({
    required String apiKey,
    required String organisationId,
    required String workspaceId,
  }) {
    return PermutiveFlutterPlatform.instance.initPermutive(
      apiKey: apiKey,
      organisationId: organisationId,
      workspaceId: workspaceId,
    );
  }

  Future<String?> disposePermutive() {
    return PermutiveFlutterPlatform.instance.disposePermutive();
  }
}
