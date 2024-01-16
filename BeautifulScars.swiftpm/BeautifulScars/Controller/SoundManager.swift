//
//  File.swift
//  
//
//  Created by Sarah Madalena on 19/04/23.
//

import Foundation
import AVFoundation

class SoundManager: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer?
    
    func playSounds(_ myAudio : String, audioExtension: String = "mp3") {
        guard let soundURL = Bundle.main.url(
            forResource: myAudio,
            withExtension: audioExtension
        ) else {
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.volume = 1
            audioPlayer?.play()
        } catch {
            print(error)
        }
    }
    
    func stopSounds() {
        audioPlayer?.stop()
    }
}
