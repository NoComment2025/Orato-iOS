//
//  profileCorrection.swift
//  Orato
//
//  Created by maple on 10/17/25.
//

import SwiftUI

struct InfocorrectionView: View {
    @ObservedObject var profileVM : ProfileViewModel
    
    @State var aftername : String = ""
    @State var afterid : String = ""
    var body: some View {
        ZStack{
            Color.black
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.tcolor)
                .overlay{
                    VStack{
                        Text("프로필 수정")
                            .foregroundStyle(.white)
                            .font(.bold(20))
                            .padding(.bottom,20)
                            
                        HStack{
                            Text("아이디")
                                .foregroundStyle(.white)
                                .font(.semibold(18))
                                .padding(.leading,40)
                            Spacer()
                            
                        }
                        AuthTextField(showing: profileVM.userInfo.id, input: $afterid)
                            .padding(.bottom,20)
                        HStack{
                            Text("이름")
                                .foregroundStyle(.white)
                                .font(.semibold(18))
                                .padding(.leading,40)
                            Spacer()
                        }
                        AuthTextField(showing: profileVM.userInfo.name, input: $aftername)
                            .padding(.bottom,20)
                        Button{
                         
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
                .foregroundStyle(.gray)
            
        }
    }
}

#Preview {
    @Previewable @State var ispresented : Bool = false
    InfocorrectionView(profileVM : ProfileViewModel())
}
