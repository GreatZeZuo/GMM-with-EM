 %Try_5.m

% v=load('F:\CellDet\Model\Model.txt');
% b=v(1);
% w=v(2:end-1);
% sigma=v(end);

data_2=load('F:\CellDet\Model\Negative_4_23.txt');
data_1=load('F:\CellDet\Model\Positive_4_23.txt');
% sigma=0.2;
% [w,b]=SVMKernelClassfier(data_1',data_2',sigma,1);
aas1=double(imread('F:\CellDet\abnormalcell\401.tif'));
%aas1=double(imread('F:\CellDet\Test_1\1152382 0893090_1\3.tif'));
%dirc='F:\CellDet\lowlevel_image\1152843 0893209\1_low.tif';
%aas1=imread(dirc);
aas1=double(aas1);
OriImg_1=double(aas1(:,:,1));
OriImg_1=standardImg(OriImg_1,30);
OriImg_2=double(aas1(:,:,2));
OriImg_2=standardImg(OriImg_2,30);
OriImg_3=double(aas1(:,:,3));
OriImg_3=standardImg(OriImg_3,50);
figure()
imagesc(OriImg_2)
OriImg=OriImg_2;
Labeldata=connectionExtract(OriImg,115,250);
[Candidatedata,FeatureVec]=ScanningCells(OriImg,OriImg_1,Labeldata,250);
[Candidates1,FeatureV1]=ScanningCells_1(OriImg_1,OriImg_2,Candidatedata,FeatureVec,300);
FeatureV=...
    FeatureExtractRegSet_2(Candidates1,OriImg_1,OriImg_2,OriImg_3);
flag=SVMModelScreen(data_1',data_2',w,b,sigma, FeatureV');


figure(1)
imagesc(OriImg_2)
viewLabeldata(Candidates1,1:size(Candidates1,2),0);
figure(2)
imagesc(OriImg)
viewLabeldata(Labeldata,1:size(Labeldata,2),0);





