function [ sigma,D,mu,a] = get_data_gauss(  )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
rot1 = [sqrt(2)/2 -sqrt(2)/2;sqrt(2)/2 sqrt(2)/2];
rot2 = [sqrt(2)/2 sqrt(2)/2;-sqrt(2)/2 sqrt(2)/2];
mu1=[0,0];
sigma1=rot1*[0.8 0;0 0.4];
data1 = mvnrnd(mu1,sigma1*sigma1',1000);
%plot(data1(:,1),data1(:,2),'*');hold on;
mu2=[1 3];
sigma2=rot2*[0.5 0;0 0.3];
data2 = mvnrnd(mu2,sigma2*sigma2',1000);
%plot(data2(:,1),data2(:,2),'*');hold on
mu3=[5.5 4.5];
sigma3=rot1*[0.6 0;0 0.2];
data3 = mvnrnd(mu3,sigma3*sigma3',1000);
%plot(data3(:,1),data3(:,2),'*');
mu=[mu1;mu2;mu3];
%data=[data1,data2,data3];
sigma=[sigma1*sigma1',sigma2*sigma2',sigma3*sigma3'];
D = cat (1,data1,data2,data3);
a = [1/3 1/3 1/3];


