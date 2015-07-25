//
//  States.swift
//  TestApp
//
//  Created by Rhett Rogers on 7/25/15.
//  Copyright (c) 2015 Rhett Rogers. All rights reserved.
//

import UIKit

enum StateEnum: String {
  case NONE = "None", AK = "AK", AL = "AL", AR = "AR", AZ = "AZ", CA = "CA", CO = "CO", CT = "CT", DE = "DE", FL = "FL", GA = "GA", HI = "HI", IA = "IA", ID = "ID", IL = "IL", IN = "IN", KS = "KS", KY = "KY", LA = "LA", MA = "MA", MD = "MD", ME = "ME", MI = "MI", MN = "MN", MO = "MO", MS = "MS", MT = "MT", NC = "NC", ND = "ND", NE = "NE", NH = "NH", NJ = "NJ", NM = "NM", NV = "NV", NY = "NY", OH = "OH", OK = "OK", OR = "OR", PA = "PA", RI = "RI", SC = "SC", SD = "SD", TN = "TN", TX = "TX", UT = "UT", VA = "VA", VT = "VT", WA = "WA", WI = "WI", WV = "WV", WY = "WY"
  
  static func getEnumForString(str: String) -> StateEnum {
    switch str {
    case "Alabama":
      return StateEnum.AL
    case "Alaska":
      return StateEnum.AK
    case "Arizona":
      return StateEnum.AZ
    case "Arkansas":
      return StateEnum.AR
    case "California":
      return StateEnum.CA
    case "Colorado":
      return StateEnum.CO
    case "Connecticut":
      return StateEnum.CT
    case "Delaware":
      return StateEnum.DE
    case "Florida":
      return StateEnum.FL
    case "Georgia":
      return StateEnum.GA
    case "Hawaii":
      return StateEnum.HI
    case "Idaho":
      return StateEnum.ID
    case "Illinois":
      return StateEnum.IL
    case "Indiana":
      return StateEnum.IN
    case "Iowa":
      return StateEnum.IA
    case "Kansas":
      return StateEnum.KS
    case "Kentucky":
      return StateEnum.KY
    case "Louisiana":
      return StateEnum.LA
    case "Maine":
      return StateEnum.ME
    case "Maryland":
      return StateEnum.MD
    case "Massachusetts":
      return StateEnum.MA
    case "Michigan":
      return StateEnum.MI
    case "Minnesota":
      return StateEnum.MN
    case "Mississippi":
      return StateEnum.MS
    case "Missouri":
      return StateEnum.MO
    case "Montana":
      return StateEnum.MT
    case "Nebraska":
      return StateEnum.NE
    case "Nevada":
      return StateEnum.NV
    case "New Hampshire":
      return StateEnum.NH
    case "New Jersey":
      return StateEnum.NJ
    case "New Mexico":
      return StateEnum.NM
    case "New York":
      return StateEnum.NY
    case "North Carolina":
      return StateEnum.NC
    case "North Dakota":
      return StateEnum.ND
    case "Ohio":
      return StateEnum.OH
    case "Oklahoma":
      return StateEnum.OK
    case "Oregon":
      return StateEnum.OR
    case "Pennsylvania":
      return StateEnum.PA
    case "Rhode Island":
      return StateEnum.RI
    case "South Carolina":
      return StateEnum.SC
    case "South Dakota":
      return StateEnum.SD
    case "Tennessee":
      return StateEnum.TN
    case "Texas":
      return StateEnum.TX
    case "Utah":
      return StateEnum.UT
    case "Vermont":
      return StateEnum.VT
    case "Virginia":
      return StateEnum.VA
    case "Washington":
      return StateEnum.WA
    case "West Virginia":
      return StateEnum.WV
    case "Wisconsin":
      return StateEnum.WI
    case "Wyoming":
      return StateEnum.WY
    default:
      return StateEnum.NONE
    }
  }
}

var stateStrings = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

