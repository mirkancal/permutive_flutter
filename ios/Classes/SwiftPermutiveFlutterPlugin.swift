import Flutter
import UIKit

public class SwiftPermutiveFlutterPlugin: NSObject, FlutterPlugin {

    let permutiveManager = PermutiveManager()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "permutive_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftPermutiveFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "getPlatformVersion":
          result("iOS " + UIDevice.current.systemVersion)
      case "initPermutive":
          if let args = call.arguments as? Dictionary<String, Any>,
             let apiKey = args["apiKey"] as? String,
             let workspaceId = args["workspaceId"] as? String,
             let organisationId = args["organisationId"] as? String
                                                                    {
              self.permutiveManager.initPermutive(result: result, apiKey: apiKey, organisationId: organisationId, workspaceId: workspaceId)
             
            } else {
              result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
            }
          
          
          
          
      case "disposePermutive":
          permutiveManager.disposePermutive(result: result)
      default:
          result("Not valid")
      }
    
  }
}

//let apiKey = args["apiKey"] as? String,
//let workspaceId = args["workspaceId"] as? String
//let organisationId = args["organisationId"] as? String

//result(FlutterError.init(code: "bad args", message: nil, details: nil))

