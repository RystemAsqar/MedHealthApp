//
//  String+Extension.swift
//  CommonUI
//
//  Created by Rystem Asqar on 4/27/24.
//

import Foundation

public extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    //Minimum eight and maximum 10 characters, at least one uppercase letter,
    //one lowercase letter, one number and one special character
    func isValidPassword() -> String? {
        if self.count < 8 {
            return "Пароль должен состоять хотя бы из 8 символов"
        }
        
        if !self.isThereAnyDigit() {
            return "Пароль должен состоять хотя бы из 1 цифры"
        }
        
        if !self.isThereAnyUpperCase() {
            return "Пароль должен состоять хотя бы из 1 большой буквы"
        }
        
        if !self.isThereAnySpecialSymbol() {
            return "Пароль должен состоять хотя бы из 1 специального символа"
        }
        
        return nil
    }
    
    func isThereAnyUpperCase() -> Bool {
        let regularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    func isThereAnyDigit() -> Bool {
        self.rangeOfCharacter(from: .decimalDigits) != nil
    }
    
    func isThereAnySpecialSymbol() -> Bool {
        let symbolSet = CharacterSet(charactersIn: "~!?@#$%^&*_-+()[]{}></\\,:;.|'\"")
        return self.rangeOfCharacter(from: symbolSet) != nil
    }
}


