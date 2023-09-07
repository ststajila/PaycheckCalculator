//
//  ViewController.swift
//  PaycheckStatement
//
//  Created by STANISLAV STAJILA on 9/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInputOutlet: UITextField!
    @IBOutlet weak var oftenOutlet: UIButton!
    @IBOutlet weak var extraHoursWageOutlet: UITextField!
    @IBOutlet weak var dateInputOutlet: UIDatePicker!
    @IBOutlet weak var workDayHoursOutlet: UITextField!
    @IBOutlet weak var hourlyWageOutlet: UITextField!
//    var name : String?
    let dateFormatter = DateFormatter()
//    var date : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateAction(_ sender: Any) {
//        name = nameInputOutlet.text
        dateFormatter.dateStyle = DateFormatter.Style.short
        var date = dateFormatter.string(from: dateInputOutlet.date)
        print(date)
    }
    

}

