//
//  ViewController.swift
//  MyProject
//
//  Created by zm on 2018/7/10.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startbutton.layer.cornerRadius = startbutton.frame.height / 2
        
    
        startbutton.layer.borderColor = UIColor.black.cgColor
        startbutton.layer.borderWidth = 2
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var startbutton: UIButton!

    @IBAction func gotonext(_ sender: Any) {

        let feedbackGenerator : UIImpactFeedbackGenerator
        feedbackGenerator = UIImpactFeedbackGenerator()
        feedbackGenerator.prepare()
        
        
        
        let alert = UIAlertController(title: "OLE!", message: "GET READY FOR THE NEXT QUARTER🎉", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("LETS GO!!!", comment: "Default action"), style: .default, handler: { _ in
           
            feedbackGenerator.impactOccurred()
            self.performSegue(withIdentifier: "second", sender: UIButton())
        
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    //let date = Date()
    
    
}

