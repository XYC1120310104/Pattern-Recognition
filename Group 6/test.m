clear; clc;
load best_96.215.mat;
[train_x, train_y, test_x, test_y] = loadMNIST();
[test_predict,test_err]=nntest(hyperParas, modelParas, test_x, test_y);
acc= ( 1 - test_err ) * 100;
csvwrite('Result.csv',test_predict);