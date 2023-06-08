function WriteTxtfile(nms,Matrix)
Nx=length(nms);
fp=fopen('A.txt','w');
nss=size(Matrix,2);
for i=1:Nx
    fprintf(fp,'%s\t',nms{i});
    for j=1:nss
    fprintf(fp,'%d\t' ,Matrix(i,j));
    end
    fprintf(fp,'\r\n');
end
fclose(fp);


