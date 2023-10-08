//
//  ContentView.swift
//  SwiftUI-ParkinSense
//
//  Created by user242759 on 04/07/1402 AP.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ParkinSense Testing")
                .font(.system(size:72))
                .fontWeight(.heavy)
                .foregroundColor(Color.orange)
                .multilineTextAlignment(.center)
            
            TextField(
                "User name (email address)",
                text: $username
            )
            .frame(width:480, height:60)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)        }
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
