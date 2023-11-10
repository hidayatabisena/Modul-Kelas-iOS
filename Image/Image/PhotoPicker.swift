//
//  PhotoPicker.swift
//  Image
//
//  Created by Hidayat Abisena on 11/11/23.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 10
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(300))]) {
                    ForEach(0..<vm.images.count, id: \.self) { index in
                        Image(uiImage: vm.images[index])
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            PhotosPicker(
                selection: $vm.selectedPhotos,
                maxSelectionCount: maxPhotosToSelect,
                selectionBehavior: .ordered,
                matching: .images
            ) {
                Label("Select up to ^[\(maxPhotosToSelect) photo](inflect: true)", systemImage: "photo")
            }
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
        }
    }
}

#Preview {
    PhotoPicker()
}

class PhotoSelectorViewModel: ObservableObject {
    @Published var images = [UIImage]()
    @Published var selectedPhotos = [PhotosPickerItem]()
    
    @MainActor
    func convertDataToImage() {
        // reset the images array before adding more/new photos
        images.removeAll()
        
        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }
        
        // uncheck the images in the system photo picker
        selectedPhotos.removeAll()
    }
}
