function [Imag0,Imag1]=FusedImageD(RecImage) %获取x方向和y方向的差值图像
[Nx,Ny]=size(RecImage);
Imag0=zeros(Nx,Ny-1);
Imag1=zeros(Nx-1,Ny);
for i=1:Nx
    Imag0(i,:)=RecImage(i,2:Ny)-RecImage(i,1:Ny-1); % 列的后一项减前一项；d(y)-d(y-1)
end

for i=1:Ny
    Imag1(:,i)=RecImage(2:Nx,i)-RecImage(1:Nx-1,i); % 行的后一项减前一项；d(x)-d(x-1)
end





