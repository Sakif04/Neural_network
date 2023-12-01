function [weights_h1,weights_op] = back_prop(ouput,label,oldweights) 
%%changes in output
cost_op = label - output;
delta_op = output.*(1-output).*cost_op;

end