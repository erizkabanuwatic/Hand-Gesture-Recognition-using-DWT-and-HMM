function [A,B,pi] = inisialiasi_HMM(nStates,nObs)

% Initialize HMM params
% Initialize A
A = rand(nStates);
A = bsxfun(@rdivide,A,sum(A,2));

% Initialize B
B = rand(nStates,nObs);
sumB = sum(B);
B = bsxfun(@rdivide,B,sumB);

% Initialize pi
pi = rand(nStates,1);
pi = pi./sum(pi);

end