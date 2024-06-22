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
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
    
    var body: some View {
        ZStack {
            BackgroundImageView(imageName: "sea")
            
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
            
            VStack {
                Button(action: {
                    showSheet = true
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                        Image(systemName: "list.bullet.clipboard.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                }
                .padding()
                .padding(.top, 650)
            }
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 10, content: {
                ContentView(user: user)
            })
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(250), .medium, .large])
            .presentationCornerRadius(30)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled(true)
            
        }
    }
}

struct BackgroundImageView: View {
    let imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SheetView()
}
