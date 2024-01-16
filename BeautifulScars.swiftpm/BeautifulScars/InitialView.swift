import SwiftUI

struct InitialView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                GeometryReader { proxy in
                    ZStack {
                        Image("desert")
                            .resizable()
                            .scaledToFill()
                        Text("Beautiful Scars")
                            .font(.system(size: 110, weight: .semibold, design: .monospaced))
                            .foregroundStyle(Color.init(red: 153/255, green: 194/255, blue: 200/255))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 180, trailing: 0))
                        VStack {
                            Spacer()
                            
                            ZStack {
                                GeometryReader { geo in
                                    
                                    NavigationLink(destination: DefinitionView()) {
                                        Image("initial_button")
                                            .resizable()
                                            .scaledToFill()
                                    }
                                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.1)
                                }
                            }
                            .frame(width: 330, height: 230)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
}
