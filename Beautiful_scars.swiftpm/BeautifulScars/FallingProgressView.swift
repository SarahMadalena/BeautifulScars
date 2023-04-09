//
//  FallingProgressView.swift
//  Beautiful_scars
//
//  Created by Sarah Madalena on 04/04/23.
//

import SwiftUI

//struct FallingProgressView: View {
//    @State var popupOne: Bool = true
//
//    var body: some View {
//            FallingHeartsView(pause: $popupOne)
//                .edgesIgnoringSafeArea(.all)
//                .overlay {
//            PopupView(popupOne: $popupOne)
//        }
//    }
//}

struct FallingProgressView: View {

    @State var progress: CGFloat = 0.5
    @State var popupOne: Bool = true

    var body: some View {
        ZStack {
            FallingHeartsView(pause: $popupOne)
                .edgesIgnoringSafeArea(.all)

            GeometryReader {proxy in
                Capsule()
                    .fill(.gray.opacity(0.65))
                    .frame(width: 45, height: 600)
                    .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)

                Capsule()
                    .fill(Color.green)
                    .frame(width: proxy.size.width * progress)
                    .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)
            }
        }
        .overlay {
            PopupView(popupOne: $popupOne)
        }
    }
}

struct FallingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FallingProgressView()
    }
}
