//
//  Array+FURRExtensions.swift
//  DBDB
//
//  Created by Ruotger Deecke on 14.01.15.
//  Copyright (c) 2015-2016 Deecke,Roddi. All rights reserved.
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

import Foundation

public extension Array {

    public func reversed() -> [Element] {
        var result: [Element] = Array()
        var mutSelf: [Element] = self
        while mutSelf.count != 0 {
            if let last = mutSelf.last {
                result.append(last)
                mutSelf.removeLast()
            }
        }
        return result
    }

    public func optionalElement(index: Int?) -> Element? {
        guard let index = index else { return nil }

        if index < 0 {
            return nil
        }

        if index >= self.count {
            return nil
        }

        return self[index]
    }

    subscript(safe index: Int?) -> Element? {
        return optionalElement(index: index)
    }

    public func divideUntil(_ divisionBlock: (_: Element) -> Bool) -> ([Element], [Element]) {
        var beforeArray: [Element] = Array()
        var afterArray: [Element] = Array()

        var hasFound = false
        for element in self {
            if hasFound {
                afterArray.append(element)
                continue
            }

            hasFound = divisionBlock(_: element)

            if !hasFound {
                beforeArray.append(element)
            }
        }

        return (beforeArray, afterArray)
    }
}

public extension Array where Element: Equatable {

    /// WARNING: this method takes time in the order of O(n^2) for the worst case (no dupes)
    /// - returns: true if at least two objects are equal (==)
    public func containsDuplicates() -> Bool {
        if self.count < 2 {
            return false
        }

        // unfortunately you can't put a "for let" into a "for let"
        // so this var ... while ... defer stuff is my substitution of the c-style for()

        var idx = 0
        while idx < self.count-1 {
            defer {
                idx += 1
            }

            var jdx = idx+1
            while jdx < self.count {
                defer {
                    jdx += 1
                }
                if self[idx] == self[jdx] {
                    return true
                }
            }
        }
        return false
    }

}

public extension Array where Element: Hashable {
    /// This method is potentially faster than containsDuplicates() especially with bigger data sets but
    /// will also need more memory. Also elements need to conform to Hashable.
    /// - returns: true if at least two objects are equal (==)
    public func containsDuplicatesFast() -> Bool {
        if self.count < 2 {
            return false
        }

        let set: Set<Element> = Set(self)
        return self.count != set.count
    }
}
