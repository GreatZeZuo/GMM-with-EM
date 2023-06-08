 %Try_6.m
data_2=load('F:\CellDet\Model\Negative_4_23.txt');
data_1=load('F:\CellDet\Model\Positive_4_23.txt');
sigma=1;
[w,b]=SVMKernelClassfier(data_1',data_2',sigma,1);
%Imag=double(imread('F:\CellDet\abnormalcell\52.tif'));
%Imag=double(imread('F:\CellDet\Test_1\1152412 0893203_1\047.tif'));
% dirc='F:\CellDet\lowlevel_image\1152843 0893209\5_low.tif';
dirc='F:\CellDet\lowlevel_image\1152382 0893090\1_low.tif';
 Imag=double(imread(dirc));
%Imag=double(imread('sst_20.tif'));
 [Cand0,Cand1,SingleS,MultiFS1]=...
     PatchImageScore_ss(Imag,w,b,sigma,data_1,data_2);

figure(1)
imagesc(Imag(:,:,2))
viewLabeldata(Cand1,1:size(Cand1,2),0);
viewLabeldata(Cand0,1:size(Cand0,2),0);
figure(2)
OriImg_2=double(Imag(:,:,2));
OriImg_2=standardImg(OriImg_2,30);
SS=SBGCSSegImgSet(Cand0,OriImg_2,130);
imagesc(OriImg_2)
viewLabeldata(SS,1:size(SS,2),0);
%SegImgSet=SBGCSTotalSegImg(Cand0{1},Imag(:,:,2),130);
%   [USeg,U,c1,c2,LamdaPrio]=...
%       SBGCSTotalTT(min(Imag(:,:,2),115),zeros(size(Imag(:,:,2))),2,0.9,0.3);
%   Labeldata=connectionExtract(255*USeg,115,150)
%  
 
 
 
 
 
 
 
 
 
 
% aas1=double(aas1);
% OriImg_1=double(aas1(:,:,1));
% OriImg_1=standardImg(OriImg_1,30);
% OriImg_2=double(aas1(:,:,2));
% OriImg_2=standardImg(OriImg_2,30);
% OriImg_3=double(aas1(:,:,3));
% OriImg_3=standardImg(OriImg_3,50);
% % figure()
% % imagesc(OriImg_2)
% OriImg=OriImg_2;
% Labeldata=connectionExtract(OriImg,115,250);
% [Candidatedata,FeatureVec,ShapeVec]=ScanningCells(OriImg,OriImg_1,Labeldata,250);
% [Candidates1,FeatureV1,ShapeVec1]=ScanningCells_1(OriImg_1,OriImg_2,Candidatedata,FeatureVec,ShapeVec,300);
% [Candidata0,FeaturSS,Candidata1,FeaturSS1]=...
%     FeatureExtractRegSet_2(Candidates1,ShapeVec1,OriImg_1,OriImg_2,OriImg_3);
% flag=SVMModelScreen(data_1',data_2',w,b,sigma, FeaturSS');
% FeatureS=[FeaturSS(:,end-1:end),flag]';
% FeaturS1=FeaturSS1;
% 
% 
% figure(1)
% imagesc(OriImg_2)
% viewLabeldata(Candidates1,1:size(Candidates1,2),0);
% figure(2)
% imagesc(OriImg)
% viewLabeldata(Labeldata,1:size(Labeldata,2),0);
% % 
% 
% 
% 
% 
