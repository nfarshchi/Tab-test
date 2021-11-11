//
//  ContentView.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import SwiftUI

struct LandingView: View {
    typealias Rs = Strings.LandingView
    
    @ObservedObject private var viewModel: LandingViewModel
    
    init(viewModel: LandingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: Gutter.normal) {
            Spacer()
            
            Text(Rs.score.localized)
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.bottom, Gutter.xlarge)
            
            Text(viewModel.session.currentScore.toString)
                .font(.title)
            Spacer()
            Button {
                viewModel.startQuize()
            } label: {
                Text(Rs.play.localized)
                    .font(.title)
            }
            Spacer()
        }.fullScreenCover(isPresented: $viewModel.showQuestionsView) {
            QuestionView(viewModel: .init(session: viewModel.session))
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(viewModel: .init(session: Session()))
    }
}
