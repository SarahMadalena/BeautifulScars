import SwiftUI

struct InitialView: View {
    var body: some View {
        VStack(alignment: .center){
            GeometryReader { proxy in
                NavigationView {
                    ZStack {
                        Image("desert")
                            .resizable()
                            .scaledToFill()
                        ZStack {
                            Image("initial_button")
                                .resizable()
                                .scaledToFill()
                            NavigationLink(destination: DefinitionView()) {
                                Text("S T A R T")
                                    .font(.system(size: 60, weight: .semibold, design: .rounded))
                                    .foregroundStyle(Color.init(red: 198/255, green: 209/255, blue: 165/255))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 65, trailing: 0))
                            }
                        }
                        .frame(width: 330, height: 230)
                        .position(x: proxy.size.width/2 + 20, y: proxy.size.height/2 + 400)
                    }
                }
                .navigationViewStyle(.stack)
            }
        }
        .ignoresSafeArea()
    }
    
}
