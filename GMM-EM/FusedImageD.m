function [Imag0,Imag1]=FusedImageD(RecImage) %��ȡx�����y����Ĳ�ֵͼ��
[Nx,Ny]=size(RecImage);
Imag0=zeros(Nx,Ny-1);
Imag1=zeros(Nx-1,Ny);
for i=1:Nx
    Imag0(i,:)=RecImage(i,2:Ny)-RecImage(i,1:Ny-1); % �еĺ�һ���ǰһ�d(y)-d(y-1)
end

for i=1:Ny
    Imag1(:,i)=RecImage(2:Nx,i)-RecImage(1:Nx-1,i); % �еĺ�һ���ǰһ�d(x)-d(x-1)
end





