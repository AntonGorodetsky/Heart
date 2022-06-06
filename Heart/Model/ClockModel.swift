//
//  ClockModel.swift
//  Heart
//
//  Created by Anton Gorodetsky on 29.05.2022.
//

import SwiftUI


class ClockModel: ObservableObject {
 
  @Published var hours:   Int = 18
  @Published var minutes: Int = 33
  @Published var seconds: Int = 27
  @Published var style: ClockStyle = .gear
  @Published var arrowIndex: Int = 0
  @Published var arrowMovementAnimation: Animation = .easeOut
  @Published var inClockMode: Bool = true
  
  
  var secondsArrowRotation: Angle { Angle(degrees:
        6 *   Double(seconds) ) }
  var minutesArrowRotation: Angle { Angle(degrees:
        6 *  ( Double(minutes) + Double(seconds)/60 )) }
  var hoursArrowRotation:   Angle { Angle(degrees:
        30 * ( Double(hours)   + Double(minutes)/60 )) }
  
  var hoursDigitRotation:   Angle { -hoursArrowRotation }
  var minutesDigitRotation: Angle { -minutesArrowRotation }
  var secondsDigitRotation: Angle { -secondsArrowRotation }
  
  //  Color(hue: 0.727, saturation: 0.789, brightness: 0.857, opacity: 0.909)
  var hoursArrowColor:   Color = .red
  var minutesArrowColor: Color = .green
  var secondsArrowColor: Color = .blue
//  @Published
  var mainBackground:    Color = .black
  
  var hoursDigitColor:   Color {
    inClockMode ? Color(uiColor: UIColor(hoursArrowColor).inverted)
        : hoursArrowColor }
  var minutesDigitColor: Color {
    inClockMode ? Color(uiColor: UIColor(minutesArrowColor).inverted)
        : minutesArrowColor   }
  var secondsDigitColor: Color {
    inClockMode ? Color(uiColor: UIColor(secondsArrowColor).inverted)
        : secondsArrowColor
  }
  
//  @AppStorage("refreshColorTime")
//  var refreshColorInterval: Float = 1
//
//  @AppStorage("refreshchaosTime")
//  var chaosTimeRefreshInterval: Int = 3
//
//  @AppStorage("chaosColorRefreshInterval")
//  var chaosColorRefreshInterval: Int = 3
  //MARK: Settings
  @AppStorage("clockColorsRefreshInterval")
  var refreshColorInterval: Int = 1
  @AppStorage("refreshBackgroundInterval")
  var refreshBackgroundInterval: Int = 4
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
  
  private var timer = Timer()
  
  init() {
    style = ClockStyle(rawValue: self.clockStyleShadow) ?? .drop
    generateColors()
    launchTimer()
  }
  
  private func launchTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
     
      if self.inClockMode {  self.calculateTime()
      } else {
        if Int(Calendar.current.component(.second ,from: Date.now)) % self.chaosTimeRefreshInterval == 0 {
          self.generateTime()
        }
      }
      
      if self.seconds % Int(self.refreshColorInterval) == 0 { self.generateColors() }
    
//      if (self.refreshBackgroundInterval) % (self.seconds + 1)  == 0 {
      if self.seconds % (self.refreshBackgroundInterval) == 0 {
      
        self.mainBackground = Color.generateRandom()
        //      Color(hue:        Double.random(in: 0.1...0.95),
        //                 saturation: Double.random(in: 0.1...0.95),
        //                 brightness: Double.random(in: 0.3...0.5),
        //                 opacity: 1)
      }
    
      if self.chaosRandom { self.chaosTimeRefreshInterval = .random(in: (2...4)) }

    }
    
    
  }
  
  private func calculateTime() {
    
    seconds  = Int(Calendar.current.component(.second ,from: Date.now))
    minutes  = Int(Calendar.current.component(.minute ,from: Date.now))
    hours    = Int(Calendar.current.component(.hour   ,from: Date.now))
  }
  
  private func generateTime() {
    seconds = .random(in: 0...59)
    minutes = .random(in: 0...59)
    hours   = .random(in: 0...24)
  }
  
  private func generateColors() {
    hoursArrowColor   = Color.generateRandom()
    minutesArrowColor = Color.generateRandom()
    secondsArrowColor = Color.generateRandom()
//    mainBackground    = Color.generateRandom()
    
  }
}

extension Color {
  static func generateRandom() -> Color {
    return Color(hue:        Double.random(in: 0.01...0.99),
                 saturation: Double.random(in: 0.01...0.99),
                 brightness: Double.random(in: 0.01...0.99),
                 opacity: 1)
  }
}

extension UIColor {
    var inverted: UIColor {
        var a: CGFloat = 0.0, r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? UIColor(red: 1.0-r, green: 1.0-g, blue: 1.0-b, alpha: a) : .black
    }
}


//extension ClockModel : Equatable {
//  static func == (lhs: ClockModel, rhs: ClockModel) -> Bool {
//    lhs.minutes == rhs.minutes ? true : false
//  }
//}




//struct ClockModel_Previews: PreviewProvider {
//    static var previews: some View {
//        ClockModel()
//    }
//}

struct Previews_ClockModel_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
