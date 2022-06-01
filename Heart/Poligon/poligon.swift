//
//  poligon.swift
//  Heart
//
//  Created by Anton Gorodetsky on 31.05.2022.
//

import SwiftUI

struct Labeled: View {
  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .bottom) {
        Spacer()
        ZStack(alignment: .center) {
          Circle().opacity(0.2)
          Image(systemName: "gear")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(30)
          VStack {
            Text("\(geometry.size.width)")
              .font(.largeTitle)
              .scaleEffect(geometry.size.width/400)
            Spacer()
          }
        }.aspectRatio(1, contentMode: .fit)
          .offset(x: 0, y: 0)
        Spacer()
      }
      }
//    .aspectRatio(contentMode: .fit)
    }
  
  
}


struct poligon: View {
  @State var clock = ClockModel()
  @State var degree: Float = 45
    var body: some View {
     
        VStack {
          Spacer()
          ClockFace(clock: clock)
            
          Spacer()
          Slider(value: $degree, in: (0...360)) {
            Text("slider")
          }
          Spacer()
        }
      }
    
}

struct poligon_Previews: PreviewProvider {
    static var previews: some View {
      Labeled()
      VStack {
        Labeled().scaledToFit()
        HStack {
          Labeled().scaledToFill()
          Labeled()
//            .scenePadding()
        }
      }
    }
}
