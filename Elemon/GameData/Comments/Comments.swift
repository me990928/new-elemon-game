//
//  Comments.swift
//  Elemon
//
//  Created by 広瀬友哉 on 2024/03/31.
//

import Foundation
import SwiftUI

struct Comment {
    var index: Int
    var text: String
}

struct Comments: Identifiable {
    var id: String = UUID().uuidString
    var row: Int = 0
    var texts: [Comment] = [
        Comment(index: 0, text: "メッセージ")
    ]
}

protocol ComentsMaster {
    // 必ず挨拶コメを入れる
    var hello: Comments { get }
}

// キャラクターID＋コメントマスターID これをキャラクラスに渡す
struct Test001: ComentsMaster {
    var hello: Comments = Comments(row: 2, texts: [
        Comment(index: 0, text: "こんにちは！"),
        Comment(index: 0, text: "僕の名前はパーカーちゃん！"),
        Comment(index: 1, text: "よろしくね！")
    ])
}



#Preview {
    ContentView()
        .modelContainer(for: [Item.self, PlayerCharactorItem.self], inMemory: true)
}
