//
//  recordModel.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI

struct yaho : Identifiable,Codable{
    var id = UUID()
    var topic : String
    var content : String
    var date : Int
    var tag : Tag
    var progress : progress
    var ischecked : Bool = false
    var currentTime : Date
}

//struct recordResponse : Decodable {
//    let
//}
struct RecordModel : Decodable, Identifiable {
    var id : Int
    var topic : String
    var status : String
    var type : String
    var feedbackMd : String
    var tag : String
    var createdDate : String
    var updatedDate : String
    var analysis_id : Int
}

struct RecordResponse : Decodable {
    let records : [RecordModel]
}
