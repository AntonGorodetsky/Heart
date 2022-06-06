//
//  ContentView.swift
//  Heart
//
//  Created by Anton Gorodetsky on 28.05.2022.
//

import SwiftUI

struct ContentView: View {
  @StateObject var clock: ClockModel
  @AppStorage("firstLaunched") var firstLaunched = true
 
  var body: some View {
  
      
      NavigationView {
        ZStack {
          ClockFace(clock: clock)
            .onTapGesture(perform: { clock.inClockMode.toggle() })
          
//          Button(action: {
//            firstLaunched = false
//          }, label: {
//          })
//
//          Image(systemName: "gear")
            .alert( isPresented: $firstLaunched) {
              Alert(title: Text("Tap clock"), message: Text("to switch mode"), dismissButton: .default(Text("ok"), action: {
                firstLaunched = false
              }))
              }
//            .padding(20)
//            .background { clock.mainBackground }
           
          VStack(alignment: .leading) {
            Spacer()
            HStack {
              Spacer()
              NavigationLink {
                SettingsView(clock: clock)
                  .onAppear { clock.inClockMode = false }
                  .onDisappear { clock.inClockMode = true }
              } label: {
                Image(systemName: "gear")
                  .resizable()
                  .frame(width: 30, height: 30)
                  .tint(.gray)
                  .shadow(color: .black, radius: 2,
                          x: 1, y: 1)
                  .padding()
              }
            }
          }

      }
      .background { clock.mainBackground }
      .ignoresSafeArea()
    }.navigationBarTitleDisplayMode(.inline)
    
//      .navigationBarTitle("setNav")
////    .navigationBarHidden(true)
//    .navigationViewStyle(.stack)
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(clock: ClockModel())
    }
}




