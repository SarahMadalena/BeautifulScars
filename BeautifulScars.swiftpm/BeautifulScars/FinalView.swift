//
//  FinalView.swift
//  
//
//  Created by Sarah Madalena on 17/04/23.
//

import SwiftUI

struct FinalView: View {
    @State var rotate: Bool = false
    @State var cloudAnimation: Bool = false
    @State var starAnimation: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                GeometryReader { proxy in
                    ZStack {
                        Image("back_final")
                            .resizable()
                            .scaledToFill()
                        
                        Image("finalCact")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 280, height: 280)
                            .offset(
                                x: -440,
                                y: 90
                            )
                        
                        Image("flower")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .rotationEffect(
                                rotate ?
                                Angle(degrees: 360) :
                                    Angle(degrees: 0)
                            )
                            .animation(
                                Animation.linear.speed(0.1).repeatForever(autoreverses: false),
                                value: rotate
                            )
                            .offset(
                                x: -380,
                                y: -140
                            )
                        
                        Image("bird")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 62, height: 62)
                            .offset(
                                x: -470,
                                y: -180
                            )
                        
                        Image("star")
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(starAnimation ? 1.5 : 1)
                            .frame(width: 15, height: 15)
                            .offset(
                                x: 360,
                                y: -200
                            )
                        
                        Image("star")
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(starAnimation ? 1.5 : 1)
                            .frame(width: 15, height: 15)
                            .offset(
                                x: -350,
                                y: -230
                            )
                        
                        ZStack {
                            Circle()
                                .scaledToFill()
                                .foregroundColor(.yellow)
                                .frame(width: 180, height: 180)
                                .opacity(0.2)
                                .blur(radius: 6.0)
                                .offset(
                                    x: 440,
                                    y: -320
                                )
                            Image("sun")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: 180)
                                .rotationEffect(
                                    rotate ?
                                    Angle(degrees: 360) :
                                        Angle(degrees: 0)
                                )
                                .animation(
                                    Animation.linear.speed(0.1).repeatForever(autoreverses: false),
                                    value: rotate
                                )
                                .offset(
                                    x: 440,
                                    y: -320
                                )
                            
                            Image("cloud")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .offset(
                                    x: cloudAnimation ?
                                    proxy.frame(in: .local).maxX :
                                        -proxy.frame(in: .local).maxX,
                                    y: -335
                                )
                        }
                        .onAppear {
                            withAnimation {
                                rotate = true
                            }
                        }
                        
                        ZStack {
                            Image("boardFinal")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 600, height: 600)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            VStack {
                                Text("Life is like a roller coaster, it won't always be okay and it won't always be bad, but a little affection certainly helps in those moments, especially when we think there's no light at the end of the tunnel. Small attitudes can change the way we see our days. \n \n When you feel lonely, try to do things that make you happy, like listen to ypur favorite music. **BE STRONG, BUT ABOVE ALL, BE KIND TO YOURSELF!**")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .frame(width: 550)
                                    .foregroundStyle(Color.init(red: 239/255, green: 252/255, blue: 226/255))
                                    .lineSpacing(10)    
                                
                                NavigationLink(
                                    destination: InitialView()
                                ) {
                                    Text("PLAY AGAIN")
                                        .frame(width: 200, height: 55)
                                        .font(.system(size: 30, weight: .bold))
                                        .background(Color(.white))
                                        .foregroundColor(Color(.systemCyan))
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .padding(.bottom, 15)
                                }
                                .padding([.top], 50)
                            }
                            .frame(width: proxy.size.width * 0.5, height: proxy.size.height)
                        }
                        .position(x: proxy.size.width/2 + 10, y: proxy.size.height/2 + 20)
                    }
                    .onAppear {
                        withAnimation(Animation.linear.repeatForever().speed(0.5)) {
                            starAnimation = true
                        }
                        withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
                            cloudAnimation = true
                        }
                        withAnimation {
                            rotate = true
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
}
