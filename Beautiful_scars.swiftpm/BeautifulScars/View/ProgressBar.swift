//
//  File.swift
//  
//
//  Created by Sarah Madalena on 08/04/23.
//

//import Foundation
//import SwiftUI
//
//struct ProgressBar: View {
//    @State var progress: CGFloat = 0
//    @State var percent: CGFloat = 0
//
//    var body: some View {
//        ZStack {
//            GeometryReader {proxy in
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .frame(width: 45, height: 600)
//                    .foregroundColor(Color.gray.opacity(0.65))
//                    .position(x: proxy.size.width * 0.9, y: proxy.size.height * 0.5)
//
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .fill(Color("Green"))
//                    .frame(width: proxy.size.width * progress)
//
//                Text("\(Int(percent))%")
//                    .font(.system(size: 30, weight: .medium))
//                    .foregroundColor(Color.white)
//            }
//        }
//    }
//}
