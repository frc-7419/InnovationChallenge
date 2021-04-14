//
//  StepTrackerViewController.swift
//  Activize
//
//  Created by Karan Saini on 4/2/21.
//

import Foundation
import CoreMotion

// helper class
class StepTracker {
   // instance variables = stored properties in Swift
    private let pedometer = CMPedometer()
        
    // return the step count (once) from motion data
    // display the step count data on the home page
    
    // ? unwraps the optional, e.g. if this is not nill then do that
//    public func getStepCount(completion: @escaping (Int?) -> Void) -> Void {
//        // block (completion) is an anonymous function
//        if CMPedometer.isStepCountingAvailable() {
//            let calendar = Calendar.current
//            pedometer.queryPedometerData(from: calendar.startOfDay(for: Date()), to: Date()) { (data, error) in
//                // runs some point down the line (asynchronous function)
//                completion(data?.numberOfSteps.intValue)
//            }
//        }
//    }
    
    public func getStepCount(completion: @escaping (Int?) -> Void) -> Void {
        // block (completion) is an anonymous function
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { (data, error) in
                completion(data?.numberOfSteps.intValue)
            }
        }
    }
}
