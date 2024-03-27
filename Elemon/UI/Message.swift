//
//  Message.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI
import UIKit

struct MessageModel: Hashable {
    var index: Int
    var text: String
}

struct Message: View {
    
    @State var boxHeight: CGFloat = 0
    
    @Binding var msgIndex: Int
    @State var messageData: [MessageModel] = [
        MessageModel(index: 1, text: "やあ！"),
        MessageModel(index: 1, text: "こんにちは。"),
        MessageModel(index: 2, text: "僕の名前はパーカーちゃんだよ！")
    ]
    
    var body: some View {
        if msgIndex <= messageData[messageData.count - 1].index && msgIndex != 0 {
            
            VStack(spacing: 0){
                HStack{
                    Text("name").bold().font(.title2).padding([.top, .leading])
                    Spacer()
                }
                
                Button(action: {
                    withAnimation {
                        if msgIndex != messageData[messageData.count - 1].index {
                            msgIndex += 1
                        } else {
                            msgIndex = 0
                        }
                    }
                }, label: {
                    VStack{
                        ForEach(messageData, id: \.self){ msg in
                            if msgIndex == msg.index {
                                HStack{
                                    Text(msg.text).padding(.horizontal)
                                    Spacer()
                                }
                            }
                        }
                    }.padding(.vertical).foregroundStyle(Color(.label))
                })
            }.frame(width: .infinity).background(Material.ultraThickMaterial).clipShape(.rect(cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)))
        }
    }
    
}
