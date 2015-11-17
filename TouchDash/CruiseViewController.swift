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
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var currCruiseSpdLbl: UILabel!
    @IBOutlet weak var mphLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var cruiseMstrSwitch: UISwitch!
    
    // Called when the stepper value is changed
    @IBAction func stepperValueChanged(sender: UIStepper) {
        currCruiseSpdLbl.text = Int(sender.value).description
    }
    
    // Called when set is touched
    @IBAction func setBtnTouched(sender: UIButton) {
        SPEED = stepper.value
        defaults.setDouble(SPEED, forKey: "speed")
    }
    
    // Called when cancel is touched
    @IBAction func cancelBtnTouched(sender: UIButton) {
        stepper.value = SPEED
        currCruiseSpdLbl.text = Int(SPEED).description
    }
    @IBAction func cruiseMstrSwitchFlipped(sender: UISwitch) {
        if(sender.on) {
            defaults.setBool(true, forKey: "cruiseMstrSwitch")
            currCruiseSpdLbl.text = Int(SPEED).description
            currCruiseSpdLbl.enabled = true
            mphLbl.enabled = true
            stepper.enabled = true
            setBtn.enabled = true
            cancelBtn.enabled = true
        } else {
            defaults.setBool(false, forKey: "cruiseMstrSwitch")
            currCruiseSpdLbl.text = Int(SPEED).description
            currCruiseSpdLbl.enabled = false
            mphLbl.enabled = false
            stepper.value = SPEED
            stepper.enabled = false
            setBtn.enabled = false
            cancelBtn.enabled = false
        }
    }
    
    // Called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set master switch state
        if defaults.objectForKey("cruiseMstrSwitch") != nil {
            cruiseMstrSwitch.on = defaults.boolForKey("cruiseMstrSwitch")
        } else {
            cruiseMstrSwitch.on = false
        }
        
        // Set speed back to saved value
        if defaults.objectForKey("speed") != nil {
            SPEED = defaults.doubleForKey("speed")
        } else {
            SPEED = 60.0
        }
        
        // Set up the rest of the UI state
        if(cruiseMstrSwitch.on) {
            currCruiseSpdLbl.text = Int(SPEED).description
            currCruiseSpdLbl.enabled = true
            mphLbl.enabled = true
            stepper.enabled = true
            stepper.value = SPEED
            setBtn.enabled = true
            cancelBtn.enabled = true
        } else {
            currCruiseSpdLbl.text = Int(SPEED).description
            currCruiseSpdLbl.enabled = false
            mphLbl.enabled = false
            stepper.value = SPEED
            stepper.enabled = false
            setBtn.enabled = false
            cancelBtn.enabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}