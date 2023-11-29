//
//  ContentView.swift
//  BasicSignature
//
//  Created by Hidayat Abisena on 29/11/23.
//

import SwiftUI
import SwiftUIDigitalSignature

struct ContentView: View {
    @State private var signatureImage: UIImage?
    @State private var showAlert = false
    @State private var imagePath: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Tap to Sign here...") {
                    SignatureView(
                        availableTabs: [.draw, .image, .type]) { image in
                            self.signatureImage = image
                            // self.imagePath = self.saveImageToFile(image)
                            ImageSaver().writeToPhotoAlbum(image: image)
                        } onCancel: {
                            self.showAlert.toggle()
                        }
                    
                }
                
                if signatureImage != nil {
                    Image(uiImage: signatureImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Are you sure you want to cancel?"),
                    message: Text("Your signature will be discarded."),
                    primaryButton: .destructive(Text("Yes"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.signatureImage = nil
                        self.imagePath = ""
                    }),
                    secondaryButton: .cancel(Text("No"), action: {
                        // do nothing for now
                    })
                )
            }
        }
    }
    
//    func saveImageToFile(_ image: UIImage) -> String {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    
//        let fileName = "signature.jpg"
//        let fileURL = documentsDirectory.appendingPathComponent(fileName)
//        
//        if let data = image.jpegData(compressionQuality: 1.0),
//           !FileManager.default.fileExists(atPath: fileURL.path) {
//            do {
//                try data.write(to: fileURL)
//                print("file saved")
//            } catch {
//                print("error saving file:", error)
//            }
//        }
//        
//        return fileURL.path
//    }
}

#Preview {
    ContentView()
}
