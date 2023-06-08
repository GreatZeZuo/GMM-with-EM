function [FeatureV,Ratio]=FeatureExtractRegSet_1(RegSet,OriImg_1,OriImg_2,OriImg_3)
Nums=size(RegSet,2);
FeatureV=cell(1,Nums);
Ratio=zeros(2,Nums);

for i=1:Nums
    [V,R1]=FeatureExtractReg_1(RegSet{i},OriImg_1,OriImg_2,OriImg_3);
    FeatureV{i}=V;
    Ratio(:,i)=R1;
end