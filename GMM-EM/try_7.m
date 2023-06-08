%try_7.m

pt = 'F:\CellDet\patch\Imag\ab_sub_11804321\';
ext = '*.jpg';
dis = dir([pt ext]);
nms = {dis.name};
data_2=load('F:\CellDet\Model\Negative_4_23.txt');
data_1=load('F:\CellDet\Model\Positive_4_23.txt');
sigma=1;
[w,b]=SVMKernelClassfier(data_1',data_2',sigma,1);

AA=cell(1,length(nms));
BB=cell(1,length(nms));
SS=cell(1,length(nms));


for k = 1:length(nms)
    nm = [pt nms{k}];
    Image = imread(nm);
    [Cand0,Cand1,SingleS,MultiFS1]=...
        PatchImageScore_ss(Image,w,b,sigma,data_1,data_2);
    TT=SBGCSSegImgSet(Cand0,Image(:,:,2),130);
    if isempty(TT)==0
        Nums=size(TT,2);
        Currv=size(TT);
        for i=1:Nums
            SS{k}=TT;
        end
    end
    SS{k}=TT;
    AA{k}=SingleS;
    BB{k}=MultiFS1;
end
Matrix=zeros(length(nms),6);
for ii=1:length(nms)
    if isempty(SS{ii})==0
        num0=length(SS{ii});
        for jj=1:num0
            Matrix(ii,jj)=size(SS{ii}{jj},2);
        end
    end
end

WriteTxtfile(nms,Matrix);

figure(1)
imagesc(Image)
viewLabeldata(Cand1,1:size(Cand1,2),0);
viewLabeldata(Cand0,1:size(Cand0,2),0);



