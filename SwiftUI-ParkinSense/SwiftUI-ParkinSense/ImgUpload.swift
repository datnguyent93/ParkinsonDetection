//
//  ImgUpload.swift
//  SwiftUI-ParkinSense
//
//  Created by user242809 on 10/16/23.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImgUpload: View {
    @State private var mySelection: PhotosPickerItem? = nil
    @State private var myImage: Image? = nil
    @State private var myImageData: Data? = nil
    
    let randomInt = Int.random(in: 1..<4)
    
    var body: some View {
        VStack{
            if let myImage{
                Text("\(randomInt)") //prints random int when chosen image is loaded
                    myImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 500)
            }
            
            PhotosPicker(
                "Select Image",
                selection: $mySelection,
                matching: .images,
                photoLibrary: .shared()
            )
            
        }
        .onChange(of: mySelection, initial: false){ oldItem, newItem in
            Task{
                if let data = try? await newItem?.loadTransferable(type: Data.self){
                    if let uiImage = UIImage(data: data){
                        myImage = Image(uiImage: uiImage)
                        return
                    }
                }
                print("Failed")
            }
        }

    }
    
}



#Preview {
    ImgUpload()
}
