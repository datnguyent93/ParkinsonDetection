//
//  ProfilePage.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/8/23.
//

import SwiftUI

import SwiftUI

struct ProfilePage: View {
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(height: 160)
                .position(x: 683, y: 0)
                .foregroundColor(.blue.opacity(0.75))
            
            Text("Profile")
                .font(.largeTitle)
                .bold()
                .position(x:680, y:30)
        }
            
        HStack{
            
            ZStack{
                Circle()
                    .frame(width: 160, height: 130)
                    .foregroundColor(.blue.opacity(0.75))
                
            Button(action: Addprof, label: {
                    Image("AddProf")
                    .resizable()
                    .frame(width: 160, height: 130)
                })
            }
           
            
        }
        .position(x:680, y:-300)
        
        
    }
}

func Addprof(){
     
    //SigninReg()
}

#Preview {
    ProfilePage()
}
