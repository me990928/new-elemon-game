//
//  EnemyViewModel.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import SwiftUI

class EnemyViewModel: ObservableObject {
    @Published var statusModel = StatusModel()
    @Published var enemyStatusModel = EnemyStatusModel()
    
    // 基本データのセット
    func setStatusModel(model: TestCharctor){
        self.statusModel.hitPoint = model.hitpoint
        self.statusModel.hunger = model.hunger
        self.statusModel.Health = model.health
        self.statusModel.name = model.charName
    }
}
