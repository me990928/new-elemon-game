//
//  HitPoint.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI
import SwiftData

struct HitPoint: View {
    @State var hitPoint: Double
    @State var nowHitPoint: Double
    
    var body: some View {
        HStack{
            Text("L_HP")
            Text(": \(nowHitPoint) / \(hitPoint)")
        }
    }
}
