import SwiftUI
import SpriteKit

struct GameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var scene: SKScene = GameScene()
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .frame(width: 926, height: 444)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            
            AppDelegate.orientationLock = UIInterfaceOrientationMask.landscapeRight
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
            UIViewController.attemptRotationToDeviceOrientation()
            scene = GameScene()
            scene.scaleMode = .aspectFit
            scene.size = CGSize(width: 926, height: 444)
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        }
        .onDisappear {
            AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UIViewController.attemptRotationToDeviceOrientation()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(scene: SKScene())
    }
}
