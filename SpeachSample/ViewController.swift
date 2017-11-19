//
//  ViewController.swift
//  SpeachSample
//
//  Created by 宮崎裕之 on 2017/11/03.
//  Copyright © 2017年 Hiroyuki Miyazaki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var rate:Float = AVSpeechUtteranceDefaultSpeechRate
    var pitchMultiplier:Float = 1.0
    var volume:Float = 1.0
    var preUtternceDelay:TimeInterval = 0.0
    
    @IBOutlet weak var speachTextField: UITextField!
    var speachText: String = "いぶき　宿題やりましたか"
    
    @IBAction func textSpeachButtonTapped(_ sender: Any) {
        
        guard let text = speachTextField.text else{
            return
        }
        
        let utternce = AVSpeechUtterance(string:text)
        
        utternce.rate = self.rate
        utternce.pitchMultiplier = self.pitchMultiplier
        utternce.volume = self.volume
        utternce.preUtteranceDelay = self.preUtternceDelay
        
        utternce.voice = AVSpeechSynthesisVoice(language:"ja-JP")

        AVSpeechSynthesizer().speak(utternce)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.register(defaults: ["rate":1.0])
        userDefaults.register(defaults: ["pitchMultiplier":1.0])
        userDefaults.register(defaults: ["volume":1.0])
        userDefaults.register(defaults: ["preUtteranceDelay":0.0])

        rate = userDefaults.float(forKey: "rate")
        pitchMultiplier = userDefaults.float(forKey: "pitchMultiplier")
        volume = userDefaults.float(forKey: "volume")
        preUtternceDelay = userDefaults.double(forKey: "preUtteranceDelay")
        
        speachTextField.text = speachText
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToTop(segue : UIStoryboardSegue ){
        
    }
}

