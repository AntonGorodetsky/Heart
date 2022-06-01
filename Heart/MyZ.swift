//
//  MyZ.swift
//  Heart
//
//  Created by Anton Gorodetsky on 29.05.2022.
//

import SwiftUI

struct MyZ: View {
    var body: some View {
      ZStack {
//        Rectangle()
//          .frame(width: 300, height: 300)
        Circle()
          .fill(.green)
          .background {
            Circle()
              .padding(-5)
              .blur(radius: 10)
          }
          .opacity(0.8)
//          .offset(x: 30, y: 30)
        
            
//            self.colorInvert()
//              .padding(-10)
//              .opacity(0.5)
         
        
        
//        Text("sxsxsxs")
//          .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.727, saturation: 0.789, brightness: 0.857, opacity: 0.909)/*@END_MENU_TOKEN@*/)
      }
    }
}

struct MyZ_Previews: PreviewProvider {
    static var previews: some View {
        MyZ()
    }
}
