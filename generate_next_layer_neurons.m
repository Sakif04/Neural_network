function neuron_values = generate_next_layer_neurons(prev_neuron,weight)
    neuron_values = sigm(weight*prev_neuron,0);
end