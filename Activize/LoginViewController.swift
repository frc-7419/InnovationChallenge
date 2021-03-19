//
//  LoginViewController.swift
//  Activize
//
//  Created by Sudharsan Gopalakrishnan on 2/28/21.
//

//import Foundation

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBAction func signIn(_ sender: Any) {
        let lgvc = storyboard?.instantiateViewController(identifier: "HomePage") as! LoginViewController
        
        present(lgvc, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


