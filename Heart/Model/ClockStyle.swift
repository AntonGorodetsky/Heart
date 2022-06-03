//
//  ClockStyleModel.swift
//  Heart
//
//  Created by Anton Gorodetsky on 30.05.2022.
//

import SwiftUI

enum ClockStyle: CaseIterable, Identifiable {
  
  case  drop, gear, grid, grid3, other
  
  var id: Self { self }
  
  var name: String {
    switch self {
//    case .square2: return "square.grid.3x3.fill"
    case .drop: return "drop"
    case .gear: return "gear"
    case .grid: return "grid"
    case .grid3: return "grid3"
    default: return "brain"
    }
  }
  var arrowImageName: String {
    switch self {
    case .drop:   return "drop.fill"            // "drop.circle.fill"
//    case .circle: return "square.grid.3x3.fill" // "circle.circle.fill" // "drop.circle.fill"
    case .grid: return "square.grid.2x2.fill" // "arrowtriangle.up.square.fill" "triangle.fill",
    case .gear: return "gearshape.fill"
    case .grid3: return "square.grid.3x3.fill"
    default: return ["brain",
                     "circle.hexagongrid.fill",
                     "seal.fill",
                    
                     "star.fill",

                     "scale.3d",
                     "cube.fill"][0]
      
/*
 arrow.up.and.down.and.arrow.left.and.right
 aqi.medium
 circle.hexagongrid.fill
 seal.fill
 suit.spade.fill
 pentagon.fill
 star.fill
 gearshape.fill
 scale.3d
 scale.3d
 cube.fill
  */
    }
    
  }
  var primaryRotationAngle: Angle {
    switch self {
    case .drop: return Angle.zero
    case .other: return Angle(degrees: 0)
    default:    return Angle(degrees: 45)
    }
  }
  var arrowOffset: CGFloat {
    switch self {
    case .drop: return -20
    case .other: return -45
    default: return 0
    }
  }
  var aspectRatio: CGFloat {
    switch self {
    case .drop:   return 1
    case .grid: return 1
    default:      return 1
    }
  }
  
  var hourArrowScale: CGFloat {
    switch self {
    case .drop:   return 1
    case .gear: return 1
    case .grid, .grid3: return 0.74
    default:      return 0.9
    }
  }
  var minutesArrowScale: CGFloat {
    switch self {
    case .drop:   return 0.63
    case .gear: return 0.87
    case .grid, .grid3: return self.hourArrowScale - 0.15
    default:      return self.hourArrowScale - 0.15
    }
  }
  var secondsArrowScale: CGFloat {
    switch self {
    case .drop:   return 0.53
    case .gear: return 0.75
    case .grid, .grid3: return self.minutesArrowScale - 0.15
    default:      return self.minutesArrowScale - 0.15
    }
  }
  
  var hourArrowPadding: CGFloat {
    switch self {
    case .drop:   return 20
    case .gear: return 3
    case .grid, .grid3: return 0 // 55
    default:      return 0
    }
  }
  var minutesArrowPadding: CGFloat {
    switch self {
    case .drop:    return 0
    case .gear:  return 30
    case .grid, .grid3:  return 0
//      self.hourArrowPadding + 5
    default: return 0
    }
  }
  var seconsArrowPadding: CGFloat {
    switch self {
    case .drop:   return 70
    case .gear: return 65
    case .grid, .grid3: return 0 //70
    default: return 30
    }
  }

  var hoursDigitOffset: CGFloat {
    switch self {
    case .drop: return arrowOffset + 5
    case .gear: return 5
    case .grid, .grid3: return -55
    default: return -30
    }
  }
  var minutesDigitOffset: CGFloat {
    switch self {
    case .drop:   return arrowOffset + 7
    case .gear: return 10
    case .grid, .grid3: return self.hoursDigitOffset + 5
    default: return self.hoursDigitOffset
    }
  }
  var secondsDigitOffset: CGFloat {
    switch self {
    case .drop:   return arrowOffset + 7
    case .gear: return 15
    case .grid, .grid3: return self.minutesDigitOffset
    default: return self.minutesDigitOffset
    }
  }
  
  
  
  
  
  var mainBackground: Color {
    return /*@START_MENU_TOKEN@*/Color(hue: 0.774, saturation: 0.931, brightness: 0.269)/*@END_MENU_TOKEN@*/
    /*@START_MENU_TOKEN@*/Color(hue: 0.727, saturation: 0.789, brightness: 0.857, opacity: 0.909)/*@END_MENU_TOKEN@*/
    /*@START_MENU_TOKEN@*/Color(hue: 0.746, saturation: 0.934, brightness: 0.486)/*@END_MENU_TOKEN@*/
  }
}

//var layout: ClockStyle = .circle


