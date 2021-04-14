//
//  HomePageViewController.swift
//  Activize
//
//  Created by Karan Saini on 4/13/21.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var stepLabel: UILabel!
    
    var stepTracker: StepTracker = StepTracker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepTracker.getStepCount { (stepCount) in
            self.stepLabel.text = "Steps: \(stepCount ?? 0)"
        }
    }
}
