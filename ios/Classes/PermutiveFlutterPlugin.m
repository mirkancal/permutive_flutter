#import "PermutiveFlutterPlugin.h"
#if __has_include(<permutive_flutter/permutive_flutter-Swift.h>)
#import <permutive_flutter/permutive_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "permutive_flutter-Swift.h"
#endif

@implementation PermutiveFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPermutiveFlutterPlugin registerWithRegistrar:registrar];
}
@end
