//
//  SignupView.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var VM = SignupViewModel()
    @State var step = 1
    var body: some View {
        switch step{
        case 1:
            GetNameView(SignupVM: VM, step: $step)
        case 2:
            GetIDView(SignupVM: VM,step: $step)
        case 3:
            GetEmailView(SignupVM: VM,step: $step)
        case 4:
            GetPWView(SignupVM: VM,step: $step)
        default:
            GetIDView(SignupVM: VM, step: $step)
        }
    }
}

#Preview {
    SignupView()
}
