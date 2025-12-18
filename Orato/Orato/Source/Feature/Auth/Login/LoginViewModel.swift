//
//  LoginViewModel.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI


class LoginViewModel : ObservableObject {
    @Published var Login : LoginModel = LoginModel(username: "", password: "")
    @Published var yaho : Bool = false
    
    func login() async{
        do{
            let response = try await NetworkRunner.share.request("auth/login", method: .post, parameters: Login,isAuthorization: false,response: LoginResponse.self)
            UserDefaults.standard.set(response.data.access, forKey: "access")
            print("됨")
            yaho = true
        } catch {
            print("로그인 실패", error.localizedDescription)
        }
    }
}
