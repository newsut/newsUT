//
//  EventsFeedViewController.swift
//  newsUT
//
//  Created by Akarsh Kumar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import Parse

class EventsFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var eventsTableView: UITableView!
    var refreshControl: UIRefreshControl!
    //var events = [PFObject]()
    var selectedEvent: PFObject!
    var numberOfEvents: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = getEventsQuery()
        query.findObjectsInBackground { (events_, error) in
            if(events_ != nil){
                events = events_!
                self.eventsTableView.reloadData()
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        
        let event = events[indexPath.row]
        /*
        cell.authorLabel.text = (event["author"] as! PFUser).username
        cell.headlineLabel.text = event["title"] as! String?
        cell.dateLabel.text = event["date"] as! String?
        
        
        let imageFile = event["image"] as? PFFileObject
        
        
        let urlString = imageFile?.url!
        if(urlString != nil){
            let url = URL(string: urlString!)!
            
            cell.articleImageView.af_setImage(withURL: url)
        }

        
        @IBOutlet weak var eventImageView: UIImageView!
        @IBOutlet weak var timedateLabel: UILabel!
        @IBOutlet weak var locationLabel: UILabel!
        @IBOutlet weak var eventLabel: UILabel!
        @IBOutlet weak var saveButton: UIButton!
 
 */
        
        return cell
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
