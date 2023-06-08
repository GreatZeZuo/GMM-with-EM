function Celldata=RegiondataThre(Regiondata,thre)
Num=size(Regiondata,2);
kk=0;
Celldata=cell(1,Num);
for i=1:Num
    Currdata=Regiondata{i};
    if size(Currdata,2)>thre
        kk=kk+1;
        Celldata{kk}=Currdata;
    end
end

if kk>0
       Celldata=Celldata(1:kk);
else
    Celldata=[];
end
    