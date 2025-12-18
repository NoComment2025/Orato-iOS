//
//  Test.swift
//  Orato
//
//  Created by maple on 10/28/25.
//



//
//  LoginView.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct GetEmailView: View {
    @StateObject var SignupVM : SignupViewModel
    @State var inputname : String = ""
    @Binding var step : Int
    var body: some View {
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
                            
                            Text("이메일")
                                .padding(.leading,52)
                                .padding(.bottom,3)
                                .foregroundStyle(.white)
                                .font(.medium(22))
                            Spacer()
                        }
                        AuthTextField(showing: "이메일를 입력하세요", input:$SignupVM.getinfo.email)
                            .padding(.bottom,249)
                       
                       
                        Button{
                            step += 1
                        }label: {
                            Text("다음")
                                .font(.semibold(22))
                                .frame(width: 300, height: 50)
                                .background(.tagSelected)
                                .cornerRadius(20)
                                .foregroundStyle(.black)
                                
                        }
                        .padding(.bottom,48)
                    }
                }
        }
        
    }
}

//#Preview {
//    @Previewable @State var step = 1
//    GetNameView(step: $step)
//}
