//
//  Health.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

import SwiftUI

struct Health: View {
    
    @Binding var health: String
    
    var body: some View {
        Text("Health: \(health)")
    }
    
}

