//
//  ContentView.swift
//  InstaFilter
//
//  Created by Michael Sweeney on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack {
                    Button("Change fitler", action: changeFilter)
                    Spacer()
                    Button("Save image", action: saveImage)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func changeFilter() {
        
    }
    
    func saveImage() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
