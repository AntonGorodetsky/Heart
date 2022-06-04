//
//  Arrow.swift
//  Heart
//
//  Created by Anton Gorodetsky on 28.05.2022.
//

import SwiftUI

struct Arrow: View {
  
  let arrowColor: Color
  let digitColor: Color
  
  @Binding var digit: Int

  let arrowRotation: Angle
  let digitRotation: Angle
  
  let digitOffset: CGFloat 
  
  let arrowPadding: CGFloat
  
  let style: ClockStyle
  
  var showDigit: Bool = true
  
  var body: some View {
    
    ZStack {
      Image(systemName: style.arrowImageName )
        .resizable()
        .aspectRatio(style.aspectRatio, contentMode: .fit)
        .rotationEffect(style.primaryRotationAngle)
        .foregroundColor(arrowColor)
        .shadow(color: digitColor, radius: 2,
                x: 0, y: -2)
//        .shadow(color: .white, radius: 2,
//                x: 0, y: -7)
        .shadow(color: .black, radius: 3,
                x: 0, y: 3)
        .offset(x: 0, y: style.arrowOffset)
    
      VStack {
        
        if showDigit {
          Text(
            "\(Int(digit))"
          )
            .foregroundColor(digitColor)
            .fontWeight(.heavy)
            .font(.title)
  //          .brightness(0.3)
//            .shadow(color: .black, radius: 2 )
            .rotationEffect(digitRotation,
                            anchor: .center)
            .offset(x: 0, y: digitOffset)
        } else {
          
        }
        
        Spacer()
      }
    }
    .padding(arrowPadding)
    .aspectRatio(1, contentMode: .fit)
    .rotationEffect(arrowRotation, anchor: .center)
  }
  
}
    
    
//      ZStack(alignment: .center) {
//        Image(systemName: style.arrowImageName )
//          .resizable()
//          .aspectRatio(style.scale, contentMode: .fit)
//          .rotationEffect(style.primaryRotationAngle)
//          .foregroundColor(arrowColor)
//          .shadow(color: .white,
//                  radius: 7,
//                  x: 0, y: -3)
//          .shadow(color: .black,
//                  radius: 6,
//                  x: 0, y: 5)
//          .offset(x: 0, y: style.arrowOffset)
//
//        VStack {
//          Text("\(Int(digit))")
//            .foregroundColor(digitColor)
//            .fontWeight(.heavy)
//            .font(.title2)
//            .brightness(0.3)
//            .shadow(color: .black, radius: 4 )
//            .rotationEffect(digitRotation,
//                            anchor: .center)
//            .offset(x: 0, y: digitOffset)
//          Spacer()
//        }
    
//      .aspectRatio(contentMode: .fit)
  //    .aspectRatio(1, contentMode: .fit)
//    .rotationEffect(arrowRotation, anchor: .center)
 

struct Arrow_Previews: PreviewProvider {
  static var style: ClockStyle = .grid
  static var previews: some View {
    VStack {
      Spacer()
      ZStack {
        Arrow(arrowColor: .red, digitColor: .yellow, digit: .constant(24), arrowRotation: .degrees(0), digitRotation: .degrees(0), digitOffset: -35.0, arrowPadding: 50.0,
              style: style,
              showDigit: true)
//        Arrow(arrowColor: .green, digitColor: .red, digit: .constant(0), arrowRotation: .degrees(90), digitRotation: .degrees(0), style: style)
//          .scaleEffect(1)
//        Arrow(arrowColor: .pink, digitColor: .red, digit: .constant(0), arrowRotation: .degrees(45), digitRotation: .degrees(0), style: style)
//          .scaleEffect(1)
//        Circle().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/).padding(150).accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
      }
      Spacer()
      }
//    .padding(20)
    .background() {
      Color.blue
    }
  }
}



//
