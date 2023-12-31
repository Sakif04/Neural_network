function [weights_h1,weights_op] = backprop(old_hiddenweights,oldweights,inputs,label,h1_op,h1_neuron,h1_input,output,learn_rate) 
        cost_op = label - output;
        delta_op = output.*(1-output).*cost_op;
        op_output=10;
        %weight prediction from the outputs 
        delta_op_w = zeros(op_output,h1_neuron);
        for i = 1:10;
            for j = 1:h1_neuron;
                delta_op_w(i,j) = delta_op(i).* h1_op(j).* learn_rate;
            end
        end
        
        delta_op_transpose = delta_op.';
        weights_op_transpose = oldweights.';
        cost_h1 = weights_op_transpose * delta_op_transpose;
        delta_h1 = h1_op .* (1 - h1_op).* cost_h1;
        delta_h1_w = zeros(h1_neuron,h1_input);
        
        %% hidden layer prediction from the previous weight
        for i = 1:h1_neuron;
            for j = 1:h1_input;
                delta_h1_w(i,j) = delta_h1(i).* inputs(j,1).* learn_rate;
            end
        end
        weights_h1 = delta_h1_w + old_hiddenweights;
        weights_op = delta_op_w + oldweights;
end
