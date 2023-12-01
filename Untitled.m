weights_op = rand(10, 10);
weights_h1 = rand(10, 784);
first = weights_h1(1, :);
arif = trainImages(:, 2);
A = weights_h1 * arif;
h1_op = sigm(A);
output_h2 = weights_op * h1_op;
output = sigm(output_h2);
prediction = double(trainLabels(2, :));
expected = [1:10];
for i = 1:10
    if i == prediction
        expected(i) = 1;
    else
        expected(i) = 0;
    end
   
end
cost = 0;
for i = 1:10
    m = output(i) - expected(i);
    cost = cost + m^2;
end
cost = 0.1 * cost
output  
