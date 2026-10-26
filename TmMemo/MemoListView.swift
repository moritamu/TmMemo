//
//  MemoListView.swift
//  TmMemo
//
//  Created by MsMacM on 2026/10/21.
//

import SwiftUI
import SwiftData

struct MemoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Memo.updateAt, order: .reverse) private var memos: [Memo]

    var body: some View {
        NavigationStack{
            List {
                ForEach(memos) { memo in
                    NavigationLink(destination: MemoDetailView(memo: memo)) {
                        VStack(alignment: .leading) {
                            Text(memo.title.isEmpty ? "（無題）" : memo.title)
                                .font(.headline)
                            Text(memo.content)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                            Text(memo.updateAt, style: .date)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteMemos)
            }
            .navigationTitle("メモ帳")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addMemo) {
                        Label("追加", systemImage: "plus")
                    }
                }
            }
        }
    }
    private func addMemo() {
        let newMemo = Memo(title: "新しいメモ", content: "内容を入力", updateAt: Date())
        modelContext.insert(newMemo)
    }

    private func deleteMemos(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(memos[index])
        }
    }
}

#Preview {
    MemoListView()
        .modelContainer(for: Memo.self, inMemory: true)
}
