//
//  IntroMandaView.swift
//  Beautiful_scars
//
//  Created by Sarah Madalena on 01/04/23.
//

import SwiftUI

struct IntroMandaView: View {
    var body: some View {
        HStack {
            ZStack {
                Image("fundo_texts")
                    .resizable()
                    .ignoresSafeArea()
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading) {
                    Text("Essa é Manda. Ela é um Mandacaru, símbolo de força e resistência. Manda é um cacto típico e representativo do Nordeste. Ainda que resistentes, as adversidades podem causar impactos significativos nessas plantas...")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                        .padding([.bottom], 2)
                    
                    Spacer()
                    
                    HStack {
                        Image("Cact_broto")
                            .resizable() // SpriteView com cacto hihi
                            .scaledToFill()
                            .frame(width: 530, height: 430)
                            .border(Color.green) //só para saber onde está o frame
                        
                        Spacer()
                        
                        Label("Next Page", systemImage: "arrow.right.circle.fill")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                    }
                    
                }
                .padding(70)
                .border(.red)
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}
