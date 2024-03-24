//
//  QuizView.swift
//  GeoWhat
//
//  Created by Daniel Leuck on 2022/10/24.
//

import SwiftUI


struct QuizView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var flag: Flag = flags.randomElement()!
    @State var options = [Flag]()
    @State var message = "Click \"Next\" to start"
    @State var answered = false
    @State var correct = false
    
    var correctMessageColor = rgb(210, 187, 34)
    
    var normalButtonStyle = NormalButtonStyle(isCorrect: false)
    var correctButtonStyle = NormalButtonStyle(isCorrect: true)
    var actionButtonStyle = ActionButtonStyle()

    @State var index = 1
    @State var flagCount = 10
    @State var correctAnswers = 0
    
    var body: some View {
        VStack {
            Spacer()
            vspace(15)
            Text(message)
                .foregroundColor(getMessageColor())
                .fontWeight(.bold)
                .font(.system(size: 26))
                .padding(.vertical, -12)
            
            Text(flag.emoji).font(.system(size: 200))
                .padding(EdgeInsets(top: -15, leading: 0, bottom: -45, trailing: 0))
                .padding(.vertical, -25)
            
            
            if !message.starts(with: "Click") {
                Text("\(index) of \(flagCount), Correct: \(correctAnswers)")
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 25, trailing: 0))
            }
                
            VStack() {
                if index == 10 {
                    VStack {
                        // Text("Quiz Complete 👍")
                        Button("New Quiz") {
                            newQuiz()
                        }
                    }.onAppear() {
                        message = "Quiz Complete"
                    }
                } else {
                    ForEach(options, id: \.id) { value in
                        Button(value.name) {
                            answered = true
                            if value == flag {
                                message = "🎉 CORRECT 🎉"
                                correct = true
                                correctAnswers += 1
                            } else {
                                message = "Incorrect - Answer: \(flag.name)"
                                correct = false
                            }
                            
                            if index < 10 {
                                index += 1
                            }
                        }
                        .buttonStyle(value == flag && answered
                                     ? correctButtonStyle
                                     : normalButtonStyle)
                        .disabled(answered)
                    }
                }
            }
            vspace(50)
            Button("Next >") {
                nextFlag()
            }
            .buttonStyle(actionButtonStyle)
            
            Spacer()
        }
    }
    
    /*
    func getStateInfo() -> String {
        "return \(index) of 10, correct: \(correctAnswers)"
    }
    */
    
    func newQuiz() {
        flag = flags.randomElement()!
        options = [Flag]()
        message = "Click \"Next\" to start"
        answered = false
        correct = false
        
        index = 1
        flagCount = 10
        correctAnswers = 0
    }
    
    func getButtonStyle(_ correct: Bool) -> any ButtonStyle {
        return correct ? correctButtonStyle : normalButtonStyle
    }

    func getMessageColor() -> Color {
        if correct {
            return correctMessageColor
        } else {
            return colorScheme == .dark ? Color.white : Color.black
        }
    }
    
    func nextFlag() {
        answered = false
        flag = flags.randomElement()!
        options = getRandomContries(flag)
        message = "Pick the Country"
    }
}

func getRandomContries(_ answer: Flag) -> [Flag] {
    var options = [Flag]()
    
    for _ in 0...4 {
        options.append(flags.randomElement()!)
    }
    options.append(answer)
    options.shuffle()
    
    // print(options)
    
    return options
}

struct QuizView_Previews: PreviewProvider {

    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            QuizView().preferredColorScheme($0)
        }
    }
}

