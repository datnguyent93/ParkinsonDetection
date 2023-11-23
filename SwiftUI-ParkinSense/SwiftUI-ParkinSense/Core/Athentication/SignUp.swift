//
//  SignUp.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/8/23.
//

import SwiftUI

struct SignUp: View {
    @State private var Firstname = ""
    @State private var Lastname = ""
    @State private var password = ""
    @State private var wrongFName = 0
    @State private var wrongLName = 0
    @State private var wrongPassword = 0
    @State private var authorized = false
    @State private var signup = true
    
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
                ZStack{
                    VStack{
                        
                        Text("Sign Up")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .offset(x:50)
                        
                        HStack{
                            Text("First Name")
                                .font(.title)
                            
                            TextField("First Name", text: $Firstname)
                                .font(.custom("Sinhala Sangam MN Bold", size: 25))
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .border(.red, width: CGFloat(wrongFName))
                        }
                        HStack{
                            Text("Last Name")
                                .font(.title)
                            
                            TextField("Last Name", text: $Lastname)
                                .font(.custom("Sinhala Sangam MN Bold", size: 25))
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .border(.red, width: CGFloat(wrongLName))
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
                                .border(.red, width: CGFloat(wrongPassword))
                        }
                        //
                        Button("Create Profile"){
                            authenticateUser(Firstname: Firstname, Lastname: Lastname, password: password)
                        }.foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(width: 300, height: 50)
                            .background(Color.purple)
                            .cornerRadius(40)
                            .offset(x:70)
                            .navigationDestination(isPresented: $signup){
                                MainPage().navigationBarBackButtonHidden()
                            }
                        
                    }
                }.offset(x:-20)
            }
            
        
    }.navigationViewStyle(StackNavigationViewStyle())
    }
    func authenticateUser(Firstname: String, Lastname: String, password: String){
        if Firstname == ""{
            wrongFName = 0
            }
           
        else if Lastname == ""{
            wrongLName = 2
            }
        
        else if password == ""{
            wrongPassword = 2
        }
        else
        {
            authorized = true
        }
    }

}


#Preview {
    SignUp()
}


