function GradientImage2=FusedImageDTranspose(Imag0,Imag1)
[Nx0,Ny0]=size(Imag0);
[Nx1,Ny1]=size(Imag1);

Imag00=zeros(Nx0,Ny0+1);
Imag11=zeros(Nx1+1,Ny1);

for i=1:Nx0
    ss=Imag0(i,:);
    Imag00(i,1)=-ss(1);
    Imag00(i,2:Ny0)=ss(1:Ny0-1)-ss(2:Ny0);
    Imag00(i,Ny0+1)=ss(Ny0);
end

for i=1:Ny1
    ss=Imag1(:,i);
    Imag11(1,i)=-ss(1);
    Imag11(2:Nx1,i)=ss(1:Nx1-1)-ss(2:Nx1);
    Imag11(Nx1+1,i)=ss(Nx1);
end

GradientImage2=Imag00+Imag11;

