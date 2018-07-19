//
//  calendarViewController.swift
//  MyProject
//
//  Created by zm on 2018/7/18.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class calendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "none", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "                              MONDAY"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "                              TUESDAY"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "                             WEDNSDAY"
        } else if indexPath.row == 3 {
            cell.textLabel?.text = "                             THURSDAY"
        }else if indexPath.row == 4{
            cell.textLabel?.text = "                                 FRIDAY"
            
        }else if indexPath.row == 5 {
            cell.textLabel?.text = "                              SATURDAY"
        } else {
            cell.textLabel?.text = "                                SUNDAY"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
  
    
    var selectedIndex = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "nice", sender: self)
    }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destinationviewcontroller = segue.destination as? DateViewController{
                
                
                if selectedIndex == 0 {
                    destinationviewcontroller.title = "Monday🤢"
                } else if selectedIndex == 1 {
                    destinationviewcontroller.title = "Tuesday😷"
                } else if selectedIndex == 2 {
                    destinationviewcontroller.title = "Wednsday🙄"
                } else if selectedIndex == 3 {
                    destinationviewcontroller.title = "Thursday😳"
                } else if selectedIndex == 4{
                    destinationviewcontroller.title = "Friday🤣"
                } else if selectedIndex == 5 {
                     destinationviewcontroller.title = "Saturday😆"
                } else {
                     destinationviewcontroller.title = "Sunday😢"
                }
                
                
                
            }

    }
    
    
    @IBAction func back(_ sender: Any) {
     dismiss(animated: true, completion: nil)
    }
    
}
