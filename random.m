h1_input = 2;
h1_neuron = 6;
h2_neuron= 2;
op_output = 2;
%h1_neuron
h1_neurons_op=1:h1_neuron
weights_op = randn(op_output, h2_neuron);
weights_h2=randn(h2_neuron,h1_neuron);
weights_h1 = randn(h1_neuron, h1_input);
inputs= randn(2,1);


%% FOward prop
%h1_n1=weights_h1(1,:)*inputs
for i=1:h1_neuron
    h1_neurons_op(1,i)=layer_up(inputs,weights_h1(i,:))
end

%neuron_output=sigm(h1_n1,0);


