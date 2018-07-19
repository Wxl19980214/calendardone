//
//  DateViewController.swift
//  MyProject
//
//  Created by zm on 2018/7/19.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class DateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 16
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(indexPath.row + 8) + ":00 - " + String(indexPath.row + 9) + ":00"



        return cell
    }
    var selectedIndex : Int = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "final", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationviewcontroller = segue.destination as? LastViewController {
            
           destinationviewcontroller.selectedIndex = selectedIndex
            destinationviewcontroller.title = "Go Gauchos!"
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
