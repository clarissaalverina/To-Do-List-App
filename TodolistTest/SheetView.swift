//
//  SheetView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 17/06/24.
//

import SwiftUI
import SwiftData
import Foundation

struct SheetView: View {
    @State private var showSheet: Bool = false
    @AppStorage("currentExp") private var currentExp = 0 
    @AppStorage("currentLevel") private var currentLevel = 1
    @AppStorage("completedTask") private var completedTask = 0
    
    var body: some View {
        ZStack {
            VStack {
                            Text("EXP \(currentExp)")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                            Text("LEVEL \(currentLevel)")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                        //xp and level here
                    
                
            }
            .padding(.bottom, 700)
            .padding(.trailing, 200)
            
            Text("ini isinya")
        }
        .onAppear(perform: {
            showSheet = true
        })
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 10, content: {
                ContentView(currentExp: $currentExp, currentLevel: $currentLevel, completedTask: $completedTask)
            })
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(300), .medium, .large])
            .presentationCornerRadius(30)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .presentationDragIndicator(.visible) // Show a drag indicator
                        .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    SheetView()
}
