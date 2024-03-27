//
//  EnemyName.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

struct EnemyName: View {
    
    @Binding var name: String
    
    var body: some View {
        Text("Name: \(name)")
    }
}
