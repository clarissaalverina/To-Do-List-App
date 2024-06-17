//
//  SheetView.swift
//  TodolistTest
//
//  Created by Clarissa Alverina on 17/06/24.
//

import SwiftUI

struct SheetView: View {
    @State private var showSheet: Bool = false
    var body: some View {
        VStack {
            Text("ini isinya")
        }
        .onAppear(perform: {
            showSheet = true
        })
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 10, content: {
                ContentView()
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
