//
//  Login.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/8/23.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongusername = 0
    @State private var wrongpassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center) {
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
                            //.border(.red, width:<#T##CGFloat#>(wrongusername))
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
                            //.border(.red, width:<#T##CGFloat#>(wrongpassword))
                    }//.position(x:630, y:-200)
                   
//
                    NavigationLink{
                        MainPage()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Continue")
                    }.foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(40)
                        
                    NavigationLink{
                        SignUp()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("First time user? SignUp")
                    }
                
                    
                }
                    
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
#Preview {
    Login()
}
