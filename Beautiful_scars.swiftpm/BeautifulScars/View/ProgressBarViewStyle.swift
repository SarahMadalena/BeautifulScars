//
//  File.swift
//  
//
//  Created by Sarah Madalena on 08/04/23.
//

import Foundation
import SwiftUI

struct ProgressBarViewStyle: View {
    @State var progress: CGFloat = 0
    @State var percent: CGFloat = 0
    
    var body: some View {
            ZStack {
                GeometryReader {proxy in
                    Capsule()
                        .fill(.gray.opacity(0.65))
                        .frame(width: 45, height: 600)
                        .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)
    
                    Capsule()
                        .fill(Color("Green"))
                        .frame(width: proxy.size.width * progress)
                }
            }
        }

    
//    func makeBody(configuration: Configuration) -> some View {
//
//        ProgressView("Loading...", value: progress, total: 100)
//            .progressViewStyle(ProgressBarViewStyle())
//
//        GeometryReader {proxy in
//            ZStack(alignment: .leading) {
//                RoundedRectangle(cornerRadius: 14)
//                    .frame(width: 250, height: 28)
//                    .foregroundColor(.gray)
//                    .overlay(Color.black.opacity(0.5)).cornerRadius(14)
//                    .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)
//
//                RoundedRectangle(cornerRadius: 14)
//                    .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 28)
//                    .foregroundColor(.green)
//
//                Text("\(Int(percent))%")
//                    .font(.system(size: 30, weight: .medium))
//                    .foregroundColor(Color.white)
//            }
//            .padding()
//        }
//    }
}
//var body: some View {
//        ZStack {
//            FallingHeartsView(pause: $popupOne)
//                .edgesIgnoringSafeArea(.all)
//
//            GeometryReader {proxy in
//                Capsule()
//                    .fill(.gray.opacity(0.65))
//                    .frame(width: 45, height: 600)
//                    .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)
//
//                Capsule()
//                    .fill(Color("Green"))
//                    .frame(width: proxy.size.width * progress)
//            }
//        }
//        .overlay {
//            PopupView(popupOne: $popupOne)
//        }
//    }
