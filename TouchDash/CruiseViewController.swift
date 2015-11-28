//
//  CruiseViewController.swift
//  TouchDash
//
//  Created by Kerry on 11/14/15.
//  Copyright © 2015 Kerry Hackert. All rights reserved.
//

import Foundation
import UIKit

class CruiseViewController: UIViewController {
    // Static var to share information between views
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // Definitions
    var SPEED: Double!
    var cruiseOn = false
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var currCruiseSpdLbl: UILabel!
    @IBOutlet weak var mphLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    // Called when the stepper value is changed
    @IBAction func stepperValueChanged(sender: UIStepper) {
        currCruiseSpdLbl.text = Int(sender.value).description
    }
    
    // Called when set is touched
    @IBAction func setBtnTouched(sender: UIButton) {
        SPEED = stepper.value
        defaults.setDouble(SPEED, forKey: "speed")
        defaults.setBool(true, forKey: "cruiseMstrSwitch")
        currCruiseSpdLbl.text = Int(SPEED).description
        currCruiseSpdLbl.textColor = UIColor.greenColor()
    }
    
    // Called when cancel is touched
    @IBAction func cancelBtnTouched(sender: UIButton) {
        stepper.value = SPEED
        defaults.setBool(false, forKey: "cruiseMstrSwitch")
        currCruiseSpdLbl.text = Int(SPEED).description
        currCruiseSpdLbl.textColor = UIColor.redColor()
    }
    
    // Called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set master switch state
        if defaults.objectForKey("cruiseMstrSwitch") != nil {
            cruiseOn = defaults.boolForKey("cruiseMstrSwitch")
        } else {
            cruiseOn = false
        }
        
        // Set speed back to saved value
        if defaults.objectForKey("speed") != nil {
            SPEED = defaults.doubleForKey("speed")
        } else {
            SPEED = 60.0
        }
        
        // Set up the rest of the UI state
        currCruiseSpdLbl.text = Int(SPEED).description
        stepper.value = SPEED
        
        if(cruiseOn) {
            currCruiseSpdLbl.textColor = UIColor.greenColor()
        } else {
            currCruiseSpdLbl.textColor = UIColor.redColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}