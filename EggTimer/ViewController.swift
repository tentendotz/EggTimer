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
    
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        playSound()
    }
    

    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}


