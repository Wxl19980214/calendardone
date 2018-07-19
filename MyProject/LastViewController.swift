//
//  LastViewController.swift
//  MyProject
//
//  Created by zm on 2018/7/19.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class LastViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        note.text = UserDefaults.standard.string(forKey: "key233" + String(selectedIndex))
        course.text = UserDefaults.standard.string(forKey: "key11" + String(selectedIndex))
        location.text = UserDefaults.standard.string(forKey: "key21" + String(selectedIndex))
        professor.text = UserDefaults.standard.string(forKey: "key31" + String(selectedIndex))
        // Do any additional setup after loading the view.
       
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var professor: UITextField!

    @IBOutlet weak var note: UITextView!
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        UserDefaults.standard.set(note.text, forKey: "key233"+String(selectedIndex))
        if text == "\n" {
            note.resignFirstResponder()
            return false
        }
        //UserDefaults.standard.set(noteview.text, forKey: "key")
        return true
        
    }
    
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     
        
        
        
        UserDefaults.standard.set(course.text, forKey: "key11" + String(selectedIndex))
        UserDefaults.standard.set(location.text, forKey: "key21" + String(selectedIndex))
        UserDefaults.standard.set(professor.text, forKey: "key31" + String(selectedIndex))
        
        course.resignFirstResponder()
        location.resignFirstResponder()
        professor.resignFirstResponder()
        
        return true
    }
    


}
