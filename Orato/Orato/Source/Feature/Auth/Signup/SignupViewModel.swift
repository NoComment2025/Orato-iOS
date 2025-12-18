//
//  SignupModel.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI
@MainActor
class SignupViewModel : ObservableObject{
    @Published var getinfo : SignupModel = SignupModel(username: "", password: "", email: "", name: "")
    @Published var isduplicate = false
    @Published var errormessage = ""
    @Published var showalert = false
    
    func signup() async {
        do {
            print(getinfo)
            let result = try await NetworkRunner.share.request("auth/signup", method: .post, parameters: getinfo, response: SignupResponse.self)
            print("회원가입됨",result)
        } catch {
            print("회원가입안됨",error.localizedDescription)
        }
    }
    
    func idcheck() async {
        do {
            let result = try await NetworkRunner.share.request("auth/checkIdDuplicate", method: .post, parameters: ["userid" : getinfo.username], response: Duplicate.self)
            if result.check {
                errormessage = "중복됨"
                isduplicate = false
                
            } else {
                isduplicate = true
                errormessage = "중복안됨"
            }
            showalert = true
        } catch {
            errormessage = "\(error.localizedDescription)"
        }
        showalert = true
    }
    
    
}
