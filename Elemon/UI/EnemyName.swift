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
        HStack{
            Text("L_Name")
            Text(":")
            Text(LocalizedStringKey(name))
        }
    }
}
