function [PartsReg,TotalNum,Ratio0]=PartsConnetRegion(RegionP,OriImg,thr,PixelNum)

Nums=size(RegionP,2);
SignalV=zeros(1,Nums);
for i=1:Nums
    SignalV(i)=double(OriImg(RegionP(1,i),RegionP(2,i)));
end
TotalNum=0;
Min_x=min(RegionP(1,:));
Max_x=max(RegionP(1,:));
Lx=Max_x-Min_x;
Min_y=min(RegionP(2,:));
Max_y=max(RegionP(2,:));
Ly=Max_y-Min_y;
ss=Lx*Ly;

Ratio0=Nums/ss;
CurrImag=255*ones(Lx+4,Ly+4);

Curr_Vx=RegionP(1,:)-Min_x+1;
Curr_Vy=RegionP(2,:)-Min_y+1;

for i=1:Nums
    CurrImag(Curr_Vx(i),Curr_Vy(i))=SignalV(i);
end
% figure()
% imagesc(CurrImag)
Labeldata=connectionExtract(CurrImag,thr,PixelNum);
Numc=size(Labeldata,2);
for ii=1:Numc
    ttk=Labeldata{ii};
    ttk(1,:)=ttk(1,:)+Min_x-1;
    ttk(2,:)=ttk(2,:)+Min_y-1;
    Labeldata{ii}=ttk;
    TotalNum=TotalNum+size(ttk,2);
end
PartsReg=Labeldata;








