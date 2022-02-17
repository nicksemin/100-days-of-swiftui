//
//  ContentView.swift
//  WordScramble
//
//  Created by Nick Semin on 13.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var score = 0
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        VStack{
        NavigationView{
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                        .onSubmit {
                            addNewWord()
                        }
                        .autocapitalization(.none)
                }
                
                Section{
                    ForEach(usedWords, id: \.self){ word in
                        
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar{
                ToolbarItem{
                    Button("Refresh"){
                        startGame()
                        usedWords.removeAll()
                        score = 0
                    }
                }
            }
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError){
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
                }
        }
    Text("Score: \(score)")
                .font(.title2)
        }
    }
    
    func addNewWord(){ // method for returning words in the text field
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) //lowercases words being returned and gets rid of whitespaces at the end
        guard answer.count > 0 else { return } //checks that returned word is not empty, otherwise breaks
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word does not exist", message: "Think of other words")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word is impossible", message: "You can't get this word from '\(rootWord)'")
            return
        }
        
        guard wordLength(word: answer) else {
            wordError(title: "Word is too short", message: "Be creative!")
            return
        }
        
        withAnimation{
        usedWords.insert(answer, at: 0) //adding returned word to the first position of array pf used words
            
            score += answer.count
        }//adds animation when a new word is added
        
        newWord = "" //sets word to an empty string
    }
    
    func startGame(){ //method to get data from loaded .txt file or throw fatal error if no file is loaded
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle")
    }
    
    //Below are 4 methods used to validate returned words
    
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word) && word != rootWord
    }
    
    func isPossible(word: String) -> Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){ //checks if letter is in the word
                tempWord.remove(at: pos) //does not allow to use same letter more times it appears in the word
            } else{
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordLength(word: String) -> Bool {
        if word.count > 2 {
            return true
        }
        return false
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
