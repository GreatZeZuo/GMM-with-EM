function y=KernelGauss(p0,dataset,Y,w,b,sigma)
Nums=size(p0,2);
y=zeros(Nums,1);
Num1=size(dataset,2);
for ii=1:Nums
    currs=0;
    for jj=1:Num1
        ss=norm(p0(:,ii)-dataset(:,jj));
        currs=currs+Y(jj)*w(jj)*exp(-ss^2/sigma^2);
    end
    y(ii)=currs+b;
end


