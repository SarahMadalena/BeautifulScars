//
//  IntroMandaView.swift
//
//  Created by Sarah Madalena on 01/04/23.
//

import SwiftUI
import AVFoundation

struct IntroMandaView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var isPlaying = true
    @State var flute: AVAudioPlayer!
    @State var fadeTimer: Timer?
    @EnvironmentObject var audioManager: SoundManager
    
    
    var body: some View {
        ZStack {
            Image("fundo_texts")
                .resizable()
                .ignoresSafeArea()
                .foregroundColor(.accentColor)
            HStack {
                Image("Cact_broto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 235, height: 150)
                    .padding(.top, 100)
                VStack {
                    Text("This is Mandá. She's a Mandacaru, a symbol of strength and endurance. Mandá is a typical and representative cactus of the Northeast, well known and loved for its peculiarities. But, although resistant, adversities can cause significant impacts on these plants…")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                        .padding([.bottom], 2)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                        .lineSpacing(10)
                }
                .padding([.bottom],320)
            }
            .padding(.horizontal)
        }
        
        .overlay(alignment: .bottomTrailing) {
            NavigationLink (destination: IntroGameView()) {
                HStack {
                    Text("Next Page")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                }
            }
            .padding(.bottom, 70)
            .padding(.trailing, 70)
        }
        .onAppear {
            audioManager.playSounds("BS")
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

extension AVAudioPlayer {
    
    func fadeVolume(from: Float, to: Float, duration: Float, completion: (() -> Void)? = nil) -> Timer? {
        volume = from
        
        
        let interval: Float = 0.1
        let range = to-from
        let step = (range*interval)/duration
        
        func reachedTarget() -> Bool {
            // 2. volume passed max/min
            
            guard volume >= 0, volume <= 1 else {
                volume = to
                return true
            }
            // 3. checks whether the volume is going forward or backward and compare current volume to target
            if to > from {
                return volume >= to
            }
            return volume <= to
        }
        
        return Timer.scheduledTimer(withTimeInterval: Double(interval), repeats: true, block: { [weak self] (timer) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                // 2. Check if we reached the target, otherwise we add the volume
                if !reachedTarget() {
                    // note that if the step is negative, meaning that the to value is lower than the from value, the volume will be decreased instead
                    self.volume += step
                } else {
                    timer.invalidate()
                    completion?()
                }
            }
        })
    }
}
