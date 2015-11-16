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
    let defaults = NSUserDefaults.standardUserDefaults()
    var SPEED: Double = 60
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var currCruiseSpdLbl: UILabel!
    @IBOutlet weak var mphLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var cruiseMstrSwitch: UISwitch!
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        currCruiseSpdLbl.text = Int(sender.value).description
    }
    
    @IBAction func setBtnTouched(sender: UIButton) {
        SPEED = stepper.value
        defaults.setDouble(SPEED, forKey: "speed")
    }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stepper.autorepeat = true
        SPEED = defaults.doubleForKey("speed")
        cruiseMstrSwitch.on = defaults.boolForKey("cruiseMstrSwitch")
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
        // Dispose of any resources that can be recreated.
    }
}