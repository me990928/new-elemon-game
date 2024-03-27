//
//  ContentView.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI
import SwiftData

import SwiftUI

struct MyPushButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(configuration.isPressed ? .clear : .clear)
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @StateObject var enemyVM = EnemyViewModel()
    @StateObject var sysArgVM = SystemArgmentsViewModel()
    
//    messageUI用変数、ViewModel作成時に削除
    @State var msgIndex: Int = 0
    @State var messageHeight: Int = 2
    
    // System Flag
    // message Level Safety
    @State var msgSafeFlag: Bool = false
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                ZStack{
                    ZStack{
                        Button(action: {
                            msgSafeFlag = true
                            withAnimation(Animation.linear(duration: 0.1)) {
                                if msgIndex == 0 { msgIndex = 1 }
                            }
                        }, label: {
                            VStack{
                                Rectangle().opacity(0).frame(minWidth: 300).frame(width: geo.size.width).overlay {
                                    VStack{
                                        Spacer()
                                        Image("skin").resizable().aspectRatio(contentMode: .fit)
                                    }
                                }.ignoresSafeArea()
                            }
                        }).buttonStyle(MyPushButtonStyle()).disabled(msgIndex != 0)
                        VStack(){
                            Spacer()
                                HStack{
                                    Button(action: {}, label: {
                                        Image(systemName: "fork.knife").font(.title)
                                    }).padding()
                                    Button(action: {}, label: {
                                        Image(systemName: "stethoscope").font(.title)
                                    }).padding()
                                    Button(action: {}, label: {
                                        Image(systemName: "bed.double").font(.title)
                                    }).padding()
                                    Button(action: {}, label: {
                                        Image(systemName: "note.text").font(.title)
                                    }).padding()
                                }.frame(width: geo.size.width).background(Material.ultraThinMaterial)
                                .foregroundStyle(Color.mint)
                        }.disabled(msgSafeFlag)
                    }
                    VStack{
                        HStack{
//                            Rectangle().opacity(0).frame(width: 270, height: 150).overlay {
//                                HStack{
//                                    VStack(alignment: .leading){
//                                        EnemyName(name: $elementVM.enemyStatusModel.name)
//                                        HitPoint(hitPoint: $elementVM.statusModel.hitPoint, nowHitPoint: $elementVM.enemyStatusModel.nowHitPoint)
//                                        Hunger(hungerPoint: $elementVM.enemyStatusModel.hunger, nowHungerPoint: $elementVM.statusModel.hunger)
//                                        Health(health: $elementVM.enemyStatusModel.Health)
//                                    }.padding()
//                                    Spacer()
//                                }
//                            }.background(Material.ultraThinMaterial.opacity(0.8)).clipShape(.rect(
//                                cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)
//                            ))
                            EasyStatus(enemyVM: enemyVM, sysArgVM: sysArgVM).disabled(msgSafeFlag)
                            Spacer()
                        }.padding()
                        Spacer()
                    }
                    
                    VStack{
                        Spacer()
                        Message(msgSafeFlag: $msgSafeFlag, messageHeight: $messageHeight, msgIndex: $msgIndex).padding().transition(.opacity)
                        Spacer().frame(height: 100)
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
