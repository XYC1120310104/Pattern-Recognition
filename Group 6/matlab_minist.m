clear all;clc;

[train_x, train_y, test_x, test_y] = loadMNIST();

net=feedforwardnet(200,traingdm);
net=train(net,TrainSamples,train_x,train_y);
y=sim(net,train_x);