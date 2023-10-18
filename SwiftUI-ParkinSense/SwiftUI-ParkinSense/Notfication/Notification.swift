//
//  Notification.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct Notification: View {
    var body: some View {
        NavigationView{
            ZStack{
                MenuBar()
                ZStack{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Text("Notification")
                            .bold()
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                            .padding()
                        Text("You do not have new notification")
                            .font(.custom("Avenir Next", size: 30))
                       
                    }).position(x:729, y:148)
                }
                
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Notification()
}
