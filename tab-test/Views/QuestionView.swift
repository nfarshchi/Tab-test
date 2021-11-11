//
//  QuestionView.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import SwiftUI
import Combine

struct QuestionView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("hee")
                }
            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button (action: {
                self.presentationMode.wrappedValue.dismiss() },
                                label: {
                Text(Strings.QuestionView.dismissCTA.localized)
            }))
        }
    }
    
    class ViewModel: ObservableObject {
        let session: Session
        @Published private(set) var currentQuestionIndex: Int = 0
        @Published private(set) var title: String = ""
        private var bag: [AnyCancellable] = []
        
        init(session: Session) {
            self.session = session
            self.bindScreenValues()
        }
        
        deinit {
            bag.removeAll()
        }
        
        private func bindScreenValues() {
            $currentQuestionIndex.sink { [weak self] index in
                self?.title = String(format: Strings.QuestionView.title.localized, (index + 1))
            }.store(in: &bag)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewModel: .init(session: Session()))
    }
}
