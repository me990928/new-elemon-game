//
//  EnemyStatusModel.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/27.
//

import Foundation

// 育成対象用のモデル
struct EnemyStatusModel {
    var name: String = "Enemy"
    var nowHitPoint: Double = 0.0
    var hunger: Double = 0.0
    var Health: String = "none"
}

// 基本データ
struct StatusModel {
    var name: String = "Enemy"
    var hitPoint: Double = 0.0
    var hunger: Double = 0.0
    var Health: String = "none"
}
