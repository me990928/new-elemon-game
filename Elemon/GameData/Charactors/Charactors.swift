//
//  Charactors.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/31.
//

import Foundation

// キャラの基礎データ
protocol GameCharactor {
    var charData: String { get set }
    var charName: String { get set }
    var hitpoint: Double { get set }
    var hunger: Double { get set }
    var health: String { get set }
}

// キャラクラス DEMO
struct TestCharctor: GameCharactor {
    
    var charData: String = "Parker-girl"
    
    var charName: String = "パーカー娘"
    
    var hitpoint: Double = 1000
    
    var hunger: Double = 500
    
    var health: String = "健康"
    
    var comments: Test001 = Test001()
    
}

class CharacterRepository: ObservableObject {
    
    @Published var selectedCharData: TestCharctor = TestCharctor()
    
    var models = [
        TestCharctor()
    ]
    
    func setGameCharactorData(charData: String){
        for model in models {
            if model.charData == charData {
                selectedCharData = model
            }
        }
    }
}
