//
//  TabViewdesign.swift
//  Orato
//
//  Created by maple on 9/9/25.
//

import SwiftUI

struct TabViewdesign: View {
    @Binding var selected : TabViewType
    
    var body: some View {
            Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 115)
                .foregroundColor(Color.tab)
                .overlay {
                    VStack{
                        HStack{
                            ForEach(TabViewType.allCases, id: \.self){item in
                                Button{selected = item}label: {
                                    Image(item.image)
                                        .frame(width: 60, height: 60)
                                        .background(selected == item ? .tagSelected : .tab)
                                        .cornerRadius(10)
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        HStack{
                            ForEach(TabViewType.allCases, id: \.self){item in
                                Text(item.text)
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                    }
                }
                
        
    }
}

