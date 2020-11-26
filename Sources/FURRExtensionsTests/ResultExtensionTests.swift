//
//  ResultExtensionTests.swift
//  
//
//  Created by Ruotger Deecke on 26.11.20.
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

enum MockError: Error {
    case mockError
}

typealias MockResult = Result<Int, MockError>

class ResultExtensionTests: XCTestCase {

    func testSuccess() {
        // given
        let result = MockResult.success(1)

        // then
        XCTAssert(result.isSuccess)
        XCTAssertEqual(result.successObject(), 1)
        XCTAssertNil(result.failureObject())
    }

    func testFailure() {
        // given
        let result = MockResult.failure(.mockError)

        // then
        XCTAssert(!result.isSuccess)
        XCTAssertEqual(result.failureObject(), .mockError)
        XCTAssertNil(result.successObject())
    }

    
}
