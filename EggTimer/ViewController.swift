//
//  ViewController.swift
//  EggTimer
//
//  Created by tetsuta matsuyama on 2022/06/01.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    var timer = Timer()
    var player: AVAudioPlayer!
    var secondsRemaining = 0
    var increasePercentage: Float = 0.0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        increasePercentage = Float(1.0) / Float(secondsRemaining)
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            progressBar.progress += increasePercentage
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    

    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}


