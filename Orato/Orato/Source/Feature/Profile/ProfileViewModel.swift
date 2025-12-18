//
//  ProfileViewModel.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI


class ProfileViewModel : ObservableObject{
    @Published var userInfo : ProfileModel = ProfileModel(id: "hi", pw: "q1w2e3r4", name: "전승호", email: "yaho",analyze_number: 8)
    @Published var patchpw : pwchange = pwchange(userid: "", currentpw: "", changepw: "")
    
    func getprofile() async{
        do{
            let profile = try await NetworkRunner.share.request("api/my/info", method: .get, response: ProfileModel.self)
            userInfo = profile
        } catch{
            print(error)
        }
    }
    
    
    func patchprofile() async{
        do {
            let result = try await NetworkRunner.share.request("/", method: .post, parameters: patchpw)
        } catch {
            
        }
    }
}
