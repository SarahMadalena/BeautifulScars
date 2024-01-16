//
//  File.swift
//  
//
//  Created by Sarah Madalena on 14/04/23.
//

import Foundation
import SwiftUI

struct FourthPopupView: View {
    @Binding var popupFour: Bool
    
    var body: some View {
        if popupFour {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popCongratulationsTwo
                        .transition(.scale)
                }
        }
    }
    
    var popCongratulationsTwo: some View {
        VStack{
            VStack{
                Text("CONGRATULATIONS!")
                    .padding(.top,3)
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 36, weight: .medium, design: .monospaced))
                Divider()
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .padding(.top, -10)
                Text("Use them to see all the good that has happened to Mandá!")
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 26, weight: .regular, design: .rounded))
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Button(action: {
                withAnimation {
                    popupFour = false
                }
            }) {
                NavigationLink(destination: AffectionView()) {
                    Text("GO IT")
                        .frame(width: 200, height: 45)
                        .font(.system(size: 30, weight: .bold))
                        .background(Color(.white))
                        .foregroundColor(Color(.systemCyan))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.bottom, 15)
                }
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
