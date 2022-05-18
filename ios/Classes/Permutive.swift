//
//  Permutive.swift
//  Runner
//
//  Created by Adrian Egea Sanchez on 5/11/21.
//

import Foundation
import Permutive_iOS
import Flutter

struct MPageTracker {
    let id: String
    let url: String
    let pageTracker: PageTrackerProtocol
}

class PermutiveManager {
    private var lastActiveUrl = ""
    private var permutive = Permutive.shared

    func getPermutive() -> Permutive {
        return permutive
    }

    func initPermutive(result: @escaping FlutterResult, apiKey: String, organisationId: String, workspaceId: String) {
        guard let options = Options(apiKey: apiKey, organisationId: organisationId, workspaceId: workspaceId) else {
            result(flutterError(message: "Couldn't initialize permutive"))
            return
        }

        options.logModes = LogMode.all
        Permutive.shared.start(with: options) { error in
            guard error == nil else {
                result(self.flutterError(message: "Couldn't initialize permutive"))
                return
            }
            result("success")
        }
    }

     func disposePermutive(result: FlutterResult) {
        permutive.stop()
        result("Permutive stop successfully")
    }

    private func flutterError(message: String) -> FlutterError {
        return FlutterError(code: "error",
                            message: message,
                            details: nil)
    }

}
