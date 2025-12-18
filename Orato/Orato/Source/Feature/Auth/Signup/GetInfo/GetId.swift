import SwiftUI

struct GetIDView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var SignupVM : SignupViewModel
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
                            
                            Text("아이디")
                                .padding(.leading,52)
                                .padding(.bottom,3)
                                .foregroundStyle(.white)
                                .font(.medium(22))
                            Spacer()
                        }
                        AuthTextField(showing: "아이디를 입력하세요", input:$SignupVM.getinfo.username)
                        
                        HStack{
                            Spacer()
                            Button{
                                Task{
                                    await SignupVM.idcheck()
                                }
                            }label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 27)
                                        .frame(width: 97,height: 32)
                                        .foregroundStyle(.tagSelected)
                                    Text("중복 확인")
                                        .font(.bold(14))
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(.trailing,32)
                        }
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
                                .opacity(SignupVM.isduplicate ? 1 : 0.5)
                            
                        }
                        .disabled(!SignupVM.isduplicate)
                        .padding(.bottom,48)
                    }
                }
        }
        
    }
}
//
//#Preview {
//    @Previewable @State var step = 1
//    GetIDView(step: $step)
//}
//
