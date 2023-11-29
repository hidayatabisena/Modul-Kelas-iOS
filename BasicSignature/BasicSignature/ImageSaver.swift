//
//  ImageSaver.swift
//  BasicSignature
//
//  Created by Hidayat Abisena on 29/11/23.
//

import Foundation
import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Save error:", error.localizedDescription)
        } else {
            print("Save finished!")
        }
    }
}
