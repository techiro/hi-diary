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
        XCTAssertFalse(loginVM.isValidPassword())
    }

    func test数字が含まれており_大文字を含んだ合計7文字入力された場合にfalseが返されること() {
        let loginVM = LoginViewModel()
        loginVM.state.inputPassword = "aaa1BBB"
        XCTAssertFalse(loginVM.isValidPassword())
    }

    func test数字が含まれており_大文字を含んだ合計8文字入力された場合にtrueが返されること() {
        let loginVM = LoginViewModel()
        loginVM.state.inputPassword = "aaa1BBBB"
        XCTAssertTrue(loginVM.isValidPassword())
    }
    
}
