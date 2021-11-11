//
//  ContentView.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import SwiftUI

struct LandingView: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: Gutter.normal) {
            Spacer()
            
            Text(Strings.LandingView.score.localized)
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.bottom, Gutter.xlarge)
            
            Text(viewModel.session.currentScore.toString)
                .font(.title)
            Spacer()
            Button {
                print("show question page")
            } label: {
                Text(Strings.LandingView.play.localized)
                    .font(.title)
            }
            Spacer()
        }
    }
    
    class ViewModel: ObservableObject {
        let session: Session
        init(session: Session) {
            self.session = session
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(viewModel: .init(session: Session()))
    }
}
