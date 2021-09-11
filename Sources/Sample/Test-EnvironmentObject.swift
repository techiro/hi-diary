//
//  Test-EnvironmentObject.swift
//  HiDiary
//
//  Created by TanakaHirokazu on 2021/07/24.
//

import SwiftUI

// MARK: オブザーバブルオブジェクト
class TestUser: ObservableObject {
    var name: String

    init(name: String) {
        self.name = name
    }
}

// MARK: 親View
struct TestContentView: View {
    var body: some View {
        VStack {
            // このTextのサイズはEnvironmentValuesが反映される
            Text("ContentView:")
            // カスタムな環境変数を利用するSubView
            SubView()
        }
    }
}

// MARK: 子View
struct SubView: View {
    var body: some View {
        VStack {
            // EnvironmentValuesが反映される
            // sizeは指定された値
            // baseColorは明示的に指定する
            Text("SubView:")

            MagoView()
        }
    }
}

// MARK: 孫View
struct MagoView: View {
    // 設定されたEnvironmentObjectを取り出す
    @EnvironmentObject var user: TestUser

    var body: some View {
        Text("mago \(user.name)")
    }
}

struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        // EnvironmentObjectのためにContentViewから設定
        TestContentView()
            .environmentObject(TestUser(name: "user1"))
    }
}
