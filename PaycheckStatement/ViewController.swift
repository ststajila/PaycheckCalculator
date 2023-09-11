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
    var total: Double?
    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var spellAmountOutlet: UITextField!
    @IBOutlet weak var statusCheckOutlet: UILabel!
    
    @IBOutlet weak var checkDateOutlet: UILabel!
    @IBOutlet weak var checkNameOutlet: UILabel!
    @IBOutlet weak var checkAmountOutlet: UILabel!
    @IBOutlet weak var checkSpellAmountOutlet: UILabel!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameInputOutlet.delegate = self
        hourlyWageOutlet.delegate = self
        extraHoursWageOutlet.delegate = self
        workDayHoursOutlet.delegate = self
        hoursWorkedOutlet.delegate = self
        spellAmountOutlet.delegate = self
        
    }
    
    
    @IBAction func calculateAction(_ sender: Any) {
        name = nameInputOutlet.text
       var nameCheck = true
            let count =  1...10
            for  i in count {
                if (name!.contains("\(i)")){
                    statusCheckOutlet.backgroundColor = UIColor.red
                    statusCheckOutlet.text =
                    "Error: Name cannot contain a number"
                    nameCheck = false
                            }
                        }
        if nameCheck {
        
            statusCheckOutlet.backgroundColor = UIColor.green
            statusCheckOutlet.text = "Everything looks good!"
            
            checkNameOutlet.textColor = UIColor.black
            checkNameOutlet.text = name
            
            dateFormatter.dateStyle = DateFormatter.Style.short
            var date = dateFormatter.string(from: dateInputOutlet.date)
            
            checkDateOutlet.textColor = UIColor.black
            checkDateOutlet.text = date
            
            if (picOutlet.selectedSegmentIndex == 0){
                timePayment = 5
            } else {
                timePayment = 20
            }
            
            totalOutlet.text = "Your paycheck should be: "
            checkAmountOutlet.text = ""
            checkSpellAmountOutlet.text = ""
            
            
            var wage = Double(hourlyWageOutlet.text!)
            
            if let w = wage {
                if w >= 0 {
                    var extraHours = Double(extraHoursWageOutlet.text!)
                    
                    statusCheckOutlet.backgroundColor = UIColor.green
                    statusCheckOutlet.text = "Everything looks good!"
                    if let ew = extraHours{
                        if ew >= 0{
                            var workDay = Double(workDayHoursOutlet.text!)
                            
                            statusCheckOutlet.backgroundColor = UIColor.green
                            statusCheckOutlet.text = "Everything looks good!"
                            if let wd = workDay{
                                if wd >= 0 {
                                    var hoursWorked = Double(hoursWorkedOutlet.text!)
                                    
                                    statusCheckOutlet.backgroundColor = UIColor.green
                                    statusCheckOutlet.text = "Everything looks good!"
                                    if let hw = hoursWorked{
                                        if hw >= 0{
                                            
                                            statusCheckOutlet.backgroundColor = UIColor.green
                                            statusCheckOutlet.text = "Everything looks good!"
                                            
                                            
                                            if hw <= wd {
                                            total = Double(timePayment!) * hw * w
                                    totalOutlet.text = "Your paycheck should be: \(total!)"
                                                
                                                statusCheckOutlet.backgroundColor = UIColor.green
                                                statusCheckOutlet.text = "Everything looks good!"
                                                
                                                checkAmountOutlet.textColor = UIColor.black
                                                checkAmountOutlet.text = "\(total!)"
                                                
                                                checkSpellAmountOutlet.textColor = UIColor.black
                                                checkSpellAmountOutlet.text = spellAmountOutlet.text!
                                                buttonOutlet.setTitle("Update Check", for: .normal)
                                                
                                            } else{
                                    total = Double(timePayment!) * ((wd * w) + ((hw - wd) * ew))
                                                totalOutlet.text = "Your paycheck should be: \(total!)"
                                                
                                                statusCheckOutlet.backgroundColor = UIColor.green
                                                statusCheckOutlet.text = "Everything looks good!"
                                                
                                                checkAmountOutlet.textColor = UIColor.black
                                    checkAmountOutlet.text = "\(total!)"
                                                
                                                checkSpellAmountOutlet.textColor = UIColor.black
                                                checkSpellAmountOutlet.text = spellAmountOutlet.text!
                                                buttonOutlet.setTitle("Update Check", for: .normal)
                                            }
                                        }else{
                                            hoursWorked = 0.0
                                            statusCheckOutlet.backgroundColor = UIColor.red
                                            statusCheckOutlet.text = "Error: The number in the Hours worked field must be > or = 0"
                                        }
                                        } else {
                                            hoursWorked = 0.0
                                            statusCheckOutlet.backgroundColor = UIColor.red
                                            statusCheckOutlet.text = "Error: Use numbers in the Hours worked field!"
                                        }
                                } else{
                                    workDay = 0.0
                                    statusCheckOutlet.backgroundColor = UIColor.red
                                    statusCheckOutlet.text = "Error: The number in the Work day field must be > or = 0"
                                }
                                } else{
                                workDay = 0.0
                                statusCheckOutlet.backgroundColor = UIColor.red
                                statusCheckOutlet.text = "Error: Use numbers in the Work day hours field!"
                            }
                                
                        } else {
                            extraHours = 0.0
                            statusCheckOutlet.backgroundColor = UIColor.red
                            statusCheckOutlet.text = "Error: The number in the Extra hours wage field must be > or = 0"
                        }
                    } else{
                        extraHours = 0.0
                        statusCheckOutlet.backgroundColor = UIColor.red
                        statusCheckOutlet.text = "Error: Use numbers in the Extra hours wage field!"
                    }
                } else {
                    wage = 0.0
                    statusCheckOutlet.backgroundColor = UIColor.red
                    statusCheckOutlet.text = "Error: The number in the Hourly wage field must be > or = 0"
                }
            }else{
                wage = 0.0
                statusCheckOutlet.backgroundColor = UIColor.red
                statusCheckOutlet.text = "Error: Use numbers in the Hourly wage field!"
            }
        }
            
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameInputOutlet.resignFirstResponder()
        hourlyWageOutlet.resignFirstResponder()
        extraHoursWageOutlet.resignFirstResponder()
        workDayHoursOutlet.resignFirstResponder()
        hoursWorkedOutlet.resignFirstResponder()
        spellAmountOutlet.resignFirstResponder()
        return true
    }

    
}

