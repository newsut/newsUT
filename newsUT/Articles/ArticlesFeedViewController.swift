//
//  ArticlesFeedViewController.swift
//  newsUT
//
//  Created by Akarsh Kumar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import Parse

class ArticlesFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var articleTableView: UITableView!
    var refreshControl: UIRefreshControl!
    //var articles = [PFObject]()
    var selectedArticles: PFObject!
    var numberOfArticles: Int!
    
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
        
        refreshArticles()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = getArticlesQuery()
        query.findObjectsInBackground { (articles_, error) in
            if(articles_ != nil){
                articles = articles_!
                self.articleTableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    
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
