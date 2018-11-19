//
//  CalendarViewController.swift
//  JessApp
//
//  Created by Wojciech Augustyn on 11/11/2018.
//  Copyright © 2018 Wojciech Augustyn. All rights reserved.
//

import UIKit
import MessageUI

class CalendarViewController: UIViewController, MFMailComposeViewControllerDelegate {
    

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var AddressLine1: UITextField!
    @IBOutlet weak var AddressLine2: UITextField!
    @IBOutlet weak var Postcode: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Calendar: UIDatePicker!
    @IBOutlet weak var Date: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = Calendar
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(CalendarViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CalendarViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        Date.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm dd/MM/yyyy"
        Date.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func Submit(_ sender: AnyObject) {
   
        let toRecipients = ["wojciech.augustyn85@gmail.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(toRecipients)
        mc.setSubject(Name.text!)
        mc.setMessageBody("Name: \(Name.text!) \n\nAddress: \(AddressLine1.text!) \n\n \(AddressLine2.text!) \n\n \(Postcode.text!) \n\nDate: \(Date.text!) \n\n \(Description.text!)", isHTML: false)
        
        self.present(mc, animated: true, completion: nil)
    
    }
    
    
    private func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        
        self.resignFirstResponder()
    
    }
}
