//
//  ContentView.swift
//  Edurainment
//
//  Created by Nick Semin on 28.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    var questionsNumber = [5, 10, 20]
    
    @State private var questions = 5
    @State private var multTables = 2
    @State private var questionToAsk = 0
    @State private var answer: Int?
    
    @State private var answered = false
    @State private var emptyField = false
    
    @State private var score = 0
    @State private var outcome = ""
    
    @State private var question: [Int] = []
    @State private var showingQuestions = false
    
    var body: some View {
        ZStack{
        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 80, endRadius: 350)
                .ignoresSafeArea()
            VStack{
                HStack{
                Picker("Questions to ask: ", selection: $questions) {
                    ForEach(questionsNumber, id: \.self){
                        Text("\($0) questions")
                            .foregroundColor(.black)
                    }
                    }
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    Spacer()
                
                
                Stepper("Tables to practice: \(multTables)", value: $multTables, in: 2...12 )
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                }
                Spacer()
                
                if showingQuestions{
                VStack{
                    Text("What is \(multTables) x \(question[questionToAsk])?")
                        .font(.title).bold()
                    
                    TextField("Enter your answer", value: $answer, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    Spacer()
                    
                    Button{
                        checkAnswer()
                    } label: {
                        Text("Submit!")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .frame(width: 100, height: 35)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    
                    Spacer()
                    
                }
                .frame(width: 300, height: 250)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                }
                
                
            
                    Spacer()
                Button{
                    generateQuestion()
                } label: {
                    Text("Generate questions!")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .frame(width: 200, height: 70)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    Spacer()
            

                Spacer()
                Spacer()
                
            }
            .alert(outcome, isPresented: $answered) {
                Button("Ask nexts", action: askNext)
                    } message: {
                        Text("Your score is \(score)")
                    }
            .alert("Your answer is empty", isPresented: $emptyField) {
                Button("OK", role: .cancel){}
                    } message: {
                                Text("Type your answer")
                            }
            
        }
    }
    
    func generateQuestion(){
        
        question.removeAll()
        
        for _ in 0..<questions{
            question.append(Int.random(in: 1...12))
        }
        questionToAsk = 0
        showingQuestions = true
        score = 0
        
        
    }
    
    func checkAnswer(){
        guard let userAnswer = answer else {
            emptyField = true
            return
        }
        
        if userAnswer == question[questionToAsk] * multTables{
           outcome = "Correct!"
            score += 1
        }
        else {
            outcome = "Incorrect :("
        }
        
        answer = nil
        answered = true
        
    }
    
    func askNext(){
        if questionToAsk < questions{
            questionToAsk += 1
        }
        else {
            showingQuestions = false
            questionToAsk = 0
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
