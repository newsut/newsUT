//
//  CreateEventViewController.swift
//  newsUT
//
//  Created by Yash Kakodkar on 5/3/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class CreateEventViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate  {

    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var createButton: UIBarButtonItem!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var aboutTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleField.becomeFirstResponder()
        aboutTextView.delegate = self
        titleField.delegate = self as? UITextFieldDelegate
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        aboutTextView.text = "Add a description"
        aboutTextView.textColor = UIColor.lightGray
        aboutTextView.tintColor = UIColor.init(displayP3Red: 197/255, green: 76/255, blue: 0, alpha: 1)
        
  
        
        aboutTextView.selectedTextRange = aboutTextView.textRange(from: aboutTextView.beginningOfDocument, to: aboutTextView.beginningOfDocument)
        
        
        tableView.keyboardDismissMode = .onDrag
        
    }
    
    func touchesBegan(_touches: Set<UITouch>, with event: UIEvent?) {
        
        //view.endEditing(true)
        titleField.resignFirstResponder()
        aboutTextView.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        titleField.endEditing(true)
        return true;
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = aboutTextView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            aboutTextView.text = "Add a desctiption"
            aboutTextView.textColor = UIColor.lightGray
            aboutTextView.tintColor = UIColor.init(displayP3Red: 197/255, green: 76/255, blue: 0, alpha: 1)
            aboutTextView.selectedTextRange = aboutTextView.textRange(from: aboutTextView.beginningOfDocument, to: aboutTextView.beginningOfDocument)
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, set
            // the text color to black then set its text to the
            // replacement string
        else if aboutTextView.textColor == UIColor.lightGray && !text.isEmpty {
            aboutTextView.textColor = UIColor.black
            aboutTextView.text = text
        }
            
            // For every other case, the text should change with the usual
            // behavior...
        else {
            return true
        }
        
        // ...otherwise return false since the updates have already
        // been made
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if aboutTextView.textColor == UIColor.lightGray {
                aboutTextView.selectedTextRange = aboutTextView.textRange(from: aboutTextView.beginningOfDocument, to: aboutTextView.beginningOfDocument)
            }
        }
    }
    
    
    @IBAction func unwindToCreateEvent(segue:UIStoryboardSegue) {
        let vc = segue.source as! DatePickerViewController
        dateTimeLabel.text = "\(vc.start) to \(vc.end)"
    }


    @IBAction func onCreate(_ sender: Any) {
        uploadEvent(title: titleField.text!, text: aboutTextView.text!, date: dateTimeLabel.text!, image_: eventImage.image)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width:300, height: 150)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        eventImage.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if( indexPath.section == 0 && indexPath.row == 0){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
            } else{
                picker.sourceType = .photoLibrary
            }
            
            present(picker, animated: true, completion: nil)
        
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
