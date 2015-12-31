//
//  SettingsViewController.swift
//  tips
//
//  Created by Kasey White on 12/17/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var SettingsNav: UINavigationItem!

    @IBOutlet weak var DefaultSlider: UISlider!
    
    @IBOutlet weak var DefSliderDescript: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SliderAction(sender: AnyObject) {
        
        
        let roundedValue = (round(DefaultSlider.value * 100)) / 100.0
        // Do something else with the value
        DefaultSlider.value = roundedValue
        let tipOffset = (roundedValue * 100) - 20
        
        DefSliderDescript.frame = CGRect(x:Int(141 + tipOffset * 21), y:180, width:57, height:21)
        DefSliderDescript.text = String(format: "%i%%", Int(roundedValue * 100))
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(roundedValue, forKey: "Slider_Default")
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.floatForKey("Slider_Default") != 0){
            DefaultSlider.value = defaults.floatForKey("Slider_Default")
            SliderAction(DefaultSlider)
        }
        else{
            defaults.setFloat(DefaultSlider.value, forKey: "Slider_Default")
            defaults.synchronize()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
