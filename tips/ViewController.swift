//
//  ViewController.swift
//  tips
//
//  Created by Kasey White on 12/13/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billEntry: UITextField!
    
    @IBOutlet weak var tipLabeler: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipChanger: UISlider!
    
    @IBOutlet weak var sliderDescriptor: UILabel!
    
    @IBOutlet weak var SecondView: UIView!

    @IBOutlet var FirstView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabeler.text = "$0.00"
        totalLabel.text = "$0.00"
        billEntry.becomeFirstResponder()
        billEntry.attributedPlaceholder = NSAttributedString(string: "$",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        SecondView.frame = CGRect(x: 0, y: 1000, width: 414, height: 366)
        
    }

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textChanger(sender: AnyObject){
        let roundedValue = (round(tipChanger.value * 100)) / 100.0
            // Do something else with the value
        tipChanger.value = roundedValue
        let tipOffset = (roundedValue * 100) - 20
        
        sliderDescriptor.frame = CGRect(x:Int(141 + tipOffset * 21), y:296, width:57, height:21)
        
        let tipPercent = Double(roundedValue)
    
        if let billAmount = Double((billEntry.text)!){
            let tip = billAmount * tipPercent
            let final = tip + billAmount
            
            tipLabeler.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", final)
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.SecondView.frame = CGRect(x: 0, y: 365, width: 414, height: 366)
            })
            
        }
        else{
        
            tipLabeler.text = "$0.00"
            totalLabel.text = "$0.00"
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.SecondView.frame = CGRect(x: 0, y: 1000, width: 414, height: 366)
            })
            
        }
        sliderDescriptor.text = String(format: "%i%%", Int(roundedValue * 100))
        
    }
    @IBAction func tapAction(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipChanger.value = defaults.floatForKey("Slider_Default")
        textChanger(billEntry)
    }
    
}

