//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Angarag Gansukh on 10/9/22.
//

import Parse
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }

    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!

        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
            }
            else {
                print("Sign in error: \(String(describing: error?.localizedDescription))")
            }
        }
    }

    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        // user["username"] = usernameField.text
        // user["password"] = passwordField.text

        user.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Sign up error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
