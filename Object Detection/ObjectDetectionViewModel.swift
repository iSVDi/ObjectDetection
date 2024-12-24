//
//  ObjectDetectionViewModel.swift
//  Object Detection
//
//  Created by Daniil on 23.12.2024.
//

import UIKit
import Vision
import SwiftUI
import CoreML

class ObjectDetectionViewModel: ObservableObject {
    @Published var image = UIImage(named: "kitchenImage.jpg")!
    private let model = DeepLabV3(model: .init()).model
    
    //    func findObjects() {
    //        do {
    //            guard let modelURL = Bundle.main.url(forResource: "DeepLabV3", withExtension: "mlmodelc") else {
    //                print("No model url")
    //                return
    //            }
    //
    //            let visionModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL))
    //            let request = VNCoreMLRequest(model: visionModel) { (result, error) in
    //
    //                if let results = result.results as? [VNCoreMLFeatureValueObservation] {
    //                    results.forEach { _ in
    //                        print()
    //
    //                    }
    //                } else {
    //                    print(error)
    //                }
    //            }
    //
    //            let requestHandler = VNImageRequestHandler(cgImage: image.cgImage!)
    //            try requestHandler.perform([request])
    //        } catch {
    //            print(error)
    //        }
    //    }
    
    
    func findObjects() {
        do {
            
            let modelUrl = Bundle.main.url(forResource: "DeepLabV3", withExtension: "mlmodelc")!
            let model = try DeepLabV3(model: .init(contentsOf: modelUrl))
            let prediction = try model.prediction(input: .init(imageWith: image.cgImage!))
            
            let pointer = prediction.semanticPredictions.dataPointer.assumingMemoryBound(to: Int32.self)
            let array = Array(UnsafeBufferPointer(start: pointer, count: prediction.semanticPredictions.count))
            print()
        }
        catch {
            print(error)
        }
    }
    
}
