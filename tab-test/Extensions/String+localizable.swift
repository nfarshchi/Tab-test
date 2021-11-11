//
//  String+localizable.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, tableName: "Main", comment: "")
    }
}
