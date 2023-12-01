% Load MNIST data
[trainImages, trainLabels] = mnist_parse('train-images.idx3-ubyte', 'train-labels.idx1-ubyte');
[testImages, testLabels] = mnist_parse('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');

% Convert to double and normalize
trainImages = double(trainImages) / 255;
testImages = double(testImages) / 255;

% Reshape the data to a 2D array
trainImages = reshape(trainImages, [size(trainImages, 1) * size(trainImages, 2), size(trainImages, 3)]);
testImages = reshape(testImages, [size(testImages, 1) * size(testImages, 2), size(testImages, 3)]);

% Convert labels to categorical
trainLabels = categorical(trainLabels);
testLabels = categorical(testLabels);

% Define the network architecture
layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(5,20)
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

% Set the training options
options = trainingOptions('sgdm', ...
    'MaxEpochs',20, ...
    'InitialLearnRate',0.0001, ...
    'Verbose',false, ...
    'Plots','training-progress');

% Train the network
net = trainNetwork(trainImages,trainLabels,layers,options);

% Test the network
predictedLabels = classify(net,testImages);
accuracy = sum(predictedLabels == testLabels)/numel(testLabels);
fprintf('Accuracy of the network on the test images: %f\n', accuracy);
