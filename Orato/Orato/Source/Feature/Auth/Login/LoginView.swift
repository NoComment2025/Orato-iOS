//
//  LoginView.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var LoginVM = LoginViewModel()
    @State var issave : Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                AuthBackground()
                    .edgesIgnoringSafeArea(.all)
                RoundedRectangle(cornerRadius: 25)
                    .opacity(0.7)
                    .frame(width: 343,height: 780)
                    .overlay{
                        VStack{
                            Image("Lgo")
                                .padding(.bottom,76)
                            HStack{
                                Text("아이디")
                                    .padding(.leading,52)
                                    .padding(.bottom,3)
                                    .foregroundStyle(.white)
                                    .font(.medium(22))
                                Spacer()
                            }
                            AuthTextField(showing: "아이디를 입력하세요", input:$LoginVM.Login.username)
                                .textInputAutocapitalization(.never)
                                .padding(.bottom,16)
                            HStack{
                                Text("비밀번호")
                                    .padding(.leading,52)
                                    .foregroundStyle(.white)
                                    .font(.medium(22))
                                    .padding(.bottom,3)
                                Spacer()
                            }
                            AuthTextField(showing: "비밀번호를 입력하세요",input: $LoginVM.Login.password)
                                .textInputAutocapitalization(.never)
                            HStack{
                                Button{
                                    issave.toggle()
                                }label:{
                                    HStack{
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.white)
                                            .frame(width: 20,height: 20)
                                            .foregroundStyle(issave ? .white : .clear)
                                        
                                        Text("아이디 저장")
                                            .tint(.white)
                                    }
                                }
                                .padding(.leading,52)
                                Spacer()
                            }
                            
                            Button{
                                Task{
                                    await LoginVM.login()
                                }
                            }label: {
                                Text("로그인")
                                    .font(.semibold(22))
                                    .frame(width: 300, height: 50)
                                    .background(.tagSelected)
                                    .cornerRadius(20)
                                    .foregroundStyle(.black)
                                    .padding(.top,103)
                                
                            }
                            .padding(.bottom,48)
                            .navigationDestination(isPresented: $LoginVM.yaho) {
                                MainView()
                            }
                                NavigationLink{
                                    SignupView()
                                }label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white)
                                            .frame(width: 300,height: 50)
                                        Text("회원가입")
                                            .font(.semibold(22))
                                            .foregroundStyle(.white)
                                    }
                                }
                                .navigationBarBackButtonHidden(true)
                            }
                        }
                    }
            }
        }
        
    }

#Preview {
    LoginView()
}
