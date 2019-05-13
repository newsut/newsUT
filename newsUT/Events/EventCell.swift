//
//  EventCell.swift
//  newsUT
//
//  Created by Yash Kakodkar on 4/15/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var timedateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var saved:Bool = false

    @IBAction func onSave(_ sender: Any) {
    
        let toBeSaved = !saved
        if(toBeSaved){
            //TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setSaved(isSaved: true)
            //}, failure: { (error) in
                //print("Favorite did not succeed. Errror: \(error)")
            //})
        }else{
            //TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setSaved(isSaved: false)
           // }, failure: { (error) in
                //print("Unfavorite did not succeed. Errror: \(error)")
            //})
        }
    
    
    
    }
    
    
    func setSaved(isSaved:Bool){
        saved = isSaved
        if(saved){
            saveButton.setImage(UIImage(named:
                "Saved_Filled"), for: UIControl.State.normal)
        }else{
            saveButton.setImage(UIImage(named:
                "Saved"), for: UIControl.State.normal)
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
