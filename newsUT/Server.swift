//
//  Server.swift
//  
//
//  Created by Akarsh Kumar on 5/12/19.
//

import Foundation
import Parse


func signupUser(username: String, password: String) -> Bool{
    let user = PFUser()
    user.username = username
    user.password = password
    //user.email = "email@example.com"
    // other fields can be set just like with PFObject
    //user["phone"] = "415-392-0202"
    
    do {
        try user.signUp()
    } catch {
        return false
    }
    return true
    
    /*
    user.signUpInBackground { (success, error) in
        if(success){
            print("success");
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        else {
            print("error");
        }
    }
     */
    
}
func login(username: String, password: String) -> Bool{
    
    
    do {
        try PFUser.logIn(withUsername: username, password: password)
    } catch {
        return false
    }
    return true
    
    /*
    PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
        if user != nil {
            print("success")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            print("error")
        }
    }
     */
    
}
func logout() -> Bool {
    PFUser.logOut()
    return true
    
    /*
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
    
    (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = loginViewController
     */
    
}



func uploadArticle(title: String, text: String, date: String, image_: UIImage?){
    let post = PFObject(className: "Article")
    
    post["title"] = ""
    post["author"] = PFUser.current()!
    post["text"] = ""
    post["date"] = ""
    
    
    
    if let image = image_{
        let imageData = image.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
    }
    
    post.saveInBackground { (success, error) in
        if success {
            //self.dismiss(animated: true, completion: nil)
        }
        else {
            print("error posting")
        }
    }

}
func uploadNewsletter(title: String, text: String, date: String, image_: UIImage?){
    let post = PFObject(className: "Newsletter")
    
    post["title"] = ""
    post["author"] = PFUser.current()!
    post["text"] = ""
    post["date"] = ""
    
    
    
    if let image = image_{
        let imageData = image.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
    }
    
    post.saveInBackground { (success, error) in
        if success {
            //self.dismiss(animated: true, completion: nil)
        }
        else {
            print("error posting")
        }
    }
    
}
func uploadEvent(title: String, text: String, date: String, image_: UIImage?){
    let post = PFObject(className: "Event")
    
    post["title"] = title
    post["author"] = PFUser.current()!
    post["text"] = text
    post["date"] = date
    
    
    
    if let image = image_{
        let imageData = image.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
    }
    
    post.saveInBackground { (success, error) in
        if success {
            //self.dismiss(animated: true, completion: nil)
        }
        else {
            print("error posting")
        }
    }
    
}

var articles = [PFObject]()
var newsletters = [PFObject]()
var events = [PFObject]()

func getArticlesQuery() -> PFQuery<PFObject> {
    let query = PFQuery(className: "Article")
    //query.includeKeys(["author", "comments", "comments.user"])
    query.includeKeys(["author"])
    query.limit = 20
    return query
}

func getNewslettersQuery() -> PFQuery<PFObject>{
    let query = PFQuery(className: "Newsletter")
    //query.includeKeys(["author", "comments", "comments.user"])
    query.includeKeys(["author"])
    query.limit = 20
    return query
}

func getEventsQuery() -> PFQuery<PFObject>{
    let query = PFQuery(className: "Event")
    //query.includeKeys(["author", "comments", "comments.user"])
    query.includeKeys(["author","text", "title","location","date","image"])
    
    query.limit = 20
    return query
}

func refreshArticles(){
    
    let query = getArticlesQuery()
    
    query.findObjectsInBackground { (articles_, error) in
        if articles_ != nil{
            articles = articles_!
            //self.tableView.reloadData()
        }
    }
}
func refreshNewsletters(){
    
    let query = getNewslettersQuery()
    query.findObjectsInBackground { (newsletters_, error) in
        if newsletters_ != nil{
            newsletters = newsletters_!
            //self.tableView.reloadData()
        }
    }
}
func refreshEvents(){
    
    let query = getEventsQuery()
    
    query.findObjectsInBackground { (events_, error) in
        if events_ != nil{
            events = events_!
            //self.tableView.reloadData()
        }
    }
}
