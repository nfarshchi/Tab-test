//
//  View+Hidden.swift
//  tab-test
//
//  Created by Navid Saba on 12/11/21.
//

import SwiftUI

extension View {
    @inlinable
    public func hidden(_ isHidden: Bool) -> some View {
        Group {
            if isHidden {
                hidden()
            } else {
                self
            }
        }
    }
}
