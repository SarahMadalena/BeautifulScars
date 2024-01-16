//
//  FallingProgressView.swift
//
//  Created by Sarah Madalena on 04/04/23.
//

import SwiftUI
import AVFoundation

enum Heart {
    case broken
    case full
}

struct FallingProgressView: View {
    @State var progress: CGFloat = 0.0
    @State var heart: Heart = Heart.broken
    @State private var foregroundBarHeight: CGFloat = 0.0
    @State var isPlaying = true
    
    // - MARK: PopUps -
    @State var popupOne: Bool = false
    @State var popupTwo: Bool = false
    @State var popupThree: Bool = false
    @State var popupFour: Bool = false
    @EnvironmentObject var audioManager: SoundManager
    
    private let backBarHeight: CGFloat = 500.0
    private let maxProgress: CGFloat = 8.0
    
    var didCompleteProgress: ((FallingProgressView) -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            FallingHeartsView(
                pause: $popupOne, 
                progress: $progress,
                heartToCollect: heart
            )
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
            
            GeometryReader { proxy in
                VStack {
                    ZStack(alignment: .bottom) {
                        Capsule()
                            .fill(.black.opacity(0.45))
                            .frame(width: 50, height: backBarHeight)
                        Capsule()
                            .fill(Color.green)
                            .frame(width: 50, height: foregroundBarHeight)
                    }
                    Text("\(Int(progress))")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundColor(Color.black)
                }
                .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)
            }
        }
        .overlay {
            PopupView(popupOne: $popupOne)
                .onAppear {
                    audioManager.playSounds("popIntro", audioExtension: "mp3")
                }
            SecondPopupView(popupTwo: $popupTwo)
                .onAppear {
                    audioManager.playSounds("myAudio", audioExtension: "m4a")
                }
            ThirdPopupView(popupThree: $popupThree)
                .onAppear {
                    audioManager.playSounds("popIntro", audioExtension: "mp3")
                }
            FourthPopupView(popupFour: $popupFour)
                .onAppear {
                    audioManager.playSounds("myAudio", audioExtension: "m4a")
                }
        }
        .onChange(of: progress) { newValue in
            foregroundBarHeight = (progress * (backBarHeight/maxProgress))
            if foregroundBarHeight > 500 { foregroundBarHeight = 500 }
            if newValue == 8 { didCompleteProgress?(self) }
        }
        .onAppear { audioManager.stopSounds() }
    }
}

