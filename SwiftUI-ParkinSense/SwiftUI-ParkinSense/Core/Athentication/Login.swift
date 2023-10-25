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
    @State private var authorized = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white)
                ZStack{
                    VStack{
                        
                        Text("Login")
                            .font(.largeTitle)
                            .font(.custom("Sinhala Sangam MN Bold", size: 25))
                            .bold()
                            .padding()
                            .offset(x:50)
                        
                        HStack{
                            Text("First Name")
                                .font(.title)
                            
                            
                            TextField("Username", text: $username)
                                .font(.custom("Sinhala Sangam MN Bold", size: 25))
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .border(.red, width: CGFloat(wrongusername))
                            
                        }
                        HStack{
                            Text("Password  ")
                                .font(.title)
                            
                            SecureField("Password", text: $password)
                                .font(.custom("Sinhala Sangam MN Bold", size: 25))
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .border(.red, width: CGFloat(wrongpassword))
                            
                        }
                        
                        Button("Continue"){
                            authenticateUser(username: username, password: password)
                        }.foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(width: 300, height: 50)
                            .background(Color.purple)
                            .cornerRadius(40)
                            .offset(x:70)
                        NavigationLink(destination: MainPage().navigationBarBackButtonHidden(), isActive: $authorized) {
                            EmptyView()
                        }
                        
                        NavigationLink{
                            SignUp()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("First time user? SignUp")
                                .font(.custom("Sinhala Sangam MN", size: 30))
                                .offset(x:70)
                        }
                        
                        
                    }.frame(width: 500, height: 300)
                }.offset(x:-20)
            }
            
        }
    }
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "user"{
            wrongusername = 0
            if password.lowercased() == "1234"{
                wrongusername = 0
                authorized = true
            }
            else{
                wrongpassword = 2
            }
        }
        else{
            wrongusername = 2
        }
    }
}


#Preview {
    Login()
}
