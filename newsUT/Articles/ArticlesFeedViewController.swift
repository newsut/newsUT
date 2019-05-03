//
//  ArticlesFeedViewController.swift
//  newsUT
//
//  Created by Akarsh Kumar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit

class ArticlesFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var articleTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        let currentDate = dateFormatter.string(from: date)
        self.navigationItem.title = currentDate
        
        
        // Do any additional setup after loading the view.
        articleTableView.delegate = self
        articleTableView.dataSource = self
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        
        
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