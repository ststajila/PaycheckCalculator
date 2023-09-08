//
//  ViewController.swift
//  PaycheckStatement
//
//  Created by STANISLAV STAJILA on 9/1/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameInputOutlet: UITextField!
    @IBOutlet weak var extraHoursWageOutlet: UITextField!
    @IBOutlet weak var dateInputOutlet: UIDatePicker!
    @IBOutlet weak var workDayHoursOutlet: UITextField!
    @IBOutlet weak var hourlyWageOutlet: UITextField!
    @IBOutlet weak var picOutlet: UISegmentedControl!
    var name : String?
    var timePayment: Int?
    let dateFormatter = DateFormatter()
//    var date : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameInputOutlet.delegate = self
        
    }
    
    
    @IBAction func calculateAction(_ sender: Any) {
        nameInputOutlet.resignFirstResponder()
        name = nameInputOutlet.text
        print(name)
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        var date = dateFormatter.string(from: dateInputOutlet.date)
        print(date)
                
        if (picOutlet.selectedSegmentIndex == 0){
            timePayment = 5
        } else {
            timePayment = 20
        }
        
        print(timePayment)
        
        
        
        
        
    }

    
}

