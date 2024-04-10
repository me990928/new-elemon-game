//
//  Health.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

struct Health: View {
    
    @State var health: String
    
    var body: some View {
        HStack{
            Text("L_Health")
            Text(": \(health)")
        }
    }
    
}

