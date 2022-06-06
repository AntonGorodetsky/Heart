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
  @AppStorage("clockStyleShadow")
  var clockStyleShadow: Int = 1
  
  let size = UIScreen.main.bounds
  
  var body: some View {
    VStack {
      
      ClockFace(clock: clock)
        .frame(width: size.width * 0.7, height: size.width * 0.7, alignment: .center)
        .padding()
        .background {
          Rectangle()
            .fill(clock.mainBackground)
            .cornerRadius(10)
            .shadow(color: .primary, radius: 7, x: 0, y: 0)
        }
        .clipped()
      
      

      Spacer()
      Picker("Style", selection: $clock.style) {
        ForEach(ClockStyle.allCases) { style in
          Text(style.name)
        }
      }.pickerStyle(.segmented)
      .padding()
      .onAppear { clock.style = ClockStyle(rawValue: clockStyleShadow) ?? .drop}
      .onChange(of: clock.style) { newValue in
          clockStyleShadow = newValue.rawValue }
        Spacer()
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
        
//        Text("\(size.height) \(size.width)")
      }.cornerRadius(15)
    }
    .navigationBarTitle("")
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
