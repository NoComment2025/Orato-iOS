//
//  profileCorrection.swift
//  Orato
//
//  Created by maple on 10/17/25.
//

import SwiftUI

struct profilepwCorrection: View {
    @ObservedObject var profileVM : ProfileViewModel
    @Binding var ispresented : Bool
    @State var before : String = ""
    @State var after : String = ""
    var body: some View {
        ZStack{
            Color.black
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.tcolor)
                .overlay{
                    VStack{
                        Text("비밀번호 변경")
                            .foregroundStyle(.white)
                            .font(.bold(20))
                            .padding(.bottom,20)
                        HStack{
                            Text("기존 비밀번호")
                                .foregroundStyle(.white)
                                .padding(.leading,40)
                                .font(.semibold(18))
                            Spacer()
                        }
                        AuthTextField(input:$profileVM.patchpw.currentpw)
                            .padding(.bottom,20)
                        HStack{
                            Text("새로운 비밀번호")
                                .foregroundStyle(.white)
                                .padding(.leading,40)
                                .font(.semibold(18))
                            Spacer()
                        }
                        AuthTextField(input: $profileVM.patchpw.changepw)
                            .padding(.bottom,20)
                        Button{
                            Task{
                                await profileVM.patchprofile()
                                ispresented.toggle()
                            }
                        }label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 165,height: 40)
                                .overlay{
                                    ZStack{
                                        Color.tagSelected
                                        Text("변경")
                                            .foregroundStyle(.black)
                                }
                            }
                        }
                    }
                }
                .frame(width: 340,height: 360)
            
        }
    }
}

#Preview {
    @Previewable @State var ispresented : Bool = false
    profilepwCorrection(profileVM : ProfileViewModel(), ispresented: $ispresented)
}
