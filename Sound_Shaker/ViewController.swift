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
    
    var musicList:[String] = ["Namo Namo","Aarambh","DIL CHORI","apna","kajra","teri","GaliGali"]
    var counter:Int = 0
    var player = AVAudioPlayer()
    
    
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
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    func playTheSong() {
        
        let audioPath = Bundle.main.path(forResource: musicList[counter], ofType: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))}
            
        catch{
            print("error")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        playTheSong()
        Name.text = musicList[counter]
        cover.image = UIImage(named: musicList[counter] )
        
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
            
            let  random:Int = Int.random(in: 0..<6)
            print(" Shake")
            print(random)
            counter = random
            Name.text = musicList[counter]
            cover.image = UIImage(named: musicList[counter] )
            playTheSong()
            player.play()
        }
        
    }
    
    
    @objc func swipped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
                
                playTheSong()
                Name.text = musicList[counter]
                if (counter == 0 )
                {
                    print(" Already at the right end")
                    playTheSong()
                    
                    Name.text = musicList[counter]
                    cover.image = UIImage(named: musicList[counter] )
                    
                }
                    
                else if ( counter >= 0 && counter <= musicList.count - 1) {
                    
                    counter -= 1
                    print (musicList[counter])
                    playTheSong()
                    Name.text = musicList[counter]
                    cover.image = UIImage(named: musicList[counter] )
                }
                    
                else {
                    print ("End of list")
                    playTheSong()
                    Name.text = musicList[counter]
                    cover.image = UIImage(named: musicList[counter] )
                    
                }
                
            }
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.left {
                
                if (counter >= musicList.count - 1 )
                {
                    print(" Already at the right end")
                    playTheSong()
                    Name.text = musicList[counter]
                    cover.image = UIImage(named: musicList[counter] )
                }
                    
                else if( counter <= musicList.count - 1) {
                    
                    counter += 1
                    print (musicList[counter])
                    playTheSong()
                    Name.text = musicList[counter]
                    cover.image = UIImage(named: musicList[counter] )
                }
                else {
                    print ("End of list")
                    playTheSong()
                    Name.text = musicList[counter]
                    cover.image = UIImage(named: musicList[counter] )
                }
                playTheSong()
                Name.text = musicList[counter]
                cover.image = UIImage(named: musicList[counter] )
            }
        }
    }
}








