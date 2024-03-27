//
//  Hunger.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

struct Hunger: View {
    @Binding var hungerPoint: Double
    @Binding var nowHungerPoint: Double
    var body: some View {
        Text("Hunger: \(nowHungerPoint) / \(hungerPoint)")
    }
}
