//
//  ViewController.swift
//  TouchDash
//
//  Created by Kerry on 10/28/15.
//  Copyright © 2015 Kerry Hackert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // Rotate volume slider 90 degrees
    @IBOutlet weak var verticalSlider: UISlider!{
        didSet{
            verticalSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        }
    }
    
    // Called when the user changes the volume
    @IBAction func volumeChanged(sender: UISlider) {
        defaults.setFloat(sender.value, forKey: "volume")
    }
    
    // Called when the view is launched
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.objectForKey("volume") != nil {
            verticalSlider.value = defaults.floatForKey("volume")
        } else {
            verticalSlider.value = 50
        }
    }

    // Required - called if the app is holding too much memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

