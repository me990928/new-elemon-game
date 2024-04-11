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
    
    @AppStorage ("firstUp") var firstUp: Bool = true
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var charactor: [PlayerCharactorItem]
    
    @StateObject var enemyVM = EnemyViewModel()
    @StateObject var sysArgVM = SystemArgmentsViewModel()
    @StateObject var playerCharaSV = PlayerCharactorService()
    
//    @StateObject var test = PlayerTestCharactor()
    
    let firstChar = PlayerCharactorItem(gameId: UUID().uuidString, charData: TestCharctor().charData, playerName: TestCharctor().charName, playerHitpoint: TestCharctor().hitpoint, playerHunger: TestCharctor().hunger, playerHealth: TestCharctor().health)
    
    // System Flag
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                ZStack{
                    ZStack{
                        Button(action: {
                            sysArgVM.sysArgModel.msgSafeFlag = true
                            withAnimation(Animation.linear(duration: 0.1)) {
                                if sysArgVM.sysArgModel.msgIndex == 0 { sysArgVM.sysArgModel.msgIndex = 1 }
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
                        }).buttonStyle(MyPushButtonStyle()).disabled(sysArgVM.sysArgModel.msgIndex != 0)
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
                        }.disabled(sysArgVM.sysArgModel.msgSafeFlag)
                    }
                    VStack{
                        HStack{
                            // 簡易ステータス表示
                            EasyStatus(enemyVM: enemyVM, sysArgVM: sysArgVM).disabled(sysArgVM.sysArgModel.msgSafeFlag)
                            Spacer()
                        }.padding()
                        Spacer()
                    }
                    
                    VStack{
                        Spacer()
                        Message(sysArgVM: sysArgVM).padding().transition(.opacity)
                        Spacer().frame(height: 100)
                    }
                }
            }.onAppear(){
                // 起動時処理
                if firstUp {
                    // データが存在しない場合に挿入するテストデータ
                    modelContext.insert(firstChar)
                    try! modelContext.save()
                    firstUp.toggle()
                }
                
                if let charData = charactor.first?.charData {
                    playerCharaSV.charRepo.setGameCharactorData(charData: charData)
                    enemyVM.setStatusModel(model: playerCharaSV.charRepo.selectedCharData)
//                    print(enemyVM.statusModel)
                } else {
                    // 起動失敗処理
                    print("run faild")
                }
                
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: [Item.self, PlayerCharactorItem.self], inMemory: true)
}
