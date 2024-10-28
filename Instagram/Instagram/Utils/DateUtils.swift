//
//  DateUtils.swift
//  Instagram
//
//  Created by Marc on 28/10/2024.
//

import Firebase
import Foundation

struct DateUtils {
    static func formatDate(timestamp: Timestamp) -> String {
        let date = timestamp.dateValue()
        return date.formatted(.dateTime.month(.wide).day().year())
    }
}
