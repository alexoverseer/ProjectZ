import Foundation
import ARKit

extension SCNNode {
    
    func rotateObject(rotation: Float, duration: Float) {
        let planetRotation = SCNAction.rotateBy(x: 0, y: CGFloat(rotation), z: 0, duration: TimeInterval(duration))
        self.runAction(SCNAction.repeatForever(planetRotation))
    }
}
