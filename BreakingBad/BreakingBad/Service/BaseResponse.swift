//
//  BaseResponse.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 26.11.2022.
//

import Foundation

struct BaseResponse: Codable {
    let errorCode: Int?
    let message: String?
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
            return message
    }
}
