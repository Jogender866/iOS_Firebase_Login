//
//  LogInViewController.swift
//  FirebaseLoginAndSignUp
//
//  Created by Aman Kumar on 01/02/23.
//

import UIKit
import FirebaseAuth
import Firebase

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        validateFields()
    }
    

    @IBAction func createAccountTapped(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func validateFields()
    {
        if email.text?.isEmpty == true
        {
            print("No email text")
            return
        }
        
        if password.text?.isEmpty == true
        {
            print("No password text")
            return
        }
        login()
    }
    
    func login()
    {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!){[weak self] authResult , err in
            guard let strongSelf = self else {return}
            
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
            
        }
    }
    
    func checkUserInfo()
    {
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            let controller = storyboard?.instantiateViewController(withIdentifier: "mainHome")as! ViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
