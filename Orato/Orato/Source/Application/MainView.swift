//
//  MainView.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI
struct MainView: View {
    @State var selected : TabViewType = .analyze
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(.lgo)
                    Spacer()
                }
                .padding(0)
                    ZStack {
                        switch selected {
                        case .record:
                            recordView(recordVM: RecordViewModel())
                        case .analyze:
                            AnalyzView()
                        case .profile:
                            ProfileView(profileVM: ProfileViewModel()/*,move_record: $selected*/)
                        }
                    }
                TabViewdesign(selected: $selected)
            }
        }
    }
}
#Preview {
    MainView()
}
