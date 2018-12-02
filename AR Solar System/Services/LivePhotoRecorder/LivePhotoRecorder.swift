import Foundation
import ARKit
import Photos

protocol LivePhotoRecorder {
    
    var onEndRecording: ((Bool, PHAuthorizationStatus) -> Void)? { get set }
    
    func registerView(view: ARSCNView)
    func prepareRecorder(configuration: ARWorldTrackingConfiguration)
    func stopRecording()
    func startRecordGIF()
    func startRecordLivePhoto()
}
