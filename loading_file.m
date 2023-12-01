imageFile='train-images.idx3-ubyte';
labelFile='train-labels.idx1-ubyte';
[images,labels] = readMNIST(imageFile,labelFile);
%disp(size(imageFile));
