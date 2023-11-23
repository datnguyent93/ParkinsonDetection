//
//  MenuBar.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/17/23.
//

import SwiftUI


struct MenuBar: View {
    let screen = UIScreen.main.bounds
    @State private var notification = false
    @State private var home = false
    @State private var testHistory = false
    @State private var information = false
    @State private var setting = false
    @State private var logout = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .top){
                //Color.black
                    //.ignoresSafeArea()
                VStack{
                    Color("pOrange").frame(height: 100)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
                HStack(){
                    Text("Welcome User")
                        .foregroundColor(.black)
                        .font(.custom("Constantia", size: 45))
                        .bold()
                        .padding(.top, 30)
                        //.lineLimit(1)
                        
                    Button(action: {
                        self.notification.toggle()
                        
                    }, label:  {
                        Image(systemName: "bell.fill")
                            .accentColor(.black)
                            .font(.system(size: 50))
                            .padding(.top, 20)
                    })
                    .padding(.leading, screen.width * 0.5)                    //.position(x:738, y:30)
                    .navigationDestination(isPresented: $notification){
                        Notification()
                    }
                    //Spacer()
                    Menu {
                        Button("Home", action: {self.home.toggle()})
                        Button("Test History") {
                            self.testHistory.toggle()
                        }
                        Button("Information") {
                            self.information.toggle()
                        }
                        Button("Settings") {
                            self.setting.toggle()
                        }
                        Button("Logout") {
                            self.logout.toggle()
                        }
                        
                        
                    } label: {
                        Image(systemName: "text.justify")
                            .accentColor(.black)
                            .font(.system(size: 50))
                        
                    }
                    //.position(y:30)
                    .navigationDestination(isPresented: $home){
                        MainPage().navigationBarBackButtonHidden()
                    }
                    .navigationDestination(isPresented: $testHistory){
                        TestHistory().navigationBarBackButtonHidden()
                    }
                    .navigationDestination(isPresented: $information){
                        Information().navigationBarBackButtonHidden()
                    }
                    .navigationDestination(isPresented: $setting){
                        Settings().navigationBarBackButtonHidden()
                    }
                    .navigationDestination(isPresented: $logout){
                        ContentView().navigationBarBackButtonHidden()
                    }
                    
                } //hstack
                .frame(width: .infinity, height: .infinity, alignment: .top)
                .edgesIgnoringSafeArea(.top)
                .padding(.top, 3)
                //.border(.black)
                
            }//zstack
            .frame(width: .infinity, height: 100)
            //.border(.blue)
            Spacer()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    MenuBar()
}

