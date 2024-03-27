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
    @State var isButtonEnabled: Bool = false
    
    var body: some View {
        Rectangle().opacity(0).frame(width: 270, height: openStatus ? 140 : 35).overlay {
            ZStack{
                if openStatus {
                    HStack{
                        VStack(alignment: .leading){
                            Spacer()
                            EnemyName(name: $enemyVM.enemyStatusModel.name)
                            HitPoint(hitPoint: $enemyVM.statusModel.hitPoint, nowHitPoint: $enemyVM.enemyStatusModel.nowHitPoint)
                            Hunger(hungerPoint: $enemyVM.enemyStatusModel.hunger, nowHungerPoint: $enemyVM.statusModel.hunger)
                            Health(health: $enemyVM.enemyStatusModel.Health)
                        }.padding()
//                                                    Spacer()
                    }
                }
                VStack{
                    Button(action: {
                        isButtonEnabled.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            isButtonEnabled.toggle()
                        }
                        withAnimation(Animation.linear(duration: 0.3)){
                            openStatus.toggle()
                        }
                    }, label: {
                        VStack{
                            HStack{
                                Text("Status").padding(.leading)
                                Spacer()
                                Image(systemName: openStatus ? "circle.fill" : "circle").padding(.trailing)
                            }
                            Spacer()
                        }.padding(.top, 6).foregroundStyle(.mint)
                    }).disabled(isButtonEnabled)
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
