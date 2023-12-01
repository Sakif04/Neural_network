output_size
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

epoc = 5;
batch = 60000;
accuracy_plot = 1:epoc;
for z = 1:epoc
    for k = 1:batch
        pixels = arif(:,k);
        [h1_op,output_h2,output] = forwardprop(pixels,weights_h1,weights_op);
        output = output.';
        %backpropagation
        t = labels(k,:) - output;
        delta_op = output.*(1-output).*t;
        eta = 0.1; %learning rate
        delta_op_w = zeros(10,h1_neuron);
        for i = 1:10;
            for j = 1:h1_neuron;
                delta_op_w(i,j) = delta_op(i).* h1_op(j).* eta;
            end
        end
        
        delta_op_transpose = delta_op.';
        weights_op_transpose = weights_op.';
        m = weights_op_transpose * delta_op_transpose;
        delta_h1 = h1_op .* (1 - h1_op).* m;
        delta_h1_w = zeros(h1_neuron,h1_input);
        for i = 1:h1_neuron;
            for j = 1:h1_input;
                delta_h1_w(i,j) = delta_h1(i).* pixels(j,1).* eta;
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
        pixels = testImages(:,i);
        A = weights_h1 * pixels;
        h1_op = sigm(A);
        output_h2 = weights_op * h1_op;
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
    accuracy = (correct_prediction / 10000) * 100;
    accuracy_plot(z) = accuracy;
    z
end
plot(accuracy_plot);