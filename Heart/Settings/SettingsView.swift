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
  var refreshBackgroundInterval: Int = 3
  @AppStorage("chaosTimeRefreshInterval")
  var chaosTimeRefreshInterval: Int = 3
  @AppStorage("chaosColorRefreshInterval")
  var chaosColorRefreshInterval: Int = 3
  @AppStorage("chaosRandom")
  var chaosRandom: Bool = false
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
            .padding(5)
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
      }
      .aspectRatio(1, contentMode: .fit)
//      .fixedSize()
      .padding(.horizontal, 30)
//      .scaleEffect(0.5)
//      Spacer()
//        .padding()
      Spacer()
      Picker("Style", selection: $clock.style) {
        ForEach(ClockStyle.allCases) { style in
          Text(style.name)
        }
      }.pickerStyle(.segmented)
        .padding()
      List {
        
//        Toggle(isOn: $digitsIsShown) {
//          Text("show digits")
//        }.disabled(true)
       
        
        Section {
          Stepper("clock \(refreshColorInterval), sec", value: $refreshColorInterval, in: (1...10)
          )
        
          Stepper("background \(refreshBackgroundInterval), sec", value: $refreshBackgroundInterval, in: (1...60)
          )
          
          
          Stepper("random mode \(chaosColorRefreshInterval), sec ", value: $chaosColorRefreshInterval, in: (1...10)
          ).disabled(false)
        } header: {
          Text("Color update intervals").font(.caption2)
        }
        .multilineTextAlignment(.leading)
        
      }.cornerRadius(15)
      
      
     Spacer()
      
    }
    .navigationBarTitle("Settings")
    .navigationBarTitleDisplayMode(.inline)
//    .navigationBarHidden(true)
//  .navigationViewStyle(.stack)
    
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
