//
//  ProfileView.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            VStack{
                Rectangle()
                    .overlay{
                        VStack{
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 100,height: 100)
                            Text("이름")
                                .foregroundStyle(.white)
                            Rectangle()
                                .frame(width: 350,height: 56)
                                .foregroundStyle(.white)
                                .cornerRadius(20)
                            Rectangle()
                                .frame(width: 350,height: 56)
                                .foregroundStyle(.white)
                                .cornerRadius(20)
                            HStack{
                                Rectangle()
                                    .frame(width: 165,height: 41)
                                    .foregroundStyle(.white)
                                Rectangle()
                                    .frame(width: 165,height: 41)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .frame(width: 364,height: 477)
                    .cornerRadius(30)
                    .foregroundStyle(.profileBox)
                    .padding(.bottom,28)
                Rectangle()
                    .overlay{
                        VStack{
                            Text("분석")
                                .foregroundStyle(.white)
                            Text("N회")
                                .foregroundStyle(.white)
                            Rectangle()
                                .frame(width: 165,height: 41)
                                .foregroundStyle(.white)
                            Rectangle()
                                .frame(width: 165,height: 41)
                                .foregroundStyle(.white)
                            Rectangle()
                                .frame(width: 165,height: 41)
                                .foregroundStyle(.white)
                        }
                    }
                    .frame(width: 364,height: 439)
                    .cornerRadius(30)
                    .foregroundStyle(.profileBox)
            }
        }
    }
}


#Preview {
    ProfileView()
}
