//
//  Date.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 13/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//
import UIKit

extension Date:DateProtocol
{
     func formatDateAndTimeZone(_ dte: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormat.locale = Locale(identifier: "he_IL")
        if let date = dateFormat.date(from: dte) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d.MM.yyyy|HH:mm"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            let dateStr = dateFormatter.string(from: date)
            return dateStr
        } else {
            return ""
        }
    }
}
