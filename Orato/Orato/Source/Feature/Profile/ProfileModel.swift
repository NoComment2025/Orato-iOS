//
//  ProfileModel.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI

struct ProfileModel:Identifiable,Codable {
    var id : String
    var pw : String
    var name : String
    var email : String
    var analyze_number : Int
    var create_at : Date? = nil //가입일
    var update_at : Date? = nil //수정일
}

struct pwchange : Encodable {
    var userid : String
    var currentpw : String = ""
    var changepw : String = ""
}
