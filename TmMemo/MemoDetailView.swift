//
//  MemoDetailView.swift
//  TmMemo
//
//  Created by MsMacM on 2026/10/22.
//

import SwiftUI
import SwiftData

struct MemoDetailView: View {
    @Bindable var memo: Memo

    var body: some View {
        VStack {
            TextField("タイトル", text: $memo.title)
                .font(.title)
                .bold()
                .padding(.horizontal)
                .onChange(of: memo.title) { _, _ in
                    memo.updateAt = Date()
                }
            TextEditor(text: $memo.content)
                .padding(.horizontal)
                .foregroundColor(.blue)
//                .background(Color.gray)
                .onChange(of: memo.content) { _, _ in
                    memo.updateAt = Date()
                }
        }
        .navigationTitle("メモ編集")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    let container = try! ModelContainer(for: Memo.self, configurations: .init(isStoredInMemoryOnly: true))
    let context = ModelContext(container)
    let sample = Memo(title: "プレビュー用メモタイトル", content: "ここに本文が入ります。タイトルと共にクリックして編集", updateAt: Date())
    context.insert(sample)
    // Fetch the inserted memo back from the context to ensure a managed instance
    let descriptor = FetchDescriptor<Memo>()
    let fetched = try? context.fetch(descriptor)
    let memo = fetched?.first ?? sample
    return NavigationStack {
        MemoDetailView(memo: memo)
    }
}
