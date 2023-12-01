function neuron_values = layer_up(prev_neuron,weight)
    neuron_values = sigm(weight*prev_neuron,0);
end