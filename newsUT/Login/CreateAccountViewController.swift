//
//  CreateAccountViewController.swift
//  newsUT
//
//  Created by Yash Kakodkar on 5/11/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import Parse

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreate(_ sender: Any) {
    
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user["Name"] = nameTextField.text
        
//        let imageData: Data!
//        if(profileImageView.image != UIImage(named: "ProfilePicEdit")){
//            imageData = profileImageView.image!.pngData()
//        }else {
//            let defaultProfilePic = UIImage(named: "DefaultProfilePic")
//            imageData = defaultProfilePic!.pngData()
//        }
//        let file = PFFileObject(data: imageData!)
//        user["ProfileImage"] =  file
        
        user.signUpInBackground {(success, error) in
            if(success){
                self.dismiss(animated: true, completion: nil)
            }else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
