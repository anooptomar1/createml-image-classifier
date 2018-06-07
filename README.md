# Create ML Image Classifier

### 1- Provide URLs for training and testing

You can import `CreateMLUI` to train the image classifier by using drag & drop. Here I'll use another way.

For ImageClassifier, you can use directory structure (labeling separate folders for data categories) or put all data in one folder and name each image file based on your category. 

For my example, I have a folder noamed "Training" which contains images of cats and dogs, nammed accordingly. Whatever you put in the first part of the image's name (**cat**.1.jpg) will be a label. The name after the second period (cat.**2**.jpg) is used to differentiate between each image. If you have different formats of the same image, assign them the same number.

![](https://github.com/pdelfan/createml-image-classifier/blob/master/Images/1.png)


My directories for training and testing data would be:

```swift
let trainingDir = URL(fileURLWithPath: "/Users/johndoe/Desktop/createml-image-classifier/Training")

let testingDir  = URL(fileURLWithPath: "/Users/johndoe/Desktop/createml-image-classifier/Testing")
```

### 2- Train using the data

Now that you've specifiec your training directory, create a model and train it using training data.

```swift
let model = try MLImageClassifier(trainingData: .labeledFiles(at: trainingDir))
```

This process could take a while. 

### 3- Evaluating your model

If you don't provide data for testing, Xcode will acutomatically generate a testing set from your data. It'd be better to test your model using new data. Here, I'll use another way to access our testing data using `labeledDirectories`. 

![](https://github.com/pdelfan/createml-image-classifier/blob/master/Images/2.png)

In this example, you have one folder named "Testing". In this folder, you have two other folders labeled "cat" and "dog", instead of having all the data in one folder like our training data.

```swift
let evaluation = model.evaluation(on: .labeledDirectories(at: testingDir))
```

### 4- Save your model

At the end, we save our model. If you want, create a metadata to provide more information about your model.

```swift
let metadata = MLModelMetadata(author: "John", shortDescription: "A model trained to recognize cats and dogs.", license: nil, version: "1.0", additional: nil)

try model.write(to: URL(fileURLWithPath: "Users/johndoe/Desktop/yourModel"), metadata: metadata)
```

And now you have a model!

---

Data used for this example (from Kaggle): [Dogs vs. Cats](https://www.kaggle.com/c/dogs-vs-cats)