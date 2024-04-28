//
//  AuthenticationProviderProtocol.swift
//  AppNetwork-AppNetwork
//
//  Created by Rystem Asqar on 4/27/24.
//

import Foundation

public protocol AuthenticationProviderProtocol: AnyObject {
    
    func registerUser(
        withEmail: String,
        password: String,
        name: String,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    )
    
    func loginUser(
        withEmail: String,
        password: String,
        success: @escaping () -> Void,
        failure: @escaping (Error) -> Void
    )
    
}
