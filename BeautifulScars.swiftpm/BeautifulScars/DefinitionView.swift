//
//  DefinitionView.swift
//
//  Created by Sarah Madalena on 30/03/23.
//

import SwiftUI

struct DefinitionView: View {
    @State var whenAnimationEnd = true
    
    @State private var text1: String = ""
    let historyText1: String = "1. The action or result of affecting the mind in some way; a mental state brought about by any influence; an emotion, feeling. \n 2. That which a person feels in regard to something; attitude, esp. emotional attitude, sentiment; opinion or belief based on emotion or intuition and not solely on reason."
    @State var aux = 0
    @State var rangeMarkdown: (startIndex: Int?, endIndex: Int?) = (nil, nil)
    
    var body: some View {
        ZStack {
            Image("fundo_texts")
                .resizable()
                .ignoresSafeArea()
                .foregroundColor(.accentColor)
            VStack(alignment: .leading) {
                Text("A.F.F.E.C.T.I.O.N")
                    .font(.system(size: 42, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Color.init(red: 153/255, green: 194/255, blue: 200/255))
                    .padding([.bottom], 3)
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                Text(text1)
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                    .padding([.bottom], 3)
                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 80))
                
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink (destination: IntroMandaView()) {
                        HStack {
                            Text("Next Page")
                                .font(.system(size: 34, weight: .bold, design: .rounded))
                                .foregroundStyle(
                                    whenAnimationEnd ? .gray : Color.init(red: 32/255, green: 49/255, blue: 55/255)
                                )
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 34, weight: .bold, design: .rounded))
                                .foregroundStyle(whenAnimationEnd ? .gray : Color.init(red: 32/255, green: 49/255, blue: 55/255))
                        }
                    }
                    .disabled(whenAnimationEnd)
                }
                
            }
            .padding(70)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            typeWriter1 {
                whenAnimationEnd.toggle()
            }
        }
        .ignoresSafeArea()
    }
    
    func typeWriter1(at position: Int = 0, completion: @escaping (() -> Void)) {
        
        if position == 0 {
            text1 = ""
        }
        if position < historyText1.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) {
                if historyText1[position] == "*" {
                    aux += 1
                    text1.append("")
                    typeWriter1(at: position + 1, completion: completion)
                    if aux == 2 {
                        rangeMarkdown.startIndex = position-1
                    }
                    if aux == 3 {
                        rangeMarkdown.endIndex = position
                    }
                } else {
                    text1.append(historyText1[position])
                    typeWriter1(at: position + 1, completion: completion)
                }
                
            }
        }
        if position == historyText1.count {
            completion()
            if let startRange = rangeMarkdown.startIndex {
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: startRange))
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: startRange))
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: rangeMarkdown.endIndex!))
                text1.insert("*", at: text1.index(text1.startIndex, offsetBy: rangeMarkdown.endIndex!))
            }
        }
        
    }
}
