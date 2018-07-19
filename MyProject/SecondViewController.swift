//
//  SecondViewController.swift
//  MyProject
//
//  Created by zm on 2018/7/12.
//  Copyright © 2018年 fusion. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        music.isOn = false
        schedule.layer.cornerRadius = schedule.frame.height / 2
        schedule.layer.borderColor = UIColor.black.cgColor
        schedule.layer.borderWidth = 2
        schedule.layer.shadowColor = UIColor.black.cgColor
        schedule.layer.shadowRadius = 8
        schedule.layer.shadowOpacity = 1
        schedule.clipsToBounds = false
        schedule.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        note.layer.cornerRadius = note.frame.height / 2
        note.layer.borderColor = UIColor.black.cgColor
        note.layer.borderWidth = 2
        note.layer.shadowColor = UIColor.black.cgColor
        note.layer.shadowRadius = 2
        note.layer.shadowOffset = CGSize(width: 0, height: 0)
        note.layer.shadowOpacity = 1
    
        info.layer.cornerRadius = info.frame.height / 2
        info.layer.shadowOpacity = 1
        info.layer.borderColor = UIColor.black.cgColor
        info.layer.borderWidth = 2
        info.layer.shadowColor = UIColor.black.cgColor
        info.layer.shadowRadius = 2
        info.layer.shadowOffset = CGSize(width: 0, height: 0)
            }

   
    @IBOutlet weak var schedule: UIButton!
    
    @IBOutlet weak var note: UIButton!
    
    @IBOutlet weak var info: UIButton!
    
    @IBOutlet weak var music: UISwitch!
    
    var player: AVAudioPlayer = AVAudioPlayer()
    func playSound(named soundName: String){
        let soundURL = Bundle.main.path(forResource: soundName, ofType: "mp3")
        player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundURL!) as URL, fileTypeHint: AVFileType.mp3.rawValue)
        player.play()
    }
    
    @IBAction func openoff(_ sender: Any) {
    
        if music.isOn == true {
            playSound(named: "music")
        } else {
            player.stop()
        }
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
