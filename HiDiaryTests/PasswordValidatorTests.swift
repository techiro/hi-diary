//
//  PasswordValidatorTests.swift
//  HiDiaryTests
//
//  Created by TanakaHirokazu on 2021/08/07.
//

@testable import HiDiary
import XCTest
class PasswordValidatorTests: XCTestCase {

    func test数字が含まれておらず_大文字を含んだ合計8文字入力された場合にfalseが返されること() {
        let loginVM = LoginViewModel()
        loginVM.state.inputPassword = "aaaaBBBB"
        XCTAssertEqual(loginVM.isValidPassword(), false)
    }

    func test数字が含まれており_大文字を含んだ合計7文字入力された場合にfalseが返されること() {
        let loginVM = LoginViewModel()
        loginVM.state.inputPassword = "aaa1BBB"
        XCTAssertEqual(loginVM.isValidPassword(), false)
    }

    func test数字が含まれており_大文字を含んだ合計8文字入力された場合にtrueが返されること() {
        let loginVM = LoginViewModel()
        loginVM.state.inputPassword = "aaa1BBBB"
        XCTAssertEqual(loginVM.isValidPassword(), true)
    }

    func testパスワードバリデーションの文字数() {
        let loginVM = LoginViewModel()
        loginVM.state.inputPassword = "abcde12"
        XCTContext.runActivity(named: "数字が含まれている場合") { _ in
            loginVM.state.inputPassword = "abcde12"
            XCTContext.runActivity(named: "合計7文字が入力された場合") { _ in
                XCTAssertFalse(loginVM.isValidPassword())
            }

            XCTContext.runActivity(named: "合計8文字が入力された場合") { _ in
                loginVM.state.inputPassword = "abcde123"
                XCTAssertEqual(loginVM.isValidPassword(), false)
            }
            loginVM.state.inputPassword = "Abcde123"
            XCTContext.runActivity(named: "合計8文字の中で大文字が入力された場合") { _ in
                XCTAssertEqual(loginVM.isValidPassword(), true)
            }

        }

    }

}
