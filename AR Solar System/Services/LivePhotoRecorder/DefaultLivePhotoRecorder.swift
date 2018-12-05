import Foundation
import ARKit
import ARVideoKit
import Photos

final class DefaultLivePhotoRecorder: LivePhotoRecorder {
    
    var onEndRecording: ((Bool, PHAuthorizationStatus) -> Void)?

    private var recorder: RecordAR?
    private let caprturingQueue = DispatchQueue(label: "capturingThread", attributes: .concurrent)
    
    func registerView(view: ARSCNView) {
        recorder = RecordAR(ARSceneKit: view)
        recorder?.delegate = self
    }
    
    func prepareRecorder(configuration: ARWorldTrackingConfiguration) {
        recorder?.prepare(configuration)
    }
    
    func stopRecording() {
        if recorder?.status == .recording {
            recorder?.stopAndExport()
        }
        recorder?.prepare(ARWorldTrackingConfiguration())
    }
    
    func startRecordGIF() {
        guard recorder?.status == .readyToRecord else { return }
        recorder?.gif(forDuration: 3.0, export: true) { [weak self] _, _, status, saved in
            if saved {
                self?.onEndRecording?(saved, status)
            }
        }
    }
    
    func startRecordLivePhoto() {
        guard recorder?.status == .readyToRecord else { return }
        caprturingQueue.async {
            self.recorder?.livePhoto(export: true) { [weak self] _, _, status, saved in
                if saved {
                    self?.onEndRecording?(saved, status)
                }
            }
        }
    }
}

extension DefaultLivePhotoRecorder: RecordARDelegate {
    
    func recorder(didEndRecording path: URL, with noError: Bool) { }
    
    func recorder(didFailRecording error: Error?, and status: String) { }
    
    func recorder(willEnterBackground status: RecordARStatus) {
        if status == .recording {
            recorder?.stopAndExport()
        }
    }
}
