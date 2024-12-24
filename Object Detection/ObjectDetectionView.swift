//
//  ObjectDetectionView.swift
//  Object Detection
//
//  Created by Daniil on 23.12.2024.
//

import SwiftUI

struct ObjectDetectionView: View {
    @StateObject var viewModel = ObjectDetectionViewModel()
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 600)
            Button {
                viewModel.findObjects()
            } label: {
                Text("Detect Object")
            }

        }
        
    }
}
