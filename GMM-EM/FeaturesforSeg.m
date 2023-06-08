function Featurev=FeaturesforSeg(Segset,Image)

Featurev=zeros(8,size(Segset,2));
[Currv,Ratio]=ModelMatchIndexTotal(Segset);
Featurev(1:4,:)=Currv;
Featurev(5,:)=Ratio';








