function [ netState, loss] = nnfp( hyperParas, modelParas, batch_x, batch_y )
%NNFP 
% 
batchSize = size(batch_x,2);

netState.activity = cell(hyperParas.numLayer, 1);
netState.isPos = cell(hyperParas.numLayer, 1);

netState.activity{1} = batch_x;
for i = 2:hyperParas.numLayer-1
    inputs = modelParas.weights{i-1}'*netState.activity{i-1} + repmat(modelParas.bias{i-1}, 1, batchSize);
    netState.activity{i} = 1./(1+exp(-inputs));
end

inputs2out = modelParas.weights{hyperParas.numLayer-1}'*netState.activity{hyperParas.numLayer-1} + repmat(modelParas.bias{hyperParas.numLayer-1}, 1, batchSize);
inputs2out = inputs2out - repmat(max(inputs2out), hyperParas.outDim, 1);
netState.activity{hyperParas.numLayer} = exp(inputs2out)./repmat(sum(exp(inputs2out)), hyperParas.outDim, 1);
tiny = exp(-30);
loss = -sum(sum(batch_y.*log(netState.activity{hyperParas.numLayer}+tiny)))/batchSize;


end

