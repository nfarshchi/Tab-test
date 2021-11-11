//
//  LandingViewModel.swift
//  tab-test
//
//  Created by Navid Saba on 12/11/21.
//

import Foundation

class LandingViewModel: ObservableObject {
    
    @Published var showQuestionsView: Bool = false
    
    let session: Session
    init(session: Session) {
        self.session = session
    }
    
    func startQuize() {
        self.session.resetScore()
        self.showQuestionsView.toggle()
    }
}
