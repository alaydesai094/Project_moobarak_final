//
//  LoginViewController.swift
//  Project_moobarak_final
//
//  Created by Alay Desai on 2020-06-22.
//  Copyright © 2020 Alay Desai. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
             
             
    @IBAction func SignInButton(_ sender: Any) {
        
        print("login pressed")
        
        // Create the default Auth UI
        let authUI = FUIAuth.defaultAuthUI()
        
        // Check if isn't nil
        guard authUI != nil else {
            return
            
        }
        
          // Set the deligate and Specify the sign in method
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]

        // get the authviewController and present it
        let authViewController = authUI!.authViewController()
        present(authViewController, animated:true, completion: nil)


    }
    
    
    

}

extension LoginViewController: FUIAuthDelegate {


        func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {

            //check if there is an error

            if error != nil {
                //log the error
                return
            }

            print(authDataResult?.user.uid)
             performSegue(withIdentifier: "goHome", sender: self)

        }

}

