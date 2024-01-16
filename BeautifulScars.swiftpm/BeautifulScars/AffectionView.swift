//
//  AffectionView.swift
//  
//
//  Created by Sarah Madalena on 14/04/23.
//

import Foundation
import SwiftUI

struct AffectionView: View{
    @State var fillHeartCounter: Int = 8
    @State var imageName: String = "Happy_1"
    @State var idle: Bool = false
    @State var idle2: Bool = false
    @State var popupHappy: Bool = false
    @EnvironmentObject var audioManager: SoundManager
    
    var body: some View {
        ZStack {
            Image("fundo_stage")
                .resizable()
                .ignoresSafeArea()
            
            Image("star")
                .resizable()
                .scaledToFill()
                .scaleEffect(idle2 ? 1.5 : 1)
                .frame(width: 25, height: 25)
                .offset(
                    x: 380,
                    y: -300
                )
                .animation(Animation.linear.repeatForever().speed(0.5), value: idle2)
            
            Image("star")
                .resizable()
                .scaledToFill()
                .scaleEffect(idle2 ? 1.5 : 1)
                .frame(width: 25, height: 25)
                .offset(
                    x: -350,
                    y: -230
                )
                .animation(Animation.linear.repeatForever().speed(0.5), value: idle2)
            
            Image("star")
                .resizable()
                .scaledToFill()
                .scaleEffect(idle2 ? 1.5 : 1)
                .frame(width: 20, height: 20)
                .offset(
                    x: -220,
                    y: -140
                )
                .animation(Animation.linear.repeatForever().speed(0.5), value: idle2)
            
            VStack {
                Text("AFFECTION STAGE")
                    .font(.system(size: 42, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Color.init(red: 32/255, green: 39/255, blue: 55/255))
                    .padding(.top, 30)
                
                Spacer()
                
                GeometryReader { geo in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .offset(CGSize(width: 25, height: 0))
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
                    //                        .border(Color.green) //só para saber onde está o frame
                        .scaleEffect(idle ? 1.05 : 1)
                        .animation(Animation.linear(duration: 1.5).repeatForever(), value: idle)
                }
                
                Button {
                    fillHeartCounter -= 2
                    if fillHeartCounter == 6 {
                        imageName = "Happy_2"
                    }
                    if fillHeartCounter == 4 {
                        imageName = "Happy_3"
                    }
                    if fillHeartCounter == 2 {
                        imageName = "Happy_4"
                    }
                    if fillHeartCounter == 0 {
                        imageName = "Happy_5"
                        withAnimation(.easeIn(duration: 1.0).delay(2.0)) {
                            popupHappy = true
                        }
                    }
                } label: {
                    
                    ZStack  {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .tint(.black)
                            .blur(radius: 20)
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 120, height: 120)
                            .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 5.5)
                            .frame(width: 120, height: 120)
                            .tint(.white)
                        Image("heartButton_pote")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                        
                    }.overlay {
                        BadgeNumber(text: fillHeartCounter.description)
                            .offset(x: 15, y: 15)
                    }
                }
                .padding(50)
                
                Spacer()
            }
        }
        .overlay {
            AffectionPopupView(popupHappy: $popupHappy)
                .position( x: UIScreen.main.bounds.midX, y:UIScreen.main.bounds.midY)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            idle = true
            idle2 = true
            audioManager.playSounds("BS", audioExtension: "mp3")
        }
        .ignoresSafeArea()
    }
}

struct BadgeNumber: View {
    let text: String
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 55, height: 55)
                .tint(.white)
            
            Text(text)
                .font(.system(size: 35, weight: .semibold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}
