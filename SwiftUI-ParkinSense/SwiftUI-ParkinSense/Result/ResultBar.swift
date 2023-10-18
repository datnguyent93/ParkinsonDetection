//
//  ResultBar.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI

struct ResultBar: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var color1 = Color(.orange)
    var color2 = Color(.pink)
    
    var body: some View {
          let multiplier = width / 100
           
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.gray.opacity(0.4))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1,color2]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }.frame(height: 20)
        
    }
}

#Preview {
    ResultBar()
}
