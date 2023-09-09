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
    @IBOutlet weak var hoursWorkedOutlet: UITextField!
    @IBOutlet weak var hourlyWageOutlet: UITextField!
    @IBOutlet weak var picOutlet: UISegmentedControl!
    var name : String?
    var timePayment: Int?
    let dateFormatter = DateFormatter()
    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var spellAmountOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameInputOutlet.delegate = self
        
    }
    
    
    @IBAction func calculateAction(_ sender: Any) {
        nameInputOutlet.resignFirstResponder()
        name = nameInputOutlet.text
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        var date = dateFormatter.string(from: dateInputOutlet.date)
        print(date)
                
        if (picOutlet.selectedSegmentIndex == 0){
            timePayment = 5
        } else {
            timePayment = 20
        }
                

    var wage = Double(hourlyWageOutlet.text!)
        if let w = wage{
            var extraHours = Double(extraHoursWageOutlet.text!)
                if let ew = extraHours{
                    var workDay = Double(workDayHoursOutlet.text!)
                        if let wd = workDay{
                            var hoursWorked = Double(hoursWorkedOutlet.text!)
                                if let hw = hoursWorked{
                                    if hw <= wd {
                                       var total = Double(timePayment!) * hw * w
                                        totalOutlet.text = "Your paycheck should be: \(total)"
                                        
                                    } else{
                                       var total = Double(timePayment!) * ((wd * w) + ((hw - wd) * ew))
                                        totalOutlet.text = "Your paycheck should be: \(total)"
                                    }
                                    
                                } else {
                                    hoursWorked = 0.0
                                    print("Error: Use numbers!")
                                }
                        } else{
                            workDay = 0.0
                            print("Error: Use numbers!")
                        }
                } else{
                    extraHours = 0.0
                    print("Error: Use numbers!")
                }
        }else{
            wage = 0.0
            print("Error: Use numbers!")
        }
        
        print(spellAmountOutlet.text!)
    
        
    }

    
}

