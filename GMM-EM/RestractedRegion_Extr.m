function [MaxReg,ExtrRegion]=RestractedRegion_Extr(PixelsLabel,SignalV,Thre,PixelNum)


Nums=size(PixelsLabel,2);
Minv_x=min(PixelsLabel(1,:));
Minv_y=min(PixelsLabel(2,:));
Maxv_x=max(PixelsLabel(1,:));
Maxv_y=max(PixelsLabel(2,:));
Img=255*ones(Maxv_x-Minv_x+2,Maxv_y-Minv_y+2);

for i=1:Nums
    Img(PixelsLabel(1,i)-Minv_x+1,PixelsLabel(2,i)-Minv_y+1)=SignalV(i);
end

Labeldata=connectionExtract(Img,Thre,PixelNum);
if isempty(Labeldata)==0
    Numxx=size(Labeldata,2);
    for i=1:Numxx
        Currdata=Labeldata{i};
        Currdata(1,:)=Currdata(1,:)+Minv_x-1;
        Currdata(2,:)=Currdata(2,:)+Minv_y-1;
        Labeldata{i}=Currdata;
    end
    ExtrRegion=Labeldata;
    Numss=size(Labeldata,2);
    Vec=zeros(1,Numss);
    for ii=1:Numss
         Vec(ii)=size(ExtrRegion{ii},2);
    end
    [~,Index]=max(Vec);
    MaxReg=ExtrRegion{Index};
    
else
    MaxReg=[];
    ExtrRegion=[];
end






