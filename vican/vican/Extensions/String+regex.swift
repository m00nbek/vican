//
//  String+regex.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import Foundation

extension String {
    func isValid(regex: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
