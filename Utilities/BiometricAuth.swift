//  BiometricAuth.swift
//  Notes
//
//  Created by Abbas on 23/05/2025.

import LocalAuthentication

class BiometricAuth {
    static let shared = BiometricAuth()

    private let context = LAContext()

    func canEvaluatePolicy() -> Bool {
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }

    func authenticate(reason: String = "Unlock Notes", completion: @escaping (Bool) -> Void) {
        guard canEvaluatePolicy() else {
            completion(false)
            return
        }

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
}
