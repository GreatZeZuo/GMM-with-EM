function [PartsRegTree,FeatureS]=PartsConnetRegionTotal(RegionP,Img,PixelNum)

Threv=[115,105,95,90,80,70,60,50,40,30,20,10];
PartsRegTree=cell(1,length(Threv)+1);
PartsRegTree{1}{1}=RegionP;
for i=2:length(Threv)
     PartsReg=PartsConnetRegion(RegionP,Img,Threv(i-1),PixelNum);
     if isempty(PartsReg)==1
         break
     else
         for kk=1:size(PartsReg,2)
             PartsRegTree{i}{kk}=PartsReg{kk};
         end
     end
end

FeatureS=zeros(5,100);
FeatureS(1,1)=1;
Currv=ModelMatchIndexTotal(PartsRegTree{1});
FeatureS(2:5,1)=Currv;
kk=1;
for ii=2:length(Threv)
    if isempty(PartsRegTree{ii})==0
       Currv=ModelMatchIndexTotal(PartsRegTree{ii});
       nxx=size(Currv,2);
       FeatureS(1,kk+1:kk+nxx)=ii;
       FeatureS(2:5,kk+1:kk+nxx)=Currv;
       kk=kk+nxx;
    end
end

FeatureS=FeatureS(:,1:kk);



