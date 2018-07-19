//
//  registrationViewController.swift
//  MyProject
//
//  Created by zm on 2018/7/12.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit
import UserNotifications


class registrationViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate, UNUserNotificationCenterDelegate {

    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            if error != nil {
                print("no notification")
            }
        })
        
        
        
        //------------------------------------------------------
        self.switch1.isOn = false
        background.image = #imageLiteral(resourceName: "bc")
        decoration.image = #imageLiteral(resourceName: "decoration")
        fromdate.text = UserDefaults.standard.string(forKey: "key1" + String(selectedIndex))
        month.text = UserDefaults.standard.string(forKey: "key2" + String(selectedIndex))
        date.text = UserDefaults.standard.string(forKey: "key3" + String(selectedIndex))
        switch1.isOn = UserDefaults.standard.bool(forKey: "key5" + String(selectedIndex))
        
        if selectedIndex == 0 {
            tips.text = "Tips: 12 workload max"
            
        } else if selectedIndex == 1 {
              tips.text = "Tips: 19 workload max"
            
        } else if selectedIndex == 2 {
              tips.text = "Tips: 21 max, send petition for more"
            
        } else if selectedIndex == 3 {
              tips.text = "Tips: drop the class without paying"
        
        } else if selectedIndex == 4 {
              tips.text = "Tips: you need to pay for a fine"
            
        } else if selectedIndex == 5 {
              tips.text = "Tips: change from lettergrade to pnp"
            
        } else if selectedIndex == 6 {
              tips.text = "Tips: you need to pay for a fine"
            
        } else {
              tips.text = "Tips: get ready for the brand new start!"
        }
   
    
    
    }

   
    @IBOutlet weak var tips: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var decoration: UIImageView!
    

    @IBOutlet weak var fromdate: UITextField!
    
    @IBOutlet weak var month: UITextField!
    
    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var switch1: UISwitch!
    @IBAction func testing(_ sender: Any) {
        
        UserDefaults.standard.set(switch1.isOn, forKey: "key5" + String(selectedIndex))
        
        if switch1.isOn {
            //gives alert
            
            let alert = UIAlertController(title: "Be Careful!!", message: "You are going to be notified at 8 am on this day", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Understand", comment: "Default action"), style: .default, handler: { _ in
                
            }))
            self.present(alert, animated: true, completion: nil)
        
            //gives notification
            let content = UNMutableNotificationContent()
            content.body = "Be sure to check what day is it today"
            content.title = "HEADS UP"
            content.subtitle = "IMPORTANT"
            content.badge = 1
    
            
            let calendar = Calendar.current
            let components = DateComponents(year: year1, month: month1, day: date1, hour: hour1, minute: minute1) // Set the date here when you want Notification
            let date = calendar.date(from: components)
            let comp2 = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: date!)
            let trigger = UNCalendarNotificationTrigger(dateMatching: comp2, repeats: true)
            
            let request = UNNotificationRequest(identifier: "214", content: content, trigger: trigger)
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().add(request,withCompletionHandler: nil)
            
        } else {
            //does nothing
            print("no")
       
        }
    
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    

    var year1 : Int = 0
    var date1 : Int = 0
    var month1 : Int = 0
    let hour1 : Int = 8
    let minute1 : Int = 0
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        
        if fromdate.text == ""{
            year1 = 2018
        } else {
            year1 = Int(fromdate.text!)!
        }
        
        if month.text == "" {
            month1 = 7
        } else {
            month1 = Int(month.text!)!
        }
        
        if date.text == "" {
            date1 = 20
        } else {
            date1 = Int(date.text!)!

        }
        
       // year1 = Int(fromdate.text!)!
        //month1 = Int(month.text!)!
        //date1 = Int(date.text!)!
        
        UserDefaults.standard.set(fromdate.text, forKey: "key1" + String(selectedIndex))
        UserDefaults.standard.set(month.text, forKey: "key2" + String(selectedIndex))
        UserDefaults.standard.set(date.text, forKey: "key3" + String(selectedIndex))
       
        fromdate.resignFirstResponder()
        month.resignFirstResponder()
        date.resignFirstResponder()
        

        return true
    }
   
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
