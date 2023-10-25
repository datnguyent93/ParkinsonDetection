//
//  TestHistorydata.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet Alemayehu on 10/24/23.
//

import SwiftUI

struct Info: Identifiable {
    let id = UUID()
    let Score: String
    let creationDate: Date
}



struct TestHistorydata: View {
    
    @State var Data = [Info(Score: "57",
                                     creationDate: Date() + 100),
                            Info(Score: "47",
                                 creationDate: Date() + 100),
                            Info(Score: "27",
                                 creationDate: Date() + 100)]
    var body: some View {
        ZStack{
            Table(Data) {
                TableColumn("Score", value: \.Score)
                TableColumn("Date") { Info in
                    Text(Info.creationDate, style: .date)
                }}
        }
    }
}

struct TestHistoryListView: View {
    var body: some View {
        ZStack{
            HStack {
                List{
                    Section(header: Text("Date").font(.custom("Sinhala Sangam MN Bold", size: 40))){
                        Text("10/23/2021")
                        Text("05/17/2022")
                        Text("12/20/2022")
                    }.font(.custom("Sinhala Sangam MN Bold", size: 30))
                }.listStyle(GroupedListStyle())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                List{
                    
                    Section(header: Text("Score").font(.custom("Sinhala Sangam MN Bold", size: 40))){
                        Text("21")
                        Text("57")
                        Text("89")
                    } .font(.custom("Sinhala Sangam MN Bold", size: 30))
                }.listStyle(GroupedListStyle())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
            }
            Rectangle().fill(Color.gray).opacity(0.8).frame(width: CGFloat(2))
        }.frame(width: 550, height: 300)
    }
}

#Preview {
    //TestHistorydata()
    TestHistoryListView()
}

