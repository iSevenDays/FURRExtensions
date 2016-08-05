// swiftlint:disable line_length
//
//  ExtensionTests.swift
//  DBDB
//
//  Created by Ruotger Deecke on 21.08.15.
//  Copyright © 2015 Deecke,Roddi. All rights reserved.
//
// TL/DR; BSD 2-clause license
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
// following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following
//    disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
//    following disclaimer in the documentation and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import XCTest
@testable import FURRExtensions

class ExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testArrayReverse() {
        let array = ["a", "b", "c", "d"]
        let reversed = array.reversed()
        XCTAssert(reversed == ["d", "c", "b", "a"])
    }

    func testOptionalElement() {
        let array = ["a", "b", "c", "d"]
    #if swift(>=3.0)
        XCTAssert(array.optionalElement(index: 0) != nil)
        XCTAssert(array.optionalElement(index: -1) == nil)
        XCTAssert(array.optionalElement(index: 3) != nil)
        XCTAssert(array.optionalElement(index: 4) == nil)
    #else
        XCTAssert(array.optionalElement(index: 0) != nil)
        XCTAssert(array.optionalElement(index: -1) == nil)
        XCTAssert(array.optionalElement(index: 3) != nil)
        XCTAssert(array.optionalElement(index: 4) == nil)
    #endif
    }

    func testDivideUntilMiddle() {
        let array = ["a", "b", "c", "d", "e"]
        let (before, after) = array.divideUntil { (inElement) -> Bool in
            inElement == "c"
        }

        XCTAssert(before == ["a", "b"])
        XCTAssert(after == ["d", "e"])
    }

    func testDivideUntilFirst() {
        let array = ["a", "b", "c", "d", "e"]
        let (before, after) = array.divideUntil { (inElement) -> Bool in
            inElement == "a"
        }

        XCTAssert(before == [])
        XCTAssert(after == ["b", "c", "d", "e"])
    }

    func testDivideUntilLast() {
        let array = ["a", "b", "c", "d", "e"]
        let (before, after) = array.divideUntil { (inElement) -> Bool in
            inElement == "e"
        }

        XCTAssert(before == ["a", "b", "c", "d"])
        XCTAssert(after == [])
    }

    func testDivideUntilWithout() {
        let array = ["a", "b", "c", "d", "e"]
        let (before, after) = array.divideUntil { (inElement) -> Bool in
            inElement == "f"
        }

        XCTAssert(before == ["a", "b", "c", "d", "e"])
        XCTAssert(after == [])
    }

    func testContainsDupes() {
        XCTAssert(["a", "a"].containsDuplicates() == true)
        XCTAssert(["a", "b", "c"].containsDuplicates() == false)
        XCTAssert(["a", "b", "c", "c"].containsDuplicates() == true)
    }

    func testContainsDupesFast() {
        XCTAssert(["a", "a"].containsDuplicatesFast() == true)
        XCTAssert(["a", "b", "c"].containsDuplicatesFast() == false)
        XCTAssert(["a", "b", "c", "c"].containsDuplicatesFast() == true)
    }

    func testEmptyArrayEdgeCasesHaveNoDupes() {
        let empty: Array<String> = []
        XCTAssert(empty.containsDuplicates() == false)
        XCTAssert(empty.containsDuplicatesFast() == false)

        XCTAssert(["a"].containsDuplicates() == false)
        XCTAssert(["a"].containsDuplicatesFast() == false)

    }

}
