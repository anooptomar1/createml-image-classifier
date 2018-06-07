import CreateML
import Foundation

let trainingDir = URL(fileURLWithPath: "/Users/johndoe/Desktop/createml-image-classifier/Training")
let testingDir  = URL(fileURLWithPath: "/Users/johndoe/Desktop/createml-image-classifier/Testing")

let model = try MLImageClassifier(trainingData: .labeledFiles(at: trainingDir))

let evaluation = model.evaluation(on: .labeledDirectories(at: testingDir))

let metadata = MLModelMetadata(author: "John Doe", shortDescription: "A model trained to recognize cats and dogs.", license: nil, version: "1.0", additional: nil)

try model.write(to: URL(fileURLWithPath: "/Users/johndoe/Desktop/createml-image-classifier/yourModel"), metadata: metadata)

