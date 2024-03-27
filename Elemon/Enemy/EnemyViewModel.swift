//
//  EnemyViewModel.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

class ElementViewModel: ObservableObject {
    @Published var statusModel = StatusModel()
    @Published var enemyStatusModel = EnemyStatusModel()
}
