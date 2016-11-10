%Kesler ¹¹Ôì·¨
clc;
clear all;
load Samples.mat;
max_iter=00;
R=0;
C=10;
[N,dim]=size(TrainSamples);
w=rand(C,dim);
w=[w rand(C,1)];
sumw=zeros(size(w));
Labels=TrainLabels;
Y=TrainSamples;
Y=[ones(size(Y,1),1),Y];
%ÑµÁ·
% for iter=1:max_iter
%     P=Y*w';
%     flag=0;
%     for i=1:size(P,1)
%         FalseIndex=find(P(i,:)>P(i,Labels(i)+1));
%         if ~isempty(FalseIndex)
%             flag=1;
%             w(Labels(i)+1,:)=w(Labels(i)+1,:)+Y(i,:);
%             w(FalseIndex,:)=w(FalseIndex,:)-repmat(Y(i,:),size(FalseIndex,2),1);
%         end
%     end
%     if flag==0
%         break;
%     end   
% end
load w.mat£»
TestY=[ones(size(TestSamples,1),1),TestSamples];
TestP=TestY*w';
for i=1:size(TestP)
    if find(TestP(i,:)==max(TestP(i,:)))==(TestLabels(i)+1)
        R=R+1;
    end
end
acc=R*100/size(TestP,1);