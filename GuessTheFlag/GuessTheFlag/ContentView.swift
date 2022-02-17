//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nick Semin on 26.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var round = 1
    @State private var gameOver = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            RadialGradient(stops:[
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
        VStack{
            Spacer()
            
            Text("Guess the flag")
                .font(.largeTitle.weight(.bold))
                .foregroundColor(.white)
            
        VStack(spacing: 15){
            
        VStack{
            
            Text("Tap the flag of")
                .foregroundStyle(.secondary)
                .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
                .font(.largeTitle.weight(.semibold))
        }
            
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number]).renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
            
        Spacer()
        Spacer()
            
        Text("Score: \(score)")
                .foregroundColor(.white)
                .font(.title.bold())
        
        Text("Round \(round)")
                .foregroundStyle(Color(red: 2, green: 2, blue: 1.8))
                .font(.title3)
            Spacer()
        }
        .padding()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over!", isPresented: $gameOver) {
            Button("Restart", action: reset)
        } message: {
            Text("Your final score score is \(score)")
        }
    }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct!"
            score += 1
        }
        else {
            scoreTitle = "Wrong! It was the flag of \(countries[number])"
            score -= 1
        }
        
        round += 1
        
        if round <= 8 {
            showingScore = true
        }
        
        else{
            gameOver = true
        }
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset(){
        showingScore = false
        scoreTitle = ""
        score = 0
        round = 1
        gameOver = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
