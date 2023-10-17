//
//  Timer2.swift
//  SwiftUI-ParkinSense
//
//  Created by Emnet.A on 10/8/23.
//

import SwiftUI

struct Timer2: View {
    @State var timeRemaining = 5
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer){ _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }.font(.custom("Gurmukhi MN", size: 70))
            .fontWeight(.black)
          
    }
    
}

#Preview {
    Timer2()
}

