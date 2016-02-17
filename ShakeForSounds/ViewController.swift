//
//  ViewController.swift
//  ShakeForSounds
//
//  Created by Dustin M on 2/16/16.
//  Copyright © 2016 Vento. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var array = ["rm_wubba", "rm_wrecked", "rm_tinyrick", "rm_showme", "rm_rubber", "rm_myman", "rm_ilike"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event!.subtype == UIEventSubtype.MotionShake {
            
            var randomNumber = Int(arc4random_uniform(UInt32(array.count)))
            
            var audioPath = NSBundle.mainBundle().pathForResource(array[randomNumber], ofType: "wav")
            
            var error: NSError? = nil

            do {
                
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            
            player.play()
            
            }catch{
            //process errors here
            }
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

