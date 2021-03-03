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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "signUp") as! SignUpPageVC
        present(vc, animated: true)
    }
}

