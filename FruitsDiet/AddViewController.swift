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
    
    @IBOutlet weak var minutesButton: UIButton!
    @IBOutlet weak var hoursBtn: UIButton!
    @IBOutlet weak var daysButton: UIButton!
    
    @IBOutlet weak var coverView: UIView!
    
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
        
        timeLabel.text = NSDate().dateStringWithFormat("HH:mm")
        
        remindView.hidden = true
        buttonManually.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonManually.layer.borderWidth = 0.5
        buttonTime.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonTime.layer.borderWidth = 0.5
        buttonLocation.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonLocation.layer.borderWidth = 0.5
        buttonRepeat.layer.borderColor = UIColor.App.buttonEnable.CGColor
        buttonRepeat.layer.borderWidth = 0.5
        minutesButton.layer.borderColor = UIColor.App.buttonEnable.CGColor
        minutesButton.layer.borderWidth = 0.5
        hoursBtn.layer.borderColor = UIColor.App.buttonEnable.CGColor
        hoursBtn.layer.borderWidth = 0.5
        daysButton.layer.borderColor = UIColor.App.buttonEnable.CGColor
        daysButton.layer.borderWidth = 0.5
        
        btnManuallyTapped(buttonManually)
        buttonMinutesTapped(minutesButton)
        
    }
    
    func unselectAll(){
        remindView.hidden = true
        buttonManually.selected = false
        buttonTime.selected = false
        buttonLocation.selected = false
        buttonManually.backgroundColor = UIColor.whiteColor()
        buttonTime.backgroundColor = UIColor.whiteColor()
        buttonLocation.backgroundColor = UIColor.whiteColor()
        timePicker.hidden = true
    }
    
    func unselectBottom(){
        minutesButton.selected = false
        hoursBtn.selected = false
        daysButton.selected = false
        minutesButton.backgroundColor = UIColor.whiteColor()
        hoursBtn.backgroundColor = UIColor.whiteColor()
        daysButton.backgroundColor = UIColor.whiteColor()
        timePicker.hidden = true
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
        coverView.hidden = buttonRepeat.selected
        timePicker.hidden = true
    }
    
    @IBAction func buttonMinutesTapped(sender: AnyObject) {
        unselectBottom()
        minutesButton.selected = true
        minutesButton.backgroundColor = UIColor.App.buttonEnable
    }
    @IBAction func buttonHoursTapped(sender: AnyObject) {
        unselectBottom()
        hoursBtn.selected = true
        hoursBtn.backgroundColor = UIColor.App.buttonEnable
    }
    @IBAction func buttonDaysTapped(sender: AnyObject) {
        unselectBottom()
        daysButton.selected = true
        daysButton.backgroundColor = UIColor.App.buttonEnable
    }
    @IBAction func timeSelectionTapped(sender: AnyObject) {
        
        let button = sender as! UIButton
        if button.selected {
            button.selected = false
            timeLabel.textColor = UIColor.blackColor()
        } else {
            button.selected = true
            timeLabel.textColor = UIColor.App.buttonEnable
            
        }
        timePicker.hidden = !button.selected
    }
    
    @IBAction func datePickerChanged(sender: AnyObject) {
        timeLabel.text = timePicker.date.dateStringWithFormat("HH:mm")
        
    }
    
    @IBAction func createButtonTapped(sender: AnyObject) {
        
        
    }
    
}

extension AddViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(textField: UITextField) {
        timePicker.hidden = true
    }
    
}
