arif = trainImages(1:784 , 1:60000);
prediction = double(trainLabels( 1:60000,1));
labels = zeros(60000,10);
for i = 1:60000
    for j = 1:10
        if j == prediction(i,1);
            labels(i,j) = 1;
        else
            labels(i,j) = 0;
        end
    end
end
accuracy_plot = [1:5];
for z = 1:10
    for k = 1:60000
        A2 = arif(:,k);
        A = weights_h1 * A2;
        h1_op = sigm(A);
        output_h2 = weights_op * h1_op;
        output = sigm(output_h2);
        output = output.';
        %backpropagation
        t = labels(k,:) - output;
        delta_op = output.*(1-output).* t;
        eta = 0.1; %learning rate
        delta_op_w = [10:10];
        for i = 1:10;
            for j = 1:10;
                delta_op_w(i,j) = delta_op(i).* h1_op(j).* eta;
            end
        end
        m2 = delta_op.';
        m = weights_op * m2;
        delta_h1 = h1_op .* (1 - h1_op).* m;
        delta_h1_w = zeros(10,784);
        for i = 1:10;
            for j = 1:784;
                delta_h1_w(i,j) = delta_h1(i).* A2(j,1).* eta;
            end
        end
        weights_h1 = delta_h1_w + weights_h1;
        weights_op = delta_op_w + weights_op;
    end
    %accuracy test
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
        A2 = testImages(:,i);
        A = weights_h1 * A2;
        h1_op = sigm(A);
        output_h2 = weights_op * h1_op;
        output = sigm(output_h2);
        for j = 1:10
            test_output2(i,j)= output(j,1);
        end
    end
    test_output2(test_output2 < 0.8) = 0;
    test_output2(test_output2 > 0.8) = 1;
    correct_prediction = 0;
    for i = 1:10000
        if isequal(test_output2(i, :), test_labels(i, :))
            correct_prediction = correct_prediction+1;
        end
    end
    accuracy = (correct_prediction / 10000) * 100;
    accuracy_plot(z) = accuracy;
    z
end
plot(accuracy_plot);