//
//  SwiftUIView.swift
//
//  Created by Sarah Madalena on 03/04/23.
//

import Foundation
import SwiftUI

struct PopupView: View {
    @Binding var popupOne: Bool
    
    var body: some View {
        if popupOne {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popStageOne
                        .transition(.scale)
                }
        }
    }
    
    var popStageOne: some View {
        VStack{
            VStack{
                Text("Stage One")
                    .padding(.top,3)
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 36, weight: .medium, design: .rounded))
                Divider()
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .padding(.top, -10)
                
                HStack {
                    ZStack {
                        Circle()
                            .scaledToFill()
                            .foregroundColor(.white)
                            .frame(width: 120, height: 120)
                            .overlay {
                                Image("Pote")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 85, height: 85)
                                    .shadow(radius: 4)
                                    .padding(EdgeInsets(top: 18, leading: 1, bottom: 7, trailing: 0))
                            }
                    }
                    ZStack {
                        Circle()
                            .scaledToFill()
                            .foregroundColor(.white)
                            .frame(width: 120, height: 120)
                            .overlay {
                                Image("broken_heart")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 4)
                                    .padding(EdgeInsets(top: 18, leading: 1, bottom: 7, trailing: 0))
                            }
                    }
                }
                
                Text("**Drag** the vase at the bottom left of the screen and collect the **broken** hearts hearts and see what bad times Mandá has gone through!")
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 26, weight: .regular, design: .rounded))
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Button(action: {
                withAnimation {
                    popupOne = false
                }
            }) {
                Text("START")
                    .frame(width: 200, height: 45)
                    .font(.system(size: 30, weight: .bold))
                    .background(Color(.white))
                    .foregroundColor(Color(.systemCyan))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom, 15)
            }
        }
        .frame(width: 500) //tamanho popup
        .background {
            Rectangle()
                .fill(Color(red: 250/255, green: 197/255, blue: 227/255))
                .foregroundColor(.black)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 30)
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
