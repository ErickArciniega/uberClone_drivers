//
//  SigInVC.swift
//  pruebasMapas
//
//  Created by erickArciniega on 03/09/18.
//  Copyright © 2018 erickArciniega. All rights reserved.
//

import UIKit

class SigInVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logIn(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            AuthProvider.Instance.login(withEmail: emailTextField.text!, password: passwordTextField.text!) { (message) in
                if message != nil{
                    self.alertTheUser(title: "Problem With Authentication", message: message!)
                }else{
                    print("acceso concedido")
                }
            }
        }
        
    }
    
    private func alertTheUser(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }
    

    @IBAction func signUp(_ sender: Any) {
    }
    
    
}
