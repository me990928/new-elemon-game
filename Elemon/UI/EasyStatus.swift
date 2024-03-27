//
//  EasyStatus.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

struct EasyStatus: View {
    
    @ObservedObject var enemyVM: EnemyViewModel
    
    @State var openStatus: Bool = false
    
    var body: some View {                            Rectangle().opacity(0).frame(width: 270, height: openStatus ? 150 : 35).overlay {
                                        ZStack{
                                            if openStatus {
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        EnemyName(name: $enemyVM.enemyStatusModel.name)
                                                        HitPoint(hitPoint: $enemyVM.statusModel.hitPoint, nowHitPoint: $enemyVM.enemyStatusModel.nowHitPoint)
                                                        Hunger(hungerPoint: $enemyVM.enemyStatusModel.hunger, nowHungerPoint: $enemyVM.statusModel.hunger)
                                                        Health(health: $enemyVM.enemyStatusModel.Health)
                                                    }.padding()
                                                    Spacer()
                                                }
                                            }
                                            Button(action: {
                                                withAnimation(.linear){
                                                    openStatus.toggle()
                                                }
                                            }, label: {
                                                VStack{
                                                    HStack{
                                                        Text("ステータス").padding(.leading)
                                                        Spacer()
                                                        Text("▽").padding(.trailing)
                                                    }
                                                    Spacer()
                                                }.padding(.top, 6).foregroundStyle(.mint)
                                            })
                                        }
                                    }.background(Material.ultraThinMaterial.opacity(0.8)).clipShape(.rect(
                                        cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)
                                    ))
    }
}

#Preview {
    ContentView()
}
