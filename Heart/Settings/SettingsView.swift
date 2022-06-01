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
  
  
  var body: some View {
    VStack(alignment: .center) {
      ClockFace(clock: clock)
//        .ignoresSafeArea()
        .padding(30)
        .background(clock.mainBackground)
//        .onTapGesture(perform: { clock.running.toggle() })
//        .scaledToFit()
//        .scaleEffect()
//        .aspectRatio(contentMode: .fit)
//        .ignoresSafeArea(edges: [.leading, .trailing])
      
      
      
      //"Settings"
      List {
        
        Section {
          Stepper("clock colors \(refreshColorInterval)", value: $refreshColorInterval, in: (1...10)
          )
          
          Stepper("background  \(refreshBackgroundInterval) second", value: $refreshBackgroundInterval, in: (1...60)
          )
          
          Stepper("caos colors  \(caosColorRefreshInterval) sec ", value: $caosColorRefreshInterval, in: (1...10)
          ).disabled(false)
          
          Toggle("caosRandom", isOn: $caosRandom)
          
          Stepper(
            "caos refresh \(caosTimeRefreshInterval)) second",
            value: $caosTimeRefreshInterval, in: (1...10)
          ).disabled(caosRandom)
          
//          Picker(selection: $refreshBackgroundInterval) {
//            Text("1").tag(0)
//          } label: {
//            Text("22")
//          }
//          .pickerStyle(.inline)
          

        } header: {
          Text ("Update interval").font(.caption2)
        }

        
        
          
        
      }
      
      
      Section("clock style") {
        Picker("Style", selection: $clock.style) {
          ForEach(ClockStyle.allCases) { style in
            Text(style.name)
          }
        }.pickerStyle(.menu)
        
        Picker("Style", selection: $clock.style) {
          ForEach(ClockStyle.allCases) { style in
            Text(style.name)
          }
        }.pickerStyle(.segmented)
          .padding(.horizontal)
          .shadow(color: .white, radius: 8, x: 0, y: 0)
      }
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var clock = ClockModel()
  static var previews: some View {
    SettingsView(clock: clock)
      .onAppear {clock.running = false}
  }
}
