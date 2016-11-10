clc;
clear all;
load Samples.mat;
max_iter=10;
R=0;
C=10;
[N,dim]=size(TrainSamples);
w=rand(C,dim);
w=[w rand(C,1)];
Labels=ones(C,N)*-1;
sumw=0;
for i=1:N
    Labels(TrainLabels(i)+1,i)=1;
end
Y=TrainSamples;
Y=[ones(size(Y,1),1),Y];
for iter=1:max_iter
    sumw=0;
    for i=1:N
        sumw=sumw+(Labels(:,i)-sign(w*Y(i,:)'))*Y(i,:);
    end
    w=w+sumw./iter;
end
TestY=[ones(size(TestSamples,1),1),TestSamples];
TestP=sign(w*TestY');
for i=1:size(TestLabels,1)
    if (find(TestP(:,i)==1,1)-1)==TestLabels(i)
        R=R+1;
    end
end
acc=R*100/size(TestLabels,1);
