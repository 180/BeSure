//
//  AddViewController.swift
//  FruitsDiet
//
//  Created by Kamil Kuliński on 22.04.2016.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var buttonManually: UIButton!
    @IBOutlet weak var buttonTime: UIButton!
    @IBOutlet weak var buttonLocation: UIButton!
    @IBOutlet weak var remindView: UIView!
    @IBOutlet weak var buttonRepeat: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews(){
        remindView.hidden = true
        buttonManually.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonManually.layer.borderWidth = 0.5
        buttonTime.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonTime.layer.borderWidth = 0.5
        buttonLocation.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonLocation.layer.borderWidth = 0.5
        buttonRepeat.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonRepeat.layer.borderWidth = 0.5
    }
    
    func unselectAll(){
        remindView.hidden = true
        buttonManually.selected = false
        buttonTime.selected = false
        buttonLocation.selected = false
        buttonManually.backgroundColor = UIColor.whiteColor()
        buttonTime.backgroundColor = UIColor.whiteColor()
        buttonLocation.backgroundColor = UIColor.whiteColor()
    }
    
    @IBAction func btnManuallyTapped(sender: AnyObject) {
        unselectAll()
        buttonManually.selected = true
        buttonManually.backgroundColor = UIColor.App.buttonEnable
    }

    @IBAction func btnTimeTapped(sender: AnyObject) {
        unselectAll()
        buttonTime.selected = true
        buttonTime.backgroundColor = UIColor.App.buttonEnable
        remindView.hidden = false
    }
    
    
    @IBAction func btnLocationTapped(sender: AnyObject) {
        unselectAll()
        buttonLocation.selected = true
        buttonLocation.backgroundColor = UIColor.App.buttonEnable
    }

    @IBAction func buttonRepeatTapped(sender: AnyObject) {
        if buttonRepeat.selected {
            buttonRepeat.selected = false
        } else {
            buttonRepeat.selected = true
        }
        
    }
    
    @IBAction func timeSelectionTapped(sender: AnyObject) {
        
        let button = sender as! UIButton
        if button.selected {
            button.selected = false
        } else {
            button.selected = true
        }
        timePicker.hidden = !button.selected
    }
    
    @IBAction func datePickerChanged(sender: AnyObject) {
        timeLabel.text = timePicker.date.dateStringWithFormat("HH:mm")
        
    }
    
    
}
