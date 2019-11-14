function [prediction,classProb] = uji_hmm(obs,params,prob)

% Compute probabilities of the given observation given the classes and
% predict the correct class
nClasses = size(params,2); 

for j = 1:nClasses
    prob(j) = forward(obs,params(j));
end
[~,prediction] = max(prob);
prob = 1./prob;
classProb = prob./sum(prob);

end
