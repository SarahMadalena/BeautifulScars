import SwiftUI

@main
struct MyApp: App {
    @ObservedObject var manager = SoundManager()
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { geo in
                NavigationView {
                    InitialView()
                        .overlay {
                            ZStack {
                                Image("fundo_texts")
                                    .resizable()
                                    .scaledToFill()
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)
                                    .foregroundColor(Color(red: 250/255, green: 197/255, blue: 227/255))
                                    .overlay {
                                        Text("Please, prefer use this application on landscape orientation for a better experience!")
                                            .font(.system(size: 28, weight: .bold, design: .rounded))
                                            .foregroundStyle(Color.init(red: 32/255, green: 49/255, blue: 55/255))
                                            .multilineTextAlignment(.center)
                                    }
                               
                            }
                            .opacity(geo.size.width < geo.size.height ? 1 : 0)
                        }
                    
                }
                .navigationViewStyle(.stack)
                .environmentObject(manager)
                .environment(\.mainWindowSize, geo.size)
            }
        }
    }
}

private struct MainWindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }
}
