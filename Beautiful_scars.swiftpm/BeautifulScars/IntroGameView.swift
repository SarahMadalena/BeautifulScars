//
//  IntroGameView.swift
//  
//
//  Created by Sarah Madalena on 01/04/23.
//

import SwiftUI

struct IntroGameView: View {
    
    @State var cact = "cact_0"
    
    var body: some View {
        HStack {
            ZStack {
                Image("fundo_texts")
                    .resizable()
                    .ignoresSafeArea()
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading) {
                    Text("O mesmo aconteceu com Manda, que passou por muitas fases ruins ao longo de sua vida. Além de não ter uma boa relação com seus pais, ainda se sente muito sozinho e não consegue se sentir amado.")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                        .padding([.bottom], 2)
                    
                    Spacer()
                    
                    HStack {
                        Image(cact)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 230, height: 180)
                            .border(Color.green) //só para saber onde está o frame
                            .padding(.bottom, 50)
                            .onAppear(perform: {
                                
                                var index = 0
                                
                                Timer
                                    .scheduledTimer(withTimeInterval: 0.15, repeats: true){
                                        _ in
                                        
                                        cact = "cact_\(index)"
                                        
                                        index += 1
                                        
                                        if(index > 8) {
                                            index = 0
                                        }
                                    }
                            })

                        Spacer()
                        
                        Label("Opening", systemImage: "play.fill")
                            .font(.system(size: 45, weight: .bold, design: .rounded))
                            .foregroundStyle(Color.init(red: 250/255, green: 197/255, blue: 227/255))
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
