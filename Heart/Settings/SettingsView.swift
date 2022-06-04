//
//  SettingsView.swift
//  Heart
//
//  Created by Anton Gorodetsky on 01.06.2022.
//

import SwiftUI

struct SettingsView: View {
  @ObservedObject var clock: ClockModel
  
  @AppStorage("clockColorsRefreshInterval")
  var refreshColorInterval: Int = 1
  @AppStorage("refreshBackgroundInterval")
  var refreshBackgroundInterval: Int = 60
  @AppStorage("caosTimeRefreshInterval")
  var caosTimeRefreshInterval: Int = 3
  @AppStorage("caosColorRefreshInterval")
  var caosColorRefreshInterval: Int = 3
  @AppStorage("caosRandom")
  var caosRandom: Bool = false
  @AppStorage("digitsIsShown")
  var digitsIsShown:Bool = true
  
  var body: some View {
    VStack {
      Group {
//        geometry in
        ClockFace(clock: clock)
        //        .padding(.top, 100)
        //          .ignoresSafeArea()
//                .scaledToFit()
//            .padding(20)
//          .padding(.horizontal, 100)
//          .aspectRatio(1, contentMode: .fit)
//          .frame(width: 300, height: 300, alignment: .center)
//          .frame( height: geometry.size.width , alignment: .center)
//          .scaleEffect(0.5)
          .background {
            Rectangle()
              .fill(clock.mainBackground)
              .cornerRadius(10)
//              .padding()
              .shadow(color: .black, radius: 7, x: 0, y: 0)
          }
//          .frame( height: geometry.size.height, alignment: .center)
//
        //              .frame(alignment: .center)
      } .aspectRatio(1, contentMode: .fit)
//      .fixedSize()
//      .padding(.horizontal)
//      .scaleEffect(0.5)
      Spacer()
      Picker("Style", selection: $clock.style) {
        ForEach(ClockStyle.allCases) { style in
          Text(style.name)
        }
      }.pickerStyle(.segmented)
        .padding()
//      Spacer()
      Group {
        Toggle(isOn: $digitsIsShown) {
          Text("show digits")
        }
        Stepper("clock colors \(refreshColorInterval)", value: $refreshColorInterval, in: (1...10)
        )
        Stepper("background  \(refreshBackgroundInterval) second", value: $refreshBackgroundInterval, in: (1...60)
        )
        Stepper("caos colors  \(caosColorRefreshInterval) sec ", value: $caosColorRefreshInterval, in: (1...10)
        ).disabled(false)
        
        Toggle("caosRandom", isOn: $caosRandom)
        
        if !caosRandom {
          Stepper(value: $caosTimeRefreshInterval, in: (1...10)) {
            Text( "caos refresh  \(caosTimeRefreshInterval) each second")
            //          Text( "caos refresh " + caosRandom ? "rendom":"\(caosTimeRefreshInterval) each second ")
          }.disabled(caosRandom)
        } else {
          /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
        }
        
        
      }.padding(.horizontal)
      
     Spacer()
      
    }
//    .padding(.horizontal)
    .padding()
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var clock = ClockModel()
  static var previews: some View {
    SettingsView(clock: clock)
      .onAppear {clock.inClockMode = false}
  }
}
