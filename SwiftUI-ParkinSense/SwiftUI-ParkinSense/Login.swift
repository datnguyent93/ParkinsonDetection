//
//  Login.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/8/23.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongusername = 0
    @State private var wrongpassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white)
                
                VStack{
                  
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    HStack{
                        Text("First Name")
                            .font(.title)
                            .padding()
                        
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        // .border(.red, width:<#T##CGFloat#>(wrongusername))
                    }//.position(x:620, y:30)
                    HStack{
                        Text("Password")
                            .font(.title)
                            .padding()
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        // .border(.red, width:<#T##CGFloat#>(wrongusername))
                    }//.position(x:630, y:-200)
                    Button ("Continue"){
                        
                        //Action
                            //Authenticate user
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .font(.title)
                    .bold()
                    .background(Color.purple)
                    .cornerRadius(40)
                    //.position(x:730, y:-420)
                    
                    
                }//.position(x:670, y:790)
                    
            }
        
    }
}
#Preview {
    Login()
}
