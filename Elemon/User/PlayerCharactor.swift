//
//  PlayerCharactor.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/31.
//

import Foundation
import SwiftUI
import SwiftData

// 育成キャラデータ ここを書き換える
protocol PlayerCharactor {
    var charData: String { get set }
    var playerName: String { set get }
    var playerHitpoint: Double { set get }
    var playerHunger: Double { set get }
    var playerHealth: String { set get }
}

// プレイヤーデモ
// 初回起動時にキャラクターを選択してcharDataに値をセットする
@Model
final class PlayerCharactorItem: PlayerCharactor {
    
    @Attribute(.unique) var gameId: String = UUID().uuidString
    
    var charData: String
    
    var playerName: String
    
    var playerHitpoint: Double
    
    var playerHunger: Double
    
    var playerHealth: String
    
//    init() {
//        self.playerName = charData.charName
//        self.playerHitpoint = charData.hitpoint
//        self.playerHunger = charData.hunger
//        self.playerHealth = charData.health
//    }
    
    init(gameId: String, charData: String, playerName: String, playerHitpoint: Double, playerHunger: Double, playerHealth: String) {
        self.gameId = gameId
        self.charData = charData
        self.playerName = playerName
        self.playerHitpoint = playerHitpoint
        self.playerHunger = playerHunger
        self.playerHealth = playerHealth
    }
    
}

class PlayerCharactorManager {
    
    func upPoint(now: Double, up: Double, max: Double)->Double{
        // 上昇時に上限を超える時
        if up + now > max {
            return max
        } else {
            return now + up
        }
    }
    
    func downPoint(now: Double, dw: Double)->Double{
        // 減少時に0を下回る場合
        if now - dw < 0 {
            return 0
        } else {
            return now - dw
        }
    }
    
}
