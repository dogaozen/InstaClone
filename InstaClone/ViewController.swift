//
//  ViewController.swift
//  InstaClone
//
//  Created by pc on 12.03.2025.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error!.localizedDescription)
                }else {
                    print("giriş basarili")
                }
            }
            
        } else {
            makeAlert(titleInput: "Error" , messageInput: "Please fill all fields")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error!.localizedDescription)
                }else {
                    print("kayıt basarili")
                }
                
            }
            
        } else {
            makeAlert(titleInput: "Error" , messageInput: "Please fill all fields")
        }
        
    }
    
    
    func makeAlert(titleInput:String , messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput , preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}

