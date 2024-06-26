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
    var text: String // Localizable key
}

struct Message: View {
    
    @ObservedObject var sysArgVM: SystemArgmentsViewModel
    
    @State var boxHeight: CGFloat = 0
    
    @State var messageData: [MessageModel] = [
        MessageModel(index: 1, text: "やあ！"),
        MessageModel(index: 1, text: "こんにちは。"),
        MessageModel(index: 2, text: "僕の名前はパーカーちゃんだよ！"),
        MessageModel(index: 2, text: " ")
    ]
    
    @State var name = "Enemy_Name_Test"
    
    var body: some View {
        ZStack{
            if sysArgVM.sysArgModel.msgIndex <= messageData[messageData.count - 1].index && sysArgVM.sysArgModel.msgIndex != 0 {
                
                VStack(spacing: 0){
                    HStack{
                        Text(LocalizedStringKey(name)).bold().font(.title2).padding([.top, .leading])
                        Spacer()
                    }
                    
                    Button(action: {
                        withAnimation(Animation.linear(duration: 0.1)) {
                            if sysArgVM.sysArgModel.msgIndex != messageData[messageData.count - 1].index {
                                sysArgVM.sysArgModel.msgIndex += 1
                            } else {
                                sysArgVM.sysArgModel.msgIndex = 0
                                sysArgVM.sysArgModel.msgSafeFlag = false
                            }
                        }
                    }, label: {
                            VStack{
                                ForEach(messageData, id: \.self){ msg in
                                    if sysArgVM.sysArgModel.msgIndex == msg.index {
                                        HStack{
                                            Text(msg.text).padding(.horizontal)
                                            Spacer()
                                        }
                                    }
                                }
                            }.padding(.vertical).foregroundStyle(Color(.label)).overlay {
                                ZStack{
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Spacer()
                                            Text("▽")
                                        }.padding()
                                    }
                                }
                            }
                    })
                }.frame(width: .infinity).background(Material.ultraThickMaterial).clipShape(.rect(cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)))
            }
        }
    }
    
}

#Preview {
    ContentView()
}
