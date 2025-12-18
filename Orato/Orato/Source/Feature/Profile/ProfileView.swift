//
//  ProfileView.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileVM = ProfileViewModel()
    @StateObject var recordvm = RecordViewModel()
//    @Binding var move_record : TabViewType
    @State var changing_pw = false
    @State var changing_info = false
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Rectangle()
                    .overlay{
                        VStack{
                            Image(.profile)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.top,20)
                                .padding(.bottom,20)
                            
                            Text(profileVM.userInfo.name)
                                .foregroundStyle(.white)
                                .padding(.bottom,27)
                                .font(.bold(20))
                            Rectangle()
                                .frame(width: 350,height: 56)
                                .foregroundStyle(.black)
                                .cornerRadius(20)
                                .overlay(
                                    HStack{
                                        Text(profileVM.userInfo.id).foregroundStyle(.white)
                                            .padding(.leading,32)
                                            .font(.regular(16))
                                        Spacer()
                                    })
                                .padding(.bottom,15)
                            Rectangle()
                                .frame(width: 350,height: 56)
                                .foregroundStyle(.black)
                                .cornerRadius(20)
                                .overlay(
                                    HStack{
                                        Text(profileVM.userInfo.email).foregroundStyle(.white)
                                            .padding(.leading,32)
                                            .font(.regular(16))
                                        Spacer()
                                    })
                                .padding(.bottom,15)
                            Rectangle()
                                .frame(width: 350,height: 56)
                                .foregroundStyle(.black)
                                .cornerRadius(20)
                                .overlay(
                                    HStack{
                                        Text(String(repeating: "*", count: profileVM.userInfo.pw.count))
                                            .foregroundStyle(.white)
                                            .padding(.leading,32)
                                            .font(.regular(16))
                                        Spacer()
                                        
                                    }
                                )
                                .padding(.bottom,38)
                            HStack(spacing: 10){
                                Button{
//                                    changing_pw.toggle()
                                    print(UserDefaults.standard.string(forKey: "access"))
                                }label: {
                                    Rectangle()
                                        .frame(width: 165,height: 41)
                                        .foregroundStyle(.tagSelected)
                                        .overlay {
                                            Text("비밀번호 변경")
                                                .foregroundStyle(.white)
                                                .font(.semibold(18))
                                        }
                                }.cornerRadius(10)
                                    .sheet(isPresented: $changing_pw) {
                                        profilepwCorrection(profileVM: profileVM,ispresented: $changing_pw)
                                    }
                                Button{
                                    changing_info.toggle()
                                }label: {
                                    Rectangle()
                                        .frame(width: 165,height: 41)
                                        .foregroundStyle(.tagSelected)
                                        .overlay{
                                            Text("프로필 수정")
                                                .foregroundStyle(.white)
                                                .font(.semibold(18))
                                        }
                                }.cornerRadius(10)
                                    .sheet(isPresented: $changing_info) {
                                        InfocorrectionView(profileVM: ProfileViewModel())
                                }
                            }
                            Button{
                                UserDefaults.standard.removeObject(forKey: "access")

                            }label: {
                                ZStack{
                                    Rectangle()
                                        .frame(width:340,height: 41)
                                        .foregroundStyle(.tagSelected)
                                        .cornerRadius(10)
                                    Text("로그아웃")
                                        .foregroundStyle(.white)
                                        .font(.semibold(18))
                                }
                            }
                            
                            .padding(.top,10)
                            .padding(.bottom,20)
                            
                            
                        }
                    }
                    .frame(width: 364,height: 540)
                    .cornerRadius(30)
                    .foregroundStyle(.profilebox)
                    .padding(.bottom,28)
                Rectangle()
                    .overlay{
                        VStack{
                            HStack{
                                Text("분석")
                                    .foregroundStyle(.white)
                                    
                                    .padding(.leading,25)
                                    .font(.bold(22))
                                Spacer()
                                Button{
//                                    move_record = .record
                                    print("그거 눌림")
                                }label: {
                                    Text(">")
                                        .font(.bold(25))
                                        .foregroundStyle(.white)
                                }
                                .padding(.trailing,30)
                            }
                            .padding(.top,20)
                            
                            Text("\(profileVM.userInfo.analyze_number)회")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .padding(.top,20)
                                .padding(.bottom,35)
                            VStack(spacing: 20){
                                ForEach(recordvm.array.prefix(3)){item in
                                    profile_RecordItem(title: item.topic, tag: Tag(rawValue: item.tag)!)
                                }
                            }
                            .padding(.bottom,67)
                        }
                    }
                    .frame(width: 364,height: 439)
                    .cornerRadius(30)
                    .foregroundStyle(.profilebox)
            }
        }
        .task {
            await profileVM.getprofile()
        }
    }
}


#Preview {
    ProfileView(profileVM: ProfileViewModel(),)
}
