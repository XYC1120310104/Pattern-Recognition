function [ modelParas ] = nninit( hyperParas )
%NNINIT 
%   

modelParas.weights = cell(hyperParas.numLayer-1, 1);
modelParas.bias = cell(hyperParas.numLayer-1, 1);
for i = 1:hyperParas.numLayer-1
    modelParas.weights{i} = randInitializeWeights(hyperParas.arch(i), hyperParas.arch(i+1));
    %0.1*randn(hyperParas.arch(i), hyperParas.arch(i+1));
    modelParas.bias{i} = ones(hyperParas.arch(i+1), 1);
end

end

