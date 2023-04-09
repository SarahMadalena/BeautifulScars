//
//  DefinitionView.swift
//  Beautiful_scars
//
//  Created by Sarah Madalena on 30/03/23.
//

import SwiftUI

struct DefinitionView: View {
    var body: some View {
        NavigationView {
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
                    Text("1. The action or result of affecting the mind in some way; a mental state brought about by any influence; an emotion, feeling.")
                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                        .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                        .padding([.bottom], 3)
                    Text("2. That which a person feels in regard to something; attitude, esp. emotional attitude, sentiment; opinion or belief based on emotion or intuition and not solely on reason.")
                        .font(.system(size: 32, weight: .semibold, design: .rounded))
                        .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                    
                    Spacer()
                    
                    NavigationLink (destination: IntroMandaView()) {
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
        .navigationViewStyle(.stack)
    }
}

struct DefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
