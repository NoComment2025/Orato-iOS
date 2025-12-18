//
//  LoginModel.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct SignupModel : Encodable{
    var username : String
    var password : String
    var email : String
    var name : String
    
}

struct SignupResponse : Decodable {
    let id : Int
    let username : String
    let name : String
    let role : String?
}

struct Duplicate : Decodable {
    let check : Bool
}


