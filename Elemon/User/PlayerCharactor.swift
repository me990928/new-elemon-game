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
    var charData: GameCharactor { get set }
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
    
    var charData: any GameCharactor = TestCharctor()
    
    var playerName: String
    
    var playerHitpoint: Double
    
    var playerHunger: Double
    
    var playerHealth: String
    
    init() {
        self.playerName = charData.charName
        self.playerHitpoint = charData.hitpoint
        self.playerHunger = charData.hunger
        self.playerHealth = charData.health
    }
    
}
