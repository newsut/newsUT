//
//  EventViewController.swift
//  newsUT
//
//  Created by Akarsh Kumar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class EventViewController: UIViewController {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventMonth: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var organizationName: UILabel!
    @IBOutlet weak var organizationImage: UIImageView!
    
    @IBOutlet weak var dateTimeButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var ticketButton: UIButton!
    @IBOutlet weak var aboutEvent: UILabel!
    
    
    var event:PFObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.organizeEvent(eventObject: event!)
        // Do any additional setup after loading the view.
    }
    
    func organizeEvent(eventObject: PFObject){
        
        let imageFile = eventObject["image"] as? PFFileObject
        let urlString = imageFile?.url!
        if(urlString != nil){
            let url = URL(string: urlString!)!
            
            self.eventImage.af_setImage(withURL: url)
        }
        
        self.eventTitle.text = eventObject["title"] as? String
        let user = eventObject["author"] as! PFUser
        self.organizationName.text = user.username
        self.aboutEvent.text = eventObject["text"] as? String
        
        let months:[String] = ["JAN","FEB","MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "DEC"];
        
        
        
        let date: String = (eventObject["date"] as? String)!
        self.dateTimeButton.setTitle(date, for: .normal)

        let firstSlashIndex = date.firstIndex(of: "/")
        let month = String(date[..<firstSlashIndex!])

        let dayIndex = date.index(firstSlashIndex!, offsetBy: 1);
        let dayString = String(date[dayIndex...])
        let secondSlashIndex = dayString.firstIndex(of: "/")
        let day = String(dayString[..<secondSlashIndex!])
        
        self.eventDate.text = day
        self.eventMonth.text = months[Int(month)! - 1]

        
        
    }
    
    @IBAction func onDateTime(_ sender: Any) {
    }
    @IBAction func onLocation(_ sender: Any) {
    }
    
    @IBAction func onTicket(_ sender: Any) {
    }
    @IBAction func backPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
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
