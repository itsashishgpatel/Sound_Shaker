//
//  ViewController.swift
//  Sound_Shaker
//
//  Created by IMCS2 on 8/8/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
        var player = AVAudioPlayer()
  //  var player : AVAudioPlayer!
    
    @IBAction func Play(_ sender: Any) {
        player.play()
    }
    
    
    @IBAction func Pause(_ sender: Any) {
        player.pause()
    }
    
    
    @IBAction func Slide(_ sender: Any) {
        player.volume = Slide.value
        
    }
    
    
    @IBOutlet weak var Slide: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "GaliGali", ofType: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))}
            
        catch{
            print("error")
        }
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:
            #selector(self.swipped(gesture:)))
        
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
       let swipeLeft = UISwipeGestureRecognizer(target: self, action:
           #selector(self.swipped(gesture:)))
        
        
        
        swipeRight.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        
        
        }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    
    {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            print(" Device was shaken")
        }
        
    }
    
    
    @objc func swipped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
                print(" Right Swipe")
            }
            else {
                print("Left")
            }
            }
        }
    }
    
        





