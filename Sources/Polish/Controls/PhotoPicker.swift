import AVFoundation
import UIKit
import Core

public protocol PhotoPickerType {
    func makeViewController(cameraTitle: String, photosTitle: String, cancelTitle: String) -> UIViewController?
}

public protocol PhotoPickerDelegate: class {
    func photoPicker(didFinishPicking image: UIImage)
    func photoPickerDidFailPermission()
}

open class PhotoPicker: NSObject, PhotoPickerType {
    private weak var delegate: (PhotoPickerDelegate & UIViewController)?
    private let allowsEditing: Bool
    
    public init(delegate: PhotoPickerDelegate & UIViewController, allowsEditing: Bool) {
        self.delegate = delegate
        self.allowsEditing = allowsEditing
    }
}

extension PhotoPicker {
    
    open func makeViewController(cameraTitle: String = "Camera", photosTitle: String = "Photos", cancelTitle: String = "Cancel") -> UIViewController? {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(
                UIAlertAction(title: cameraTitle) { [weak self] in
                    guard AVCaptureDevice.authorizationStatus(for: .video) != .denied else {
                        self?.delegate?.photoPickerDidFailPermission()
                        return
                    }
                    
                    self?.openCamera()
                }
            )
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(
                UIAlertAction(title: photosTitle) { [weak self] in
                    self?.openPhotoLibrary()
                }
            )
        }
        
        actionSheet.addAction(
            UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        )
        
        return actionSheet
    }
}

// MARK: - Delegates

extension PhotoPicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[allowsEditing ? .editedImage : .originalImage] as? UIImage else {
            return
        }
        
        picker.dismiss(animated: true) {
            self.delegate?.photoPicker(didFinishPicking: image)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

// MARK: - Helpers

private extension PhotoPicker {
    
    func openCamera() {
        delegate?.present(
            with(UIImagePickerController()) {
                $0.delegate = self
                $0.sourceType = .camera
                $0.allowsEditing = allowsEditing
            },
            animated: true
        )
    }
    
    func openPhotoLibrary() {
        delegate?.present(
            with(UIImagePickerController()) {
                $0.delegate = self
                $0.sourceType = .photoLibrary
                $0.allowsEditing = allowsEditing
            },
            animated: true
        )
    }
}
