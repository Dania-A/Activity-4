//
//  LoginViewController.swift
//  Activity 4
//
//  Created by Dania A on 31/10/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //A URL var to be intialized through the segue coming from the recording ViewController
    var receivedUrl: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func forgotPasswordIsClicked(_ sender: Any) {
        //TODO: call performSegue to fire the segue that should take you from this ViewController to AudioProcessingViewController. **Don't forget to add that segue on the storyboard and give it an identifier so you can refer to it through that identifier**
    }
    
    //TODO: Implement prepare for segue, and set the URL value of the recording in the AudioProcessingViewController to be the same as this one (receivedUrl).
    

}
