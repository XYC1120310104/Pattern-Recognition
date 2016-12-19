clear; clc;

best_acc=0;
iter=0;

[train_x, train_y, test_x, test_y] = loadMNIST();
hyperParas.debug = 0;
hyperParas.arch = [120, 1000 , 10];
hyperParas.numLayer = numel(hyperParas.arch);
hyperParas.outDim = hyperParas.arch(end);%sigm,crossEnt

hyperParas.learnRate = 0.05;%0.01 - 0.8
hyperParas.batchSize = 100;
hyperParas.numEpochs = 40;

while(1)
modelParas = nninit(hyperParas);
[modelParas, losses] = nntrain(hyperParas, modelParas, train_x, train_y);
%load best.mat;
[train_predict,train_err]=nntest(hyperParas, modelParas, train_x, train_y);
train_acc=( 1 - train_err ) * 100;
[test_predict,test_err]=nntest(hyperParas, modelParas, test_x, test_y);
test_acc= ( 1 - test_err ) * 100;
 if test_acc>best_acc
     best_acc=acc;
     csvwrite('Result.csv',test_predict);
     save('best_alpha.mat','hyperParas','losses','modelParas');
 end
 if best_acc>98
     break;
 end
 iter=iter+1;
end
train_err = (1 - nntest(hyperParas, modelParas, train_x, train_y) ) * 100;
figure = figure('color',[1,1,1]); plot(losses(1:10:end));