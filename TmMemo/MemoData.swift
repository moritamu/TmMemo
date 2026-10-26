//
//  MemoData.swift
//  TmMemo
//
//  Created by MsMacM on 2026/10/21.
//

import Foundation
import SwiftData

@Model
class Memo {
    var title: String
    var content: String
    var updateAt: Date

    init(title: String, content: String, updateAt: Date) {
        self.title = title
        self.content = content
        self.updateAt = updateAt
    }
}
