%% Machine Learning Online Class - Exercise 4 Neural Network Learning
%     sigmoidGradient.m
%     randInitializeWeights.m
%     nnCostFunction.m

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 120;  % 120 Input Images of Digits
hidden_layer_size = 200;   % 25 hidden units
num_labels = 10;          % 10 labels, from 0 to 9   

%% =========== Loading and Visualizing Data =============
fprintf('Loading Data ...\n')
load('TrainSamples.csv');
X=TrainSamples;
load('TrainLabels.csv');
y=TrainLabels;
load('TestLabels1.csv');
load('TestSamples1.csv');
m = size(X, 1);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ================ Initializing Pameters ================
fprintf('\nInitializing Neural Network Parameters ...\n')
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
%% =================== Training NN ===================
fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 200);

%  You should also try different values of lambda
lambda = 10;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================= Predict =================
predX = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(predX == (y+1))) * 100);

predT = predict(Theta1, Theta2, TestSamples1)-1;

fprintf('\nTesting Set Accuracy: %f\n', mean(double(predT == TestLabels1)) * 100);

save('w.mat');

csvwrite('Result.csv',predT)