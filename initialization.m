clc 
clear
close
h1_input = 784;
h1_neuron = 16;
op_output = 10;
weights_op = randn(op_output, h1_neuron);
weights_h1 = randn(h1_neuron, h1_input);


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
