//
//  ContentView.swift
//  weather app
//
//  Created by ryan on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var operation = ""
    @State private var result = ""
    
    var body: some View {
        VStack {
            Text("Simple Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("First number", text: $firstNumber)
                .textFieldStyle(.roundedBorder)
                .background(Color.gray)
                .padding()
                .shadow(radius: 10)
            
            TextField("Second number", text: $secondNumber)
                .textFieldStyle(.roundedBorder)
                .background(Color.gray)
                .padding()
                .shadow(radius: 10)
            
            Picker("Operation", selection: $operation) {
                Text("+").tag("+")
                Text("-").tag("-")
                Text("*").tag("*")
                Text("/").tag("/")
            }
            .pickerStyle(.segmented)
            .padding()
            
            Button("Calculate") {
                calculate()
            }
            .padding()
            
            Text("Result: \(result)")
                .font(.title)
                .padding()
        }
    }
    
    func calculate() {
        guard let firstNum = Double(firstNumber),
              let secondNum = Double(secondNumber) else {
            result = "Invalid input"
            return
        }
        
        switch operation {
        case "+":
            result = String(firstNum + secondNum)
        case "-":
            result = String(firstNum - secondNum)
        case "*":
            result = String(firstNum * secondNum)
        case "/":
            if secondNum != 0 {
                result = String(firstNum / secondNum)
            } else {
                result = "Division by zero"
            }
        default:
            result = "Invalid operation"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
