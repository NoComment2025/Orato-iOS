//
//  LoginModel.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct LoginModel : Encodable{
    var username : String
    var password : String
}

struct LoginResponse : Decodable {
    let status : Int
    let data : data
}

struct data : Decodable {
    let access : String
    let name : String
    let username : String
    let email : String
}
