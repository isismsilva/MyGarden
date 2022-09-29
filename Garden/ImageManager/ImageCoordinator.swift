//
//  ImageCoordinator.swift
//  Garden
//
//  Created by Isis Silva on 29/09/22.
//

import SwiftUI
import UIKit

class ImageCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  @Binding var isCoordinatorShown: Bool
  @Binding var imageInCoordinator: Image?
  @Binding var imageData: Data?
  
  init(isShown: Binding<Bool>, image: Binding<Image?>, imageData: Binding<Data?>) {
    _isCoordinatorShown = isShown
    _imageInCoordinator = image
    _imageData = imageData
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
//    writeToPhotAlbum(image: unwrapImage)
    imageData = unwrapImage.pngData()
    imageInCoordinator = Image(uiImage: unwrapImage)
    isCoordinatorShown = false
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isCoordinatorShown = false
  }
  
//  func writeToPhotAlbum(image: UIImage) {
//    UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
//  }
//
//  @objc private func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, context: UnsafeRawPointer) {
//    print("Save finished")
//  }
}

struct CaptureImageView {
  @Binding var isShown: Bool
  @Binding var image: Image?
  @Binding var imageData: Data?
  
  func makeCoordinator() -> ImageCoordinator {
    return ImageCoordinator(isShown: $isShown, image: $image, imageData: $imageData)
  }
}

extension CaptureImageView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    picker.sourceType = .photoLibrary
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<Self>) {
    
  }
}
