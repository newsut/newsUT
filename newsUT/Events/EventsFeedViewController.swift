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
        
        
        cell.locationLabel.text = event["location"] as? String
        cell.eventLabel.text = event["title"] as? String
        let date = event["date"] as? String
        let dateIndex = date?.firstIndex(of: "t")
        let dateText = String(date![..<dateIndex!])
        cell.timedateLabel.text = dateText
        
        let imageFile = event["image"] as? PFFileObject
        
        let urlString = imageFile?.url!
        if(urlString != nil){
            let url = URL(string: urlString!)!
            
            cell.eventImageView.af_setImage(withURL: url)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "EventViewController") as? EventViewController {
            viewController.event = events[indexPath.row]
            self.present(viewController, animated: true, completion: nil)
        }
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
