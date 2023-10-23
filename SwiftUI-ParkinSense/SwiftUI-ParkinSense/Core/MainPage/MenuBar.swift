//
//  MenuBar.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI


struct MenuBar: View {
    @State private var notification = false
    @State private var home = false
    @State private var testHistory = false
    @State private var information = false
    @State private var setting = false
    @State private var logout = false
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center){
                Rectangle()
                    .frame(width: 1834, height: 160)
                    .position(x:513, y:0)
                    .foregroundColor(Color("BarColor").opacity(0.85))
                HStack {
                    Text("Welcome User")
                        .foregroundColor(.white)
                        .bold()
                        .position(x:170, y:30)
                        .font(.custom("Sinhala Sangam MN Bold", size: 40))
                    Button(action: {
                        self.notification.toggle()
                        
                    }, label:  {
                        Image(systemName: "bell.fill")
                            .accentColor(.white.opacity(0.84))
                            .font(.system(size: 50))
                        
                    }).position(x:730, y:30)
                        .background(
                            NavigationLink(destination:  Notification().navigationBarBackButtonHidden(), isActive: $notification) {
                            EmptyView()
                          }
                        )
                 
                        
                        Menu {
                            Button("HomePage") {
                                self.home.toggle()
                                    }
                            Button("TestHistory") {
                                      self.testHistory.toggle()
                                    }
                            Button("Information") {
                                      self.information.toggle()
                                    }
                            Button("Setting") {
                                      self.setting.toggle()
                                    }
                            Button("Logout") {
                                      self.logout.toggle()
                                    }
                      
                            
                        } label: {
                            Image(systemName: "text.justify")
                                .accentColor(.white.opacity(0.84))
                                .font(.system(size: 60))
                            
                        }.position(x:380, y:30)
                        .background(
                            Group {
            
                                NavigationLink(destination: MainPage().navigationBarBackButtonHidden(), isActive:$home) {
                                EmptyView()
                                  
                              }
                                NavigationLink(destination: TestHistory().navigationBarBackButtonHidden(), isActive: $testHistory) {
                                  EmptyView()
                                  
                                        
                                }
                                NavigationLink(destination: Information().navigationBarBackButtonHidden(), isActive: $information) {
                                  EmptyView()
                                        
                                }
                                NavigationLink(destination: Settings().navigationBarBackButtonHidden(), isActive: $setting) {
                                  EmptyView()
                                        
                                }
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(), isActive: $logout) {
                                  EmptyView()
                                        
                                }
                            }
                          )
                               
                   
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    MenuBar()
}

