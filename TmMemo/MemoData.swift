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
    var dripDataSet: DripSettings

    init(title: String, content: String, updateAt: Date, dripDataSet: DripSettings) {
        self.title = title
        self.content = content
        self.updateAt = updateAt
        self.dripDataSet = dripDataSet
    }
}
