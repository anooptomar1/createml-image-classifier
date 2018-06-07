# Create ML Image Classifier
--
### 1- Provide URLs for training and testing

You can import `CreateMLUI` to train the image classifier by using drag & drop. Here I'll use another way.

For ImageClassifier, you can use directory structure (labeling separate folders for data categories) or put all data in one folder and name each image file based on your category. 

For my example, I have a folder noamed "train" which contains images of cats and dogs, nammed accordingly. Whatever you put in the first part of the image's name (**cat**.1.jpg) will be a label. The name after the second period (cat.**2**.jpg) is used to differentiate between each image. If you have different formats of the same image, assign them the same number.

![](https://github.com/pdelfan/createml-image-classifier/blob/master/Images/1.png)


My directory for training data would be:

`let trainingDir = URL(fileURLWithPath: "/Users/johndoe/Desktop/train")`

### 2- Train using the data

Now that you've specifiec your training directory, create a model and train it using training data.

`let model = try MLImageClassifier(trainingData: .labeledFiles(at: trainingDir))`

This process could take a while. If you don't provide data for testing, Xcode will acutomatically generate a testing set from your data. 

### 3- Save your model

At the end, we save our model. If you want, create a metadata to provide more information about your model.

```
let metadata = MLModelMetadata(author: "John", shortDescription: "A model trained to recognize cats and dogs.", license: nil, version: "1.0", additional: nil)

try model.write(to: URL(fileURLWithPath: "Users/johndoe/Desktop/catDog"), metadata: metadata)
```

And now you have a model.

--

Data used for this example (from Kaggle): [Dogs vs. Cats](https://www.kaggle.com/c/dogs-vs-cats)