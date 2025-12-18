import SwiftUI

struct GetPWView: View {
    @StateObject var SignupVM : SignupViewModel
    @State var inputpwcheck : String = ""
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
                            Text("비밀번호")
                                .padding(.leading,52)
                                .padding(.bottom,3)
                                .foregroundStyle(.white)
                                .font(.medium(22))
                            Spacer()
                        }
                        Rectangle()
                            .overlay {
                                SecureField("비밀번호 입력", text: $SignupVM.getinfo.password,prompt: Text("비밀번호 변경").foregroundStyle(.authFieldText))
                                    .foregroundColor(.white)
                                    .padding(.leading,38)
                            }
                            .frame(width: 300,height: 50)
                            .cornerRadius(20)
                            .foregroundColor(.authField)
                            .padding(.bottom,16)
                        HStack{
                            Text("비밀번호 확인")
                                .padding(.leading,52)
                                .padding(.bottom,3)
                                .foregroundStyle(.white)
                                .font(.medium(22))
                            Spacer()
                        }
                        Rectangle()
                            .overlay {
                                SecureField("비밀번호 확인", text: $inputpwcheck,prompt: Text("비밀번호 확인").foregroundStyle(.authFieldText))
                                    .foregroundColor(.white)
                                    .padding(.leading,38)
                            }
                            .frame(width: 300,height: 50)
                            .cornerRadius(20)
                            .foregroundColor(.authField)
                            .padding(.bottom,138)
                        Text("\(SignupVM.getinfo)")
                            .foregroundStyle(.white)
                        Button{
                            Task{
                                await SignupVM.signup()
                            }
                        }label: {
                            Text("회원가입")
                                .font(.semibold(22))
                                .frame(width: 300, height: 50)
                                .background(.tagSelected)
                                .opacity(SignupVM.getinfo.password != inputpwcheck || SignupVM.getinfo.password.isEmpty || inputpwcheck.isEmpty ? 0.5 : 1)
                                .cornerRadius(20)
                                .foregroundStyle(.black)
                                
                        }
                        .disabled(SignupVM.getinfo.password != inputpwcheck || SignupVM.getinfo.password.isEmpty || inputpwcheck.isEmpty)
                        .padding(.bottom,48)
                        
                        
                    }
                }
                
        }
        
    }
}

//#Preview {
//    @Previewable @State var step = 1
//    GetPWView(step: $step)
//}
