%LMSE_Perceptron
clc;
clear all;
Y=[1,1;2,2;2,0;
    0,0;1,0;0,1];
Y=[ones(size(Y,1),1) Y];
b=[ones(size(Y,1)/2,1);ones(size(Y,1)/2,1)*-1];
a=(Y'*Y)\(Y'*b);%inv(Y'*Y)*Y'*b;
figure('name','g(y)=-1.1351+0.9189y1+0.3243*y2')
hold on;
plot(Y(1:3,2),Y(1:3,3),'r+',Y(4:6,2),Y(4:6,3),'go');
line([a(1)/a(2)*-1,0],[0,a(1)/a(3)*-1]);
hold off;

