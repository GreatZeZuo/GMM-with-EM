function viewLabeldata(celldat,Index,flag)

Nums=length(Index);
if flag==1
    figure()
    hold on
else
    hold on
end
for ii=1:Nums
    Currdata=celldat{Index(ii)};
    plot(Currdata(2,:),Currdata(1,:),'r.')
end



