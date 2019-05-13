//
//  EventViewController.swift
//  newsUT
//
//  Created by Akarsh Kumar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import Parse

class EventViewController: UIViewController {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventMonth: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var organizationName: UILabel!
    @IBOutlet weak var organizationImage: UIImageView!
    
    @IBOutlet weak var dateTimeBUtton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var ticketButton: UIButton!
    @IBOutlet weak var aboutEvent: UILabel!
    
    
    var event:PFObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onDateTime(_ sender: Any) {
    }
    @IBAction func onLocation(_ sender: Any) {
    }
    @IBAction func onTicket(_ sender: Any) {
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
