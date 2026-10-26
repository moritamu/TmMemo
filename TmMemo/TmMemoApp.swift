//
//  TmMemoApp.swift
//  TmMemo
//
//  Created by MsMacM on 2026/10/21.
//

import SwiftUI
import SwiftData

@main
struct TmMemoApp: App {
    var body: some Scene {
        WindowGroup {
            MemoListView()
        }
        .modelContainer(for: Memo.self)
    }
}
