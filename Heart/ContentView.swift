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
          .onTapGesture(perform: { clock.inClockMode.toggle() })
          .alert( isPresented: $clock.firstLaunched) {
            Alert(title: Text("Tap clock"), message: Text("to switch mode"), dismissButton: .default(Text("ok"), action: {
              clock.firstLaunched = false
            }))
          }
        
        VStack(alignment: .trailing) {
          Spacer()
          HStack {
            Spacer()
            /// navlink
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
    //    .navigationBarHidden(true)
    //    .navigationViewStyle(.stack)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(clock: ClockModel())
  }
}


//struct ContentView: View {
//    @State var currentDate = Date()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        Text("\(currentDate)")
//            .onReceive(timer) { input in
//                currentDate = input
//            }
//    }
//}

