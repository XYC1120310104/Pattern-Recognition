%最小错分样本数准则，批量调整版
clc;
clear all;
max_iter=40;
Y=[1,1;2,2;2,0;
    0,0;1,0;0,1];
Labels=[ones(size(Y,1)/2,1);ones(size(Y,1)/2,1)*-1];
%load Samples.mat;
%Y=TrainSamples;
%Labels=ones(size(Y,1),1)*-1;
%Labels(find(Y==3),1)=ones(size(find(Y==3),1),1);
w=rand(size(Y,2)+1,1);
sumw=zeros(size(w,1),1);
Y=[ones(size(Y,1),1),Y];
for iter=1:max_iter
    P=Labels.*(Y*w);
    for i=1:size(P,1)
        if P(i)<=0
            sumw=sumw+(Labels(i)*Y(i,:)')/iter;
        end
    end
    w=w+sumw;
    if abs(sumw)<ones(size(sumw,1),1)*1e-1
        break;
    end
end
figure('name','g(y)=-81.845641256265940+62.328428969863090*y1+57.461549272661540*y2');
hold on;
plot(Y(1:3,2),Y(1:3,3),'r+',Y(4:6,2),Y(4:6,3),'go');
line([w(1)/w(2)*-1,0],[0,w(1)/w(3)*-1]);
hold off;
% TLabels=ones(size(TestLabels,1),1)*-1;
% TLabels(find(TestLabels==3),1)=ones(size(find(TestLabels==3),1),1);
% predt=sign([ones(size(TestSamples,1),1),TestSamples]*w);
% disp(length(predt==TLabels));