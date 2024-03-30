//
//  EasyStatus.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

struct EasyStatus: View {
    
    @ObservedObject var enemyVM: EnemyViewModel
    @ObservedObject var sysArgVM: SystemArgmentsViewModel
    
    @ObservedObject var test: PlayerTestCharactor
    
//    @State var openStatus: Bool = false
//    @State var isButtonEnabled: Bool = false
    
    var body: some View {
        Rectangle().opacity(0).frame(width: 270, height: sysArgVM.sysArgModel.openStatus ? 140 : 35).overlay {
            ZStack{
                if sysArgVM.sysArgModel.openStatus {
                    HStack{
                        VStack(alignment: .leading){
                            Spacer()
//                            EnemyName(name: $enemyVM.enemyStatusModel.name)
//                            HitPoint(hitPoint: $enemyVM.statusModel.hitPoint, nowHitPoint: $enemyVM.enemyStatusModel.nowHitPoint)
//                            Hunger(hungerPoint: $enemyVM.enemyStatusModel.hunger, nowHungerPoint: $enemyVM.statusModel.hunger)
//                            Health(health: $enemyVM.enemyStatusModel.Health)
                            EnemyName(name: $test.playerName)
                            HitPoint(hitPoint: $test.playerHitpoint, nowHitPoint: $test.charData.hitpoint)
                            Hunger(hungerPoint: $test.playerHunger, nowHungerPoint: $test.charData.hunger)
                            Health(health: $test.playerHealth)
                        }.padding()
//                                                    Spacer()
                    }
                }
                VStack{
                    Button(action: {
                        sysArgVM.sysArgModel.isButtonEnabled.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            sysArgVM.sysArgModel.isButtonEnabled.toggle()
                        }
                        withAnimation(Animation.linear(duration: 0.3)){
                            sysArgVM.sysArgModel.openStatus.toggle()
                        }
                    }, label: {
                        VStack{
                            HStack{
                                Text("L_Status").padding(.leading)
                                Spacer()
                                Image(systemName: sysArgVM.sysArgModel.openStatus ? "circle.fill" : "circle").padding(.trailing)
                            }
                            Spacer()
                        }.padding(.top, 6).foregroundStyle(.mint)
                    }).disabled(sysArgVM.sysArgModel.isButtonEnabled)
                }
            }
        }.background(Material.ultraThinMaterial.opacity(0.8)).clipShape(.rect(
            cornerRadii: .init(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)
        ))
    }
}

#Preview {
    ContentView()
}
