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
    @IBOutlet weak var verticalSlider: UISlider!{
        didSet{
            verticalSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        }
    }
    
    @IBAction func volumeChanged(sender: UISlider) {
        defaults.setFloat(sender.value, forKey: "volume")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        verticalSlider.value = defaults.floatForKey("volume")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

