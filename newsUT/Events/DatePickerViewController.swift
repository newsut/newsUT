//
//  DatePickerViewController.swift
//  newsUT
//
//  Created by Yash Kakodkar on 5/13/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    
    @IBOutlet weak var startPicker: UIDatePicker!
    
    @IBOutlet weak var endPicker: UIDatePicker!
    
    var start:String = ""
    var end:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startPicker.minimumDate = Date()
        endPicker.minimumDate = Date()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onConfirm(_ sender: Any) {
    
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let startDate = dateFormatter.string(from: startPicker.date)
        let endDate = dateFormatter.string(from: endPicker.date)
        start = startDate;
        end = endDate;
        
        print(start)
        print(end)
        
        performSegue(withIdentifier: "goToCreate", sender: nil)
    

        
        //_ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
