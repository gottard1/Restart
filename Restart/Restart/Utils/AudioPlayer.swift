//
//  AudioPlayer.swift
//  Restart
//
//  Created by Marcel Felipe Gottardi Anesi on 19/03/24.
//

import AVFoundation

class AudioPlayer {
    
    static var audioPlayer: AVAudioPlayer?
    
    static func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not play the sound file.")
            }
        }
    }
}

