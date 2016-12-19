function [train_x, train_y, test_x, test_y] = loadMNIST()
%LOADMNIST 
%   

load TestLabels1.csv;
load TestSamples1.csv;
load TrainLabels.csv;
load TrainSamples.csv;
train_x=TrainSamples';
train_y=zeros(10,20000);
for i=1:20000
    train_y(TrainLabels(i,1)+1,i)=1;
end
test_x=TestSamples1';
test_y=zeros(10,20000);
for i=1:20000
    test_y(TestLabels1(i,1)+1,i)=1;
end
end