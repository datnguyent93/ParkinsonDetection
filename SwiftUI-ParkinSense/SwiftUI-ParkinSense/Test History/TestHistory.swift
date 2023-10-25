//
//  TestHistory.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct TestHistory: View {
    var body: some View {
        NavigationStack{
            ZStack{
                MenuBar()
    
                ZStack{
                    VStack {
                        
                        Text("Test History")
                            .bold()
                            .font(.custom("Sinhala Sangam MN Bold", size: 40))
                            .padding()
                        
                    }.position(x:729, y:118)
                    TestHistoryListView()
                        .position(x:329, y:358)
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    TestHistory()
}
