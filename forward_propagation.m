test_output2 = zeros(10000:10);
test_prediction = double(testLabels( 1:10000,1));
test_labels = zeros(10000,10);
for i = 1:10000
    for j = 1:10
        if j == test_prediction(i,1);
            test_labels(i,j) = 1;
        else
            test_labels(i,j) = 0;
        end
    end
end

for i = 1:10000
    A2 = fp16_images(:,i);
    A = b * A2;
    h1_op = sigm(A);
    output_h2 = f * h1_op;
    output = sigm(output_h2);
    for j = 1:10
        test_output2(i,j)= output(j,1);
    end
end
test_output2(test_output2 < 0.5) = 0;
test_output2(test_output2 > 0.5) = 1;
correct_prediction = 0;
for i = 1:10000
    if isequal(test_output2(i, :), test_labels(i, :))
        correct_prediction = correct_prediction+1;
    end
end
accuracy = (correct_prediction / 10000) * 100
