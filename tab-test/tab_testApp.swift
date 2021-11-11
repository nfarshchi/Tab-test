//
//  tab_testApp.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import SwiftUI

@main
struct tab_testApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView(viewModel: .init(session: Session()))
        }
    }
}
