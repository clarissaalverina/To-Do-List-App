//
//  SheetView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 17/06/24.
//

import SwiftUI

struct SheetView: View {
    @State private var showSheet: Bool = false
    @StateObject private var user = User()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("XP")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                    ZStack {
                        Rectangle()
                            .frame(width: 120, height: 30)
                            .cornerRadius(25)
                            .foregroundColor(.black)
                        
                        Text("\(user.xp) / 100")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14))
                    }
                }
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
                ContentView(user: user)
            })
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(190), .medium, .large])
            .presentationCornerRadius(30)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    SheetView()
}
