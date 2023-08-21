//
//  SignUpViewController.swift
//  FirebaseLoginAndSignUp
//
//  Created by Aman Kumar on 01/02/23.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        if email.text?.isEmpty == true
        {
            print("No text in email field")
            return
        }
        
        if password.text?.isEmpty == true
        {
            print("No text in password field")
            return
        }
        signUP()
        
    }
    
    
    @IBAction func alreadyHaveAccountTapped(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "LogInViewController")as! LogInViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func signUP()
    {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){(authResult,error) in
            guard let user = authResult?.user, error == nil else
            {
                print("Error \(error?.localizedDescription)")
                return
                
            }
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "mainHome")
            
            self.navigationController?.pushViewController(controller!, animated: true)
        }
    }
    
    
    
    
    
}
