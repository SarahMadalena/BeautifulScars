//
//  SwiftUIView.swift
//  SmelliciousTest
//
//  Created by Sarah Madalena on 03/04/23.
//

import SwiftUI

struct PopupView: View {
    @Binding var popupOne: Bool
    
    var body: some View {
        if popupOne {
            VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay {
                    popPositive
                        .transition(.scale)
                }
        }
    }
    
    var popPositive: some View {
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
                Text("Colete os corações quebrados e veja as fases ruins que Manda passou!")
                    .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    .font(.system(size: 24, weight: .regular, design: .rounded))
                    .padding(.trailing, 10)
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
                    .background(Color(.systemCyan))
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
