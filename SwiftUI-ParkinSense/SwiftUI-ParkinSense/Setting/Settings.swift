//
//  Settings.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView{
            ZStack{
                MenuBar()
                ZStack{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Text("Settings")
                            .bold()
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                            .padding()
                       
                            //.padding()
                    }).position(x:729, y:128)
                }
                
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Settings()
}
