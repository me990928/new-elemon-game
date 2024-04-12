//
//  Hunger.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI
import SwiftData

struct Hunger: View {
    
    @Binding var hungerPoint: Double
    
//    @Query private var charactor: [PlayerCharactorItem]
    @Binding var nowHungerPoint: Double
    
//    var body: some View {
//        HStack{
//            Text("L_Hunger")
//            if let nowHungerPoint = charactor.first?.playerHunger {
//                Text(": \(nowHungerPoint) / \(hungerPoint)")
//            }
//        }
//    }
    var body: some View {
        HStack{
            Text("L_Hunger")
            Text(": \(nowHungerPoint) / \(hungerPoint)")
        }
    }
}
