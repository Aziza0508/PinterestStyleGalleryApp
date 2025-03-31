//
//  ContentView.swift
//  GalleryApp
//
//  Created by Aziza Gilash on 31.03.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ImagesViewModel()
    private let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.images) { model in
                            model.image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }

                Button(action: {
                    viewModel.getImages()
                }) {
                    Text("Load 5 More Images")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Pinterest Gallery")
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
