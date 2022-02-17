//
//  ContentView.swift
//  PaperScissorsRock
//
//  Created by Nick Semin on 06.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameObjects = [("🪨", "📄", "✂️"), ("✂️", "🪨", "📄"), ("📄", "✂️", "🪨")].shuffled()
    @State private var shouldWin = Bool.random()
    @State private var toBeat = Int.random(in: 0...2)
    
    @State private var showingAnswer = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    @State private var round = 1

    
    var body: some View {
        ZStack{
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            .ignoresSafeArea()
        
            VStack{
                Spacer()
                VStack{
                if shouldWin{
                    Text("This time you need to win against" )
                        .font(.title2.bold())
                    .foregroundColor(.white)
                }
                else{
                    Text("This time you need to lose against" )
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        
            }
                    Text("\(gameObjects[toBeat].0)")
                            .font(.title)
                }
               
                
                Spacer()
                
                
                VStack(spacing: 30){
                ForEach(0..<3){ number in
                    Button{
                     answer(number)
                    }label: {
                        Text(gameObjects[number].0)
                            .font(.title)
                    }
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                }
            }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Spacer()
                HStack{
                
                Spacer()
                    
                Text("Score: \(score)")
                    
                Spacer()
                    
                Text("Round \(round) of 8")
                    
                Spacer()
                }
                    .font(.title.bold())
                    .foregroundColor(.black)
            Spacer()
            
    
    
            .alert(scoreTitle, isPresented: $showingAnswer) {
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
    }
    func answer(_ number: Int){
        if shouldWin == true{
            if gameObjects[number].0 == (gameObjects[toBeat].1 ){
            score += 1
            scoreTitle = "Correct!"
            showingAnswer = true
        }
            else if gameObjects[number].0 == (gameObjects[toBeat].0 ){
                score -= 1
                scoreTitle = "You chose the same item :("
            }
            else {
                score -= 1
                scoreTitle = "Wrong :("
            }
        }
        else {
            if gameObjects[number].0 == (gameObjects[toBeat].2 ){
            score += 1
            scoreTitle = "Correct!"
        }
            else if gameObjects[number].0 == (gameObjects[toBeat].0 ){
                score -= 1
                scoreTitle = "You chose the same item :("
            }
            else {
                score -= 1
                scoreTitle = "Wrong :("
            }
        }
        
        if round < 8{
            round += 1
            showingAnswer = true
        }
        else{
            gameOver = true
        }
    }
    
    
    func askQuestion() {
        gameObjects.shuffle()
        shouldWin.toggle()
    }
    
    func reset(){
        gameObjects.shuffle()
        shouldWin.toggle()
        
        score = 0
        round = 1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
