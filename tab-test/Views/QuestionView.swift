//
//  QuestionView.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import SwiftUI
import Combine

struct QuestionView: View {
    typealias Rs = Strings.QuestionView
    
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel: QuestionViewModel
    
    init(viewModel: QuestionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                questionBlock
                Spacer()
                answerStatusBlock
            }
            .padding()
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(viewModel.state == .finished)
            .navigationBarItems(trailing: Button (action: {
                self.presentationMode.wrappedValue.dismiss() },
                                                  label: {
                Text(Rs.dismissCTA.localized)
            }))
        }.alert(isPresented: .constant(viewModel.showFinishedState)) {
            Alert(title: Text(Rs.EndGameMessage.title.localized),
                  message: Text(Rs.EndGameMessage.body.localized),
                  dismissButton:
                        .cancel(Text(Rs.EndGameMessage.finishCTA.localized)) {
                self.presentationMode.wrappedValue.dismiss()
            }
            )
        }
    }
    
    var questionBlock: some View {
        VStack(alignment: .leading, spacing: Gutter.xlarge) {
            Text(viewModel.questionTitle)
            
            HStack {
                Button {
                    viewModel.answerdWith(option: .optionTrue)
                } label: {
                    Text(Rs.answerCTAOptionTrue.localized)
                        .font(.title)
                }
                Spacer()
                Button {
                    viewModel.answerdWith(option: .optionFalse)
                } label: {
                    Text(Rs.answerCTAOptionFalse.localized)
                        .font(.title)
                }
            }
            .hidden(!self.viewModel.showAnsweringBlock)
            
        }.padding(Gutter.xlarge)
    }
    
    var answerStatusBlock: some View {
        VStack(alignment: .center, spacing: Gutter.xlarge) {
            Text(viewModel.answerStatusTitle)
            Button {
                self.viewModel.nextQuestion()
            } label: {
                Text(Rs.nextCTA.localized)
                    .font(.title)
            }
        }.padding()
            .hidden(!self.viewModel.showAnswerStatusBlock)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewModel: .init(session: Session()))
    }
}
