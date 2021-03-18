//
//  ViewController.swift
//  Activize
//
//  Created by Karan Saini on 2/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "signUpVC") as! SignUpPageViewController
        present(vc, animated: true)
    }


}

