//
//  ContentView.swift
//  GhostGameApp
//
//  Created by P Kris on 6/18/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var ghostDoor = Int.random(in: 1...3)
    @State var textboxText = "Three doors ahead... \n Behind one of them is a ghost \n Which one do you choose? \n Click on one of the doors. "
    @State var score = 0
    var body: some View {
        
    VStack {
            
           Text("Ghost Game").font(Font.custom("Chalkduster", size: 20))
            Text("Score:\(score)").font(Font.custom("Chalkduster", size: 20))
            
        Image("funny ghost").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 20.0)
        Spacer()
        Text(textboxText).font(Font.custom("Chalkduster", size: 20))
            .foregroundColor(Color.black)
            .multilineTextAlignment(.center)
        Spacer()
        HStack {
            Button(action:  {
                self.checkGhost(doorNumber: 1)
            })
            {   Image("cartoonDoor").resizable().aspectRatio(contentMode: .fit).padding(.horizontal)
        }
            Button(action: {
                self.checkGhost(doorNumber: 2)
            }) {
                Image("cartoonDoor").resizable().aspectRatio(contentMode: .fit).padding(.horizontal)
            }
            Button(action: {
                self.checkGhost(doorNumber: 3)
            }) {
                Image("cartoonDoor").resizable().aspectRatio(contentMode: .fit).padding(.horizontal)
                }
            
            }
        
        Button(action: {
            self.startOver()
        }) {
            Text("Start Over").font(Font.custom("Chalkduster", size: 20))
                .foregroundColor(Color.black)
        }

        }
        
    }
    func checkGhost(doorNumber : Int) {
        if ghostDoor == doorNumber {
            print("Oh no, there was a ghost!")
            textboxText = "Oh no, there was a ghost! ... \n Game Over! \n Your score was \(score)"
        }
        else {
            print("No ghost, we're safe.")
            print("You can pick a new door.")
            textboxText = "No ghost! \n You enter another rooom... \n There are three doors. \n Which one do you pick?"
            ghostDoor = Int.random(in: 1...3)
            score = score + 1
        }
    }
    func startOver() {
        score = 0
        textboxText = "Three doors ahead... \n Behind one of them is a ghost \n Which one do you choose? \n Click on one of the doors. "
        ghostDoor = Int.random(in: 1...3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
