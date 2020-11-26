//
//  File.swift
//  
//
//  Created by Ruotger Deecke on 26.11.20.
//

import Foundation
import XCTest

public func XCTAssertSuccess<Success,Failure>(_ expression: @autoclosure () throws -> Result<Success,Failure>, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssert(try expression().isSuccess, message(), file: file, line: line)
}

public func XCTAssertFailure<Success,Failure>(_ expression: @autoclosure () throws -> Result<Success,Failure>, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssert(try !expression().isSuccess, message(), file: file, line: line)
}

public func XCTAssertSuccessResultEqual<T,Failure>(_ expression1: @autoclosure () throws -> Result<T,Failure>, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) where T : Equatable {
    XCTAssertEqual(try expression1().successObject()!, try expression2(), message(), file: file, line:line)
}

public func XCTAssertFailureResultEqual<Success,T>(_ expression1: @autoclosure () throws -> Result<Success,T>, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) where T : Equatable {
    XCTAssertEqual(try expression1().failureObject()!, try expression2(), message(), file: file, line:line)
}

// [Result<…,…>]
public func XCTAssertSuccessResultEqual<T,Failure>(_ expression1: @autoclosure () throws -> [Result<T,Failure>], _ expression2: @autoclosure () throws -> [T], _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) where T : Equatable {

    guard let successes = try? expression1().compactMap( { $0.successObject() }) else { XCTFail(message(), file: file, line: line); return }
    XCTAssertEqual(successes, try expression2(), message(), file: file, line:line)
}

public func XCTAssertFailureResultEqual<Success,T>(_ expression1: @autoclosure () throws -> [Result<Success,T>], _ expression2: @autoclosure () throws -> [T], _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) where T : Equatable {

    guard let failures = try? expression1().compactMap( { $0.failureObject() }) else { XCTFail(message(), file: file, line: line); return }
    XCTAssertEqual(failures, try expression2(), message(), file: file, line:line)
}

// Result<[…],…>
public func XCTAssertSuccessResultEqual<T,Failure>(_ expression1: @autoclosure () throws -> Result<[T],Failure>, _ expression2: @autoclosure () throws -> [T], _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) where T : Equatable {

    XCTAssertEqual(try expression1().successObject(), try expression2(), message(), file: file, line:line)
}

public func XCTAssertFailureResultEqual<Success,T>(_ expression1: @autoclosure () throws -> Result<[Success],T>, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) where T : Equatable {

    XCTAssertEqual(try expression1().failureObject(), try expression2(), message(), file: file, line:line)
}

