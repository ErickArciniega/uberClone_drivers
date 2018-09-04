//
//  AuthProvider.swift
//  pruebasMapas
//
//  Created by erickArciniega on 04/09/18.
//  Copyright © 2018 erickArciniega. All rights reserved.
//

import Foundation
import FirebaseAuth

//handler
typealias LoginHandler = (_ msg: String?) -> Void;

struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid Email Adress, Please provide a Real Email Adress";
    static let WRONG_PASSWORD = "Wrong Password, Please Enter The Correct Password ";
    static let USER_NOT_FOUND = "User not found, please register";
    static let EMAIL_ALREADY_IN_USE = "Email Already in use, please use another email";
    static let WEAK_PASSWORD = "Your password it's too short, should be at least 6 characters long";
    static let PROBLEM_CONNECTING = "Ups! we can't connect to database, please try later";
}

class AuthProvider {
    
    private static let _instance = AuthProvider();
    
    static var Instance: AuthProvider{
        return _instance;
    }
    
    func login(withEmail: String, password: String, loginHandler:LoginHandler?){
        Auth.auth().signIn(withEmail: withEmail, password: password) { (user, error) in
            if error != nil{
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler);
            }else{
                loginHandler?(nil);
            }
        }
        
    }//login function
    
    func handleErrors(err: NSError, loginHandler: LoginHandler?){
        if let errCode = AuthErrorCode(rawValue: err.code){
            
            switch errCode{
                
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL);
                break;
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD);
                break;
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND);
                break;
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE);
                break;
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD);
                break;
                
            default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING);
                break;
            }
        }
    }
    
    
}
