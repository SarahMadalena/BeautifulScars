//
//  IntroGameView.swift
//  
//
//  Created by Sarah Madalena on 01/04/23.
//

import Foundation
import SwiftUI

struct IntroGameView: View {
    
    @State var cact = "cact_0"
    
    var body: some View {
        ZStack {
            Image("fundo_texts")
                .resizable()
                .ignoresSafeArea()
                .foregroundColor(.accentColor)
            HStack {
                Image(cact)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 235, height: 150)
                    .padding(.top, 100)
                    .onAppear(perform: {
                        
                        var index = 0
                        
                        Timer
                            .scheduledTimer(withTimeInterval: 0.16, repeats: true){
                                _ in
                                
                                cact = "cact_\(index)"
                                
                                index += 1
                                
                                if(index > 8) {
                                    index = 0
                                }
                            }
                    })
                VStack {
                    Text("The same happened with Mandá, who went through many bad phases throughout her life. In addition to not having a good relationship with her parents, she still feels very alone and, many times, cannot feel loved.")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                        .padding([.bottom], 2)
                        .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 80))
                        .lineSpacing(10)
                }
                .padding([.bottom],320)
            }
            .padding(.horizontal)
            
            
        }
        .overlay(alignment: .bottomTrailing) {
            NavigationLink(
                destination:
                    FallingProgressView(
                        heart: .broken,
                        popupOne: true,
                        didCompleteProgress: { view in
                            view.popupTwo = true
                        }
                    )
            ) {
                HStack {
                    Text("Next Page")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                }
                .padding(.bottom, 70)
                .padding(.trailing, 70)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}
