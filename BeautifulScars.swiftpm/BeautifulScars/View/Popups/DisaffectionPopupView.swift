//
//  File.swift
//  
//
//  Created by Sarah Madalena on 12/04/23.
//

import Foundation
import SwiftUI

struct DisaffectionPopupView: View {
    @Binding var popupSad: Bool
    
    var body: some View {
        if popupSad {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popDisaffection
                        .transition(.scale)
                }
        }
    }

    var popDisaffection: some View {
        VStack{
            VStack{
                Text("DISAFFECTION")
                    .padding(.top,5)
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 36, weight: .medium, design: .monospaced))
                Divider()
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .padding(.top, -10)
                Text("The lack of affection can leave scars that last for a lifetime, as it happened with Manda. The lack of empathy, such as in actions that seem or may even be called jokes, especially when it comes from the people we love, has an influence on physical and mental problems. It often provokes feelings such as fear or sadness, and may even lead to depression. Be more careful and attentive to the people you love, including yourself.")
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 26, weight: .regular, design: .rounded))
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Button(action: {
                withAnimation {
                    popupSad = false
                }
            }) {
                NavigationLink(
                    destination: FallingProgressView(
                        heart: .full,
                        popupThree: true,
                        didCompleteProgress: { view in
                            view.popupFour = true
                        }
                    )
                ) {
                    Text("STAGE TWO")
                        .frame(width: 250, height: 55)
                        .font(.system(size: 30, weight: .bold))
                        .background(Color(.white))
                        .foregroundColor(Color(.systemCyan))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.bottom, 15)
                }
            }
            
        }
        .frame(width: 900, height: 400) //tamanho popup
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
