//
//  ContentView.swift
//  Heart
//
//  Created by Anton Gorodetsky on 28.05.2022.
//

import SwiftUI

struct ContentView: View {
  @StateObject var clock: ClockModel
 
  var body: some View {
  
      
      NavigationView {
        ZStack {
          ClockFace(clock: clock)
            .onTapGesture(perform: { clock.running.toggle() })
            .padding(20)
            .background { clock.mainBackground }
          
          VStack {
            Spacer()
            HStack {
              Spacer()
              NavigationLink {
                SettingsView(clock: clock)
                  .onAppear { clock.running = false }
                  .onDisappear { clock.running = true }
              } label: {
                Image(systemName: "gear")
                  .resizable()
                  .frame(width: 30, height: 30,
                         alignment: .center)
                  .tint(.gray)
                  .shadow(color: .black, radius: 2,
                          x: 1, y: 1)
                  .padding()
              }
            .padding(.top, 50)
            }
          }
          

        
        
        
      }
      .ignoresSafeArea()
      .background(Color.clear)
    }
    .background { clock.mainBackground }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(clock: ClockModel())
    }
}




