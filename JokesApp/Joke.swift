    //
    //  Joke.swift
    //  JokesApp
    //
    //  Created by Ibrahim Alrifai on 10/07/2023.
    //

    import Foundation
    import SwiftUI

    struct Joke{

        var setup:String
        var punchline:String
        
    }
        var jokes = [
        Joke(setup: "Why couldn't the bicycle stand up?", punchline: "It was two tired!"),
        Joke(setup: "Why did the checking cross the road?", punchline: "to get to the other side"),
        Joke(setup: "Is the pool safe for diving", punchline: "It deep ends")
        
        
        ]
        
         private var showPunchLine = false
         private var currentJokeIndex = 0
         private var isFeedbackPresented = false
         private var displaySheet = false
         private var sheetText = ""
         private var isFeedbackPositive = true
        
         private var punchLineSize = 0.1
         private var punchLineRotation = Angle.zero
         private var punchLineOpacity = 0.0
         private var tabToContinueOffset = 100.0
        
        
        var body: some View {
            ZStack {
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        if showPunchLine{
                            currentJokeIndex += 1
                            showPunchLine = false
                            isFeedbackPresented = true
                                
                        }
                    }
                VStack {
                    
                    Text(jokes[currentJokeIndex % jokes.count].setup)
                        .padding()
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    Button{
                        print("Shows the joke")
                        withAnimation{
                            showPunchLine = true
                            
                        }
                    }label: {
                        Text("What?tell me")
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    
                    
                    
                    if showPunchLine{
                        Text(jokes[currentJokeIndex % jokes.count].punchline)
                            .padding()
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .opacity(punchLineOpacity)
                            .scaleEffect(punchLineSize)
                            .rotationEffect(punchLineRotation)
                            .onAppear {
                                withAnimation {
                                    punchLineSize = 1
                                    punchLineRotation = Angle.degrees(720)
                                    punchLineOpacity = 1
                                    tabToContinueOffset = 0
                                    
                                }
                            
                            }
                            .onDisappear {
                                punchLineSize = 0.1
                                punchLineRotation = Angle.zero
                                punchLineOpacity = 0
                                tabToContinueOffset = 100
                            }
                        Text("Tap to continue")
                            .font(.caption2)
                            .italic()
                            .padding()
                            .opacity(punchLineOpacity)
                            .offset(y: tabToContinueOffset)
                    }
                        
                    
                }
                .padding()
            }
            .alert("Did you like the joke", isPresented: isFeedbackPresented ){
                Button("Yes"){
                    print("Good")
                    displaySheet = true
                    sheetText = "yayyyy"
                    isFeedbackPositive = true
                }
                Button("No"){
                    print("Bad")
                    displaySheet = true
                    sheetText = "not yeeyyy"
                    isFeedbackPositive = false
                }
            }
            .sheet(isPresented: displaySheet){
              FeedbackResponseView(isFeedbackPositive: isFeedbackPositive)
            }
        }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
