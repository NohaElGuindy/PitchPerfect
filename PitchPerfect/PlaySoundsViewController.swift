//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Noha on 13.05.19.
//  Copyright © 2019 udacity. All rights reserved.
//

import UIKit
import AVFoundation
class PlaySoundsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        
    }
    var recordedAudioURL : URL!
    @IBOutlet weak var snailButton : UIButton!
    @IBOutlet weak var rabbitButton : UIButton!
    @IBOutlet weak var echoButton :UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton : UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
   
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, echo, reverb, chipmunk, vader
    }
    @IBAction func playSoundForButton(_ sender: UIButton){
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopSoundPressed(_ sender: AnyObject){
       
        stopAudio()
    }
    

    

}
