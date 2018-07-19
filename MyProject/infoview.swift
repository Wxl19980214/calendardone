//
//  infoview.swift
//  MyProject
//
//  Created by zm on 2018/7/12.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class infoview: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! customcell
        
        if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2){
        
        cell.textLabel?.text = "Registration Pass " + String(indexPath.row + 1)
        } else if (indexPath.row == 3) {
        
            cell.textLabel?.text = "Last Day To Drop A Class"
        }else if (indexPath.row == 4) {
            
            cell.textLabel?.text = "Last Dat To Drop A Class W/F"
            
        }else if (indexPath.row == 5){
            
            cell.textLabel?.text = "Last Dat To Change Grade Option"
        }else if (indexPath.row == 6){
            
            cell.textLabel?.text = "Last Dat To Change Grade Option W/F"
        }else{
            
            cell.textLabel?.text = "First Day of Instruction"
        }
            
        
        
        
        
        return cell
    }
    
    
    var selectedIndex = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "regi", sender: self)
    }
    
    
    @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationviewcontroller = segue.destination as? registrationViewController {
        
            destinationviewcontroller.selectedIndex = selectedIndex
            destinationviewcontroller.title = "HEADS UP"
        }
        
    }
    
    func updatecurrentdate(){
        
        
        let date : Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let todaysDate = dateFormatter.string(from: date)
        datelabel.text = todaysDate
        
        let time : Date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        let todaystime = timeFormatter.string(from: time)
        timelabel.text = todaystime
        
        
    }
    

    
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
          self.updatecurrentdate()
            
    }
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
