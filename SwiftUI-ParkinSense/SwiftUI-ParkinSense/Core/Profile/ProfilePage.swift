//
//  ProfilePage.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/8/23.
//

import SwiftUI

struct ProfilePage: View {
    
    var body: some View {
        NavigationView{
        ZStack(alignment: .center){
            ZStack(alignment: .leading){
                Rectangle()
                    .frame(width: 1834, height: 220)
                    .position(x:513, y:0)
                    .foregroundColor(Color("BarColor").opacity(0.85))
                    
                Text("Profile")
                    .font(.custom("Optima Bold", size: 60))
                    .foregroundColor(.white)
                    .bold()
                    .position(x:680, y:50)
            }
            ZStack{
                HStack{
                        ZStack{
                            Circle()
                                .frame(width: 160, height: 130)
                                .foregroundColor(.blue.opacity(0.35))
                            NavigationLink{
                                AnnaProfile()
                                .navigationBarBackButtonHidden()
                            } label: {
                                Text("Anna")
                                    .accentColor(.black)
                                    .font(.custom("Optima Bold", size: 40))
                                
                            }
                        }
                        ZStack{
                            Circle()
                                .frame(width: 160, height: 130)
                                .foregroundColor(.blue.opacity(0.35))
                            NavigationLink{
                                JohnProfile()
                                .navigationBarBackButtonHidden()
                            } label: {
                                Text("John")
                                    .accentColor(.black)
                                    .font(.custom("Optima Bold", size: 40))
                                
                            }
                        }
                        ZStack{
                            Circle()
                                .frame(width: 160, height: 130)
                                .foregroundColor(.blue.opacity(0.35))
                            Image(systemName:"plus")
                                .accentColor(.black)
                                .font(.custom("Optima Bold", size: 40))
                            NavigationLink{
                                SignUp()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Add Profile")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .bold()
                                    .frame(width: 145, height: 40)
                                    .background(Color("BarColor").opacity(0.85))
                                    .cornerRadius(40)
                                    .position(x: 83, y:157)
                            }
                        }
                   
                }.frame(width: 135, height: 34)
            }.frame(width: 135, height: 34)
        }
        
        
    }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AnnaProfile: View{
    var body: some View {
        Login()
    }
}

struct JohnProfile: View{
    var body: some View {
        Login()
    }
}

#Preview {
    ProfilePage()
}
