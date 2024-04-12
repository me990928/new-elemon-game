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

struct StatusActionPointModel {
    var now: Double = 0
    var up: Double = 0
    var down: Double = 0
    var max: Double = 0
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
            print(0)
            return 0
        } else {
            print(1)
            return now - dw
        }
    }
    
}

struct PlayerDataModel: PlayerCharactor {
    
    var charData: String = ""
    
    var playerName: String  = ""
    
    var playerHitpoint: Double = 0.0
    
    var playerHunger: Double = 0.0
    
    var playerHealth: String = ""
    
}

class PlayerCharactorService: ObservableObject {
    
    let pcMan = PlayerCharactorManager()
    
    let charRepo = CharacterRepository()
    
    @Published var playerModel = PlayerDataModel()
    
    @Published var pointsModel = StatusActionPointModel()
    
    // キャラクターステータス変更の流れ
    // プレイヤーキャラクター（以下プレイヤーとする）のステータスクラスを変更する
    // 未定トリガーでキャラクターのデータを永続化->フォアグラウンド以外の時に保存など…
    
    // 理由
    // SwiftDataへの書き込み回数を減らせる
    // データをSwiftUIに管理させることで変更時に再描写されない事象を回避する
    
    func setPlayerData(players: [PlayerCharactorItem], completion: @escaping(Bool)->Void){
        // キャラクター複数実装時にロジック変更
        if let player = players.first {
            self.playerModel = PlayerDataModel(charData: player.charData, playerName: player.playerName, playerHitpoint: player.playerHitpoint, playerHunger: player.playerHunger, playerHealth: player.playerHealth)
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func runSetPlayerpointsModel(enemyVM: EnemyViewModel,completion: @escaping(Bool)->Void){
        self.pointsModel = StatusActionPointModel(now: playerModel.playerHitpoint, max: enemyVM.statusModel.hitPoint)
        completion(true)
    }
    
    // HP
    func hitPointdamage(completion: @escaping(Bool)->Void){
        // 体力減少メソッド
        // マネージャからプレイヤーを変更する
    }
    
}
