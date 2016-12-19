function [ grads ] = nnbp( hyperParas, modelParas, netState, batch_x, batch_y )
%NNBP 
%   
batchSize = size(batch_x,2);

deltas = cell(hyperParas.numLayer-1, 1);
deltas{hyperParas.numLayer-1} = netState.activity{hyperParas.numLayer}-batch_y;

for i = hyperParas.numLayer-2:-1:1
    deltas{i} = modelParas.weights{i+1}*deltas{i+1};
    deltas{i} = deltas{i}.*netState.activity{i+1}.*(1-netState.activity{i+1});
end

grads.weightsGrad = cell(hyperParas.numLayer-1);
grads.biasGrad = cell(hyperParas.numLayer-1);
for i = hyperParas.numLayer-1:-1:1
    grads.weightsGrad{i} = netState.activity{i}*deltas{i}'/batchSize;
    grads.biasGrad{i} = sum(deltas{i}, 2)/batchSize;
    if hyperParas.debug
        gradAvg = mean(abs(grads.weightsGrad{i}(:))); 
        gradVar = var(grads.weightsGrad{i}(:));
        fprintf('Layer %d, gradAvg = %f, gradVar = %f\n', i, gradAvg, gradVar);
    end
end

end

