//
//  Result.swift
//  FURRRailway
//
//  Created by Ruotger Deecke on 19.5.17.
//  Copyright © 2017 Ruotger Deecke. All rights reserved.
//

import Foundation

// helper methods. You should not use those regularly outside of testing.
// Usually it is better to pass on a Result object.
public extension Result {
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    func successObject() -> Success? {
        switch self {
        case .success(let obj):
            return obj
        case .failure:
            return nil
        }
    }

    func failureObject() -> Failure? {
        switch self {
        case .success:
            return nil
        case .failure(let obj):
            return obj
        }
    }
}
