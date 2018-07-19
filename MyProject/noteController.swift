//
//  noteController.swift
//  MyProject
//
//  Created by zm on 2018/7/16.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class noteController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        noteview.text = UserDefaults.standard.string(forKey: "key")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBOutlet weak var btt: UIButton!
    
   
    
    @IBAction func change(_ sender: Any) {
        let casenumber : Int = Int(arc4random_uniform(3))

        if casenumber == 0 {
            btt.setTitle("WHAT ABOUT TEACHERS", for: .normal)
        }else if casenumber == 1 {
             btt.setTitle("FRIENDS IN THE SAME CLASS", for: .normal)
        }else if casenumber == 2 {
             btt.setTitle("WHAT ABOUT FINALS", for: .normal)
        }else {
            btt.setTitle("ARE CLASSROOMS FAR AWAY", for: .normal)
        }
    
    
    }
    
    
    
    @IBAction func returnbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var noteview: UITextView!
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
         UserDefaults.standard.set(noteview.text, forKey: "key")
        if text == "\n" {
            noteview.resignFirstResponder()
            return false
        }
       //UserDefaults.standard.set(noteview.text, forKey: "key")
        return true
            
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
