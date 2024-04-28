//
//  AuthenticationProvider.swift
//  MedHealthApp
//
//  Created by Rystem Asqar on 4/27/24.
//

import Foundation
import AppNetwork
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


public class AuthenticationProvider: NSObject, AuthenticationProviderProtocol {
    public func registerUser(
        withEmail: String,
        password: String,
        name: String,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    ) {
        Auth.auth().createUser(
            withEmail: withEmail,
            password: password
        ) { _, error in
            if let error = error {
                failure(error)
                return
            }
            success()
        }
    }
    
    public func loginUser(
        withEmail: String,
        password: String,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    ) {
        Auth.auth().signIn(
            withEmail: withEmail,
            password: password
        ) { _, error in
            if let error = error {
                failure(error)
                return
            }
            success()
        }
    }
}
