function [FeatureVes,Ratio]=FeatureExtractReg_1(Region,OriImg_1,OriImg_2,OriImg_3)
Sv1=ExtractSignal(Region,OriImg_1);
Sv2=ExtractSignal(Region,OriImg_2);
Sv3=ExtractSignal(Region,OriImg_3);
FeatureVes=zeros(3,10);
for i=1:10
    a1=length(find(Sv1<i*10+40));
    a2=length(find(Sv2<i*10+40));
    a3=length(find(Sv3<i*10+40));
    FeatureVes(:,i)=[a1;a2;a3];
end
FeatureVes=FeatureVes./length(Sv1);
dataPoi=EnlargeRegionExt(OriImg_1,Region,190,6);
dataPoi_1=EnlargeRegionExt(OriImg_2,Region,190,6);
Maxv=max([size(dataPoi,2),size(dataPoi_1,2)]);
Ratio=[Maxv,size(Region,2)];

