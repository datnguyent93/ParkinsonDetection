//
//  Settings.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/17/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack{
            ZStack{
                MenuBar()
                
                Form{
                    Text("Settings")
                        .font(.custom("Sinhala Sangam MN Bold", size: 35))
                        .offset(x:575)
                    Section(header: Text("Display"))
                    {
                        Toggle(isOn: .constant(false), label: {
                            Text("Dark Mode")
                        })
                        Toggle(isOn: .constant(true), label: {
                            Text("Brightness")
                        })
                    }
                    Section(header: Text("Notification"))
                    {
                        Toggle(isOn: .constant(true), label: {
                            Text("Allow Notification")
                        })
                        Toggle(isOn: .constant(false), label: {
                            Text("Push Notification")
                        })
                    }
                    
                    Section(header: Text("Sound"))
                    {
                        Toggle(isOn: .constant(false), label: {
                            Text("Silent Mode")
                        })
                        Toggle(isOn: .constant(true), label: {
                            Text("Use system settings")
                        })
                    }
                    
                    Section(header: Text("Privacy & Security"))
                    {
                        Toggle(isOn: .constant(true), label: {
                            Text("Microphone")
                        })
                        
                    }
                    Section(header: Text("General"))
                    {
                        Toggle(isOn: .constant(true), label: {
                            Text("About")
                        })
                        Toggle(isOn: .constant(true), label: {
                            Text("Logout")
                        })
                    }
                    
                }.font(.custom("Sinhala Sangam MN", size: 20))
                    .offset(y:75)
                }
            }
    }
}

#Preview {
    Settings()
}
