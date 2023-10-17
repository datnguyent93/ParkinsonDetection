//
//  TestHistory.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct TestHistory: View {
    var body: some View {
        NavigationView{
            ZStack{
                MenuBar()
                ZStack{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Text("Test History")
                            .bold()
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                            .padding()
                        Text("No test history available")
                            .font(.custom("Avenir Next", size: 30))
                            
                    }).position(x:729, y:158)
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    TestHistory()
}
