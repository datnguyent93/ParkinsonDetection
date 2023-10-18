//
//  PlaySound.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import Foundation
import AVFoundation


var player: AVAudioPlayer!
func playSound(soundName: String, extension: String, delay: Double)
    {
         let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        guard url != nil else{return }
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            //player?.play()
        }catch {
            print("Error playing sound.")
        }
        
        let seconds = delay//Time To Delay
           let when = DispatchTime.now() + seconds

           DispatchQueue.main.asyncAfter(deadline: when) {
               player.play()
           }
    } 
