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
    
    @State var randomInt = 0
    
    var body: some View {
        VStack{
            if let myImage{ //display selected img and random number
                Text("\(randomInt)")
                
                myImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
            }
            
            PhotosPicker( //lets user pick a photo from photo library
                "Select Image",
                selection: $mySelection,
                matching: .images,
                photoLibrary: .shared()
            )
            
        }
        .onChange(of: mySelection, initial: false){ oldItem, newItem in //tracks if new img was selected
            Task{ //replaces chosen image with new selection
                if let data = try? await
                    newItem?.loadTransferable(type: Data.self){
                    if let uiImage = UIImage(data: data){
                        randomInt = Int.random(in: 1..<4)
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
