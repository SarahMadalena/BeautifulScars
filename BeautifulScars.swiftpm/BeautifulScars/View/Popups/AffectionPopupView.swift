//
//  AffectionPopupView.swift
//  
//
//  Created by Sarah Madalena on 14/04/23.
//

import Foundation
import SwiftUI

struct AffectionPopupView: View {
    @Binding var popupHappy: Bool
    
    var body: some View {
        if popupHappy {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popAffection
                        .transition(.scale)
                }
        }
    }

    var popAffection: some View {
        VStack{
            VStack{
                Text("AFFECTION")
                    .padding(.top,5)
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 36, weight: .medium, design: .monospaced))
                Divider()
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .padding(.top, -10)
                Text("Affectivity makes us flourish and brings more color to life, helping us grow stronger and more resistant, even during life's most difficult times. But this is only possible if there is an environment of well-being, in which there's no lack of affection and moments of happiness. Love and care for those you cherish, especially if it's yourself.")
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 26, weight: .regular, design: .rounded))
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Button(action: {
                withAnimation {
                    popupHappy = false
                }
            }) {
                NavigationLink(
                    destination: FinalView()
                ) {
                    Text("FINAL")
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

