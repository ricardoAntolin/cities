//
//  DateExtensions.swift
//  NetworkDataProvider
//
//  Created by Ricardo Antolin on 21/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

extension Date {
    init(dateString: String) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        guard let date = dateFormatter.date(from: dateString) else {
            throw NetworkError.jsonParseError("Data in not in correct format")
        }
        self = date
    }
}
