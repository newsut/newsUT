//
//  NewslettersFeedViewController.swift
//  newsUT
//
//  Created by Akarsh Kumar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit

class NewslettersFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var newslettersTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newslettersTableView.delegate = self
        newslettersTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newslettersTableView.dequeueReusableCell(withIdentifier: "NewsletterCell") as! NewsletterCell
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