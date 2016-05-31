//
//  ViewController.swift
//  ultra
//
//  Created by 嶋本夏海 on 2016/05/30.
//  Copyright © 2016年 NatsumiShimamoto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{

    var ultraImgView : UIImageView! = UIImageView()
    
    var audioPlayer:AVAudioPlayer!
    var audioPlayer_hey:AVAudioPlayer!
    var audioPlayer_shah:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            // 音楽ファイルが"sample.mp3"の場合
            let filePath = NSBundle.mainBundle().pathForResource("ultrasoul", ofType: "mp3")
            let audioPath = NSURL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioPath)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error")
        }
        
        do {
            // 音楽ファイルが"sample.mp3"の場合
            let filePath_hey = NSBundle.mainBundle().pathForResource("hey", ofType: "mp3")
            let audioPath = NSURL(fileURLWithPath: filePath_hey!)
            audioPlayer_hey = try AVAudioPlayer(contentsOfURL: audioPath)
            audioPlayer_hey.prepareToPlay()
        } catch {
            print("Error")
        }

        do {
            // 音楽ファイルが"sample.mp3"の場合
            let filePath_shah = NSBundle.mainBundle().pathForResource("shah", ofType: "mp3")
            let audioPath = NSURL(fileURLWithPath: filePath_shah!)
            audioPlayer_shah = try AVAudioPlayer(contentsOfURL: audioPath)
            audioPlayer_shah.prepareToPlay()
        } catch {
            print("Error")
        }
        
        
        ultraImgView.frame = CGRectMake(-465, 667, 465, 270)
        ultraImgView.image = UIImage(named: "ultra.png")
        self.view.addSubview(ultraImgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(){
        audioPlayer.play()
    }
    
    @IBAction func shah(){
        audioPlayer_shah.play()
    }
    
    @IBAction func hey() {
        
        audioPlayer_hey.play()
        
        UIView.animateWithDuration(0.7, delay: 0.0,
                                   options: [UIViewAnimationOptions.CurveLinear],
                                   
                                   animations: {
                                    
                                    self.ultraImgView.center = CGPoint(x: 500,y: -270);
                                    
            },
                                   completion:{(Bool) -> Void in
                                    self.ultraImgView.layer.removeAllAnimations()
            }
        )
    }

}

