//
//  ClockFace.swift
//  Heart
//
//  Created by Anton Gorodetsky on 31.05.2022.
//

import SwiftUI

struct ClockFace: View {
  @ObservedObject var clock: ClockModel
    var body: some View {
      ZStack {
        Circle()
          .foregroundColor(Color.gray)
          .opacity(0)
        Arrow(
          arrowColor:    clock.hoursArrowColor,
          digitColor:    clock.hoursDigitColor,
          digit:         $clock.hours,
          arrowRotation: clock.hoursArrowRotation,
          digitRotation: clock.hoursDigitRotation,
          digitOffset: clock.style.hoursDigitOffset,
          arrowPadding: clock.style.hourArrowPadding,
          style: clock.style,
          showDigit: clock.inClockMode
        )
        .scaleEffect(clock.style.hourArrowScale)
             
        Arrow(
          arrowColor:    clock.minutesArrowColor,
          digitColor:    clock.minutesDigitColor,
          digit:         $clock.minutes,
          arrowRotation: clock.minutesArrowRotation,
          digitRotation: clock.minutesDigitRotation,
          digitOffset:  clock.style.minutesDigitOffset,
          arrowPadding: clock.style.minutesArrowPadding,
          style:          clock.style,
          showDigit: clock.inClockMode
        ).scaleEffect(clock.style.minutesArrowScale)
       
        Arrow(
          arrowColor:    clock.secondsArrowColor,
          digitColor:    clock.secondsDigitColor,
          digit:         $clock.seconds,
          arrowRotation: clock.secondsArrowRotation,
          digitRotation: clock.secondsDigitRotation,
          digitOffset: clock.style.secondsDigitOffset,
          arrowPadding: clock.style.seconsArrowPadding,
          style: clock.style,
          showDigit:  clock.inClockMode //false
        ).scaleEffect(clock.style.secondsArrowScale)
        .scaleEffect(Int(clock.seconds) % 2 == 0 ? 0.99 : 1)
        .scaleEffect(
          Int(clock.seconds) == 0 && clock.inClockMode ? 0.3 : 1)
      }
      .animation(.easeInOut(duration: clock.inClockMode ? 0.7 : Double(clock.chaosTimeRefreshInterval) * 0.7), value: clock.seconds) //clock.arrowMovementAnimation
      .padding()
    }
}

struct ClockFace_Previews: PreviewProvider {
    static var previews: some View {
      ClockFace(clock: ClockModel())
      
    }
}
