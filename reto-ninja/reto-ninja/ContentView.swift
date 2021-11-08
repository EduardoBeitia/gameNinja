
import SwiftUI

struct ContentView: View {
    
    @State var showGame: Bool = false
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Button{
                    showGame.toggle()
                } label: {
                    HStack{
                        Text("Ninja Attack")
                            .font(.title)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showGame, onDismiss: nil) {
            GameView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
