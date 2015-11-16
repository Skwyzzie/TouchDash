//
//  MusicViewController.swift
//  TouchDash
//
//  Created by Kerry on 11/14/15.
//  Copyright © 2015 Kerry Hackert. All rights reserved.
//

import Foundation
import UIKit

class MusicViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    let inputSources = [
        InputSource(name: "", value: "Input"),
        InputSource(name: "AM", value: "AM"),
        InputSource(name: "FM", value: "FM"),
        InputSource(name: "CD", value: "CD"),
        InputSource(name: "Internet Radio", value: "Radio")
    ]
    var currentInput: String!
    
    @IBOutlet weak var inputBtn: UIButton!
    @IBOutlet weak var inputPicker: UIPickerView!
    
    @IBAction func inputBtnTouched(sender: UIButton) {
        inputPicker.hidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputPicker.dataSource = self
        inputPicker.delegate = self
        currentInput = defaults.stringForKey("currInput")
        inputBtn.setTitle(currentInput, forState: .Normal);
        for (index, source) in inputSources.enumerate()
        {
            if source.value == currentInput
            {
                inputPicker.selectRow(index, inComponent: 0, animated: false)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //DATA SOURCE AND DELEGATE FOR SPINNER
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {return 1}
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{return inputSources.count}
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return inputSources[row].name}
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentInput = inputSources[row].value
        inputBtn.setTitle(currentInput, forState: .Normal);
        defaults.setObject(currentInput, forKey: "currInput")
        inputPicker.hidden = true
    }
    struct InputSource {
        var name: String; var value: String
        init(name: String, value: String) {
            self.name = name
            self.value = value
        }
    }
}