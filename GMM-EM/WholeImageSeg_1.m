%WholeImageSeg_1.m

XX3=zeros(301,301,301);

 for i=1:301
    XX3(:,:,i)=(double(imread('47_data.tif',i)));%
 end

XXBinary=zeros(301,301,301);
SSxx=zeros(2,301);

for ii=1:301
    ii
    MMkk=XX3(:,:,ii);
    [USeg,U,c1,c2,LamdaPrio]=SBGCSTotalTT(MMkk,zeros(size(MMkk)),1,0.6,0.3);
    XXBinary(:,:,ii)=USeg;
    SSxx(1,ii)=c1;
    SSxx(2,ii)=c2;
end

% Tempp=ones(3,3,3)./27;
% ConvImag=convn(XX3,Tempp);
% ConvImag=convn(ConvImag,Tempp);
% ConvImag=ConvImag(3:122,3:122,3:122);
% 
% SS=zeros(4,10000);
% kk=0;
% for i=1:120
%     for j=1:120
%         for ij=1:120
%             if XXBinary(i,j,ij)==1
%                 Position=[i;j;ij];
%              [minidist0,ConnecIndex]=...
%                  peakdensitySub1(ConvImag, XXBinary,ConvImag,3,Position,1);
%              if minidist0>0.5
%                  kk=kk+1;
%                  SS(:,kk)=[i;j;ij;minidist0];
%              end
%             end
%         end
%     end
% end
% 
% if kk>0
%     SS=SS(:,1:kk);
% end
% AAs =writecell(SS(1:3,:));
% 
% 
% for ii=1:size(AAs,1)
%      ii
%     Position=AAs(ii,[4,3,5])';
%     [Segdataset,SegSubblock,Subblock]=ExtractionBlock(Position,XX3,7);
% end
% 
% 
% 
% 
% 
% % CurrBlock=[];
% % kk=0;
% % aas=zeros(3,100*100*50);
% % for i=1:120
% %     for j=1:120
% %         for ij=1:120
% %             if XXBinary(i,j,ij)==1
% %                 kk=kk+1;
% %                 aas(:,kk)=[i;j;ij];
% %             end
% %         end
% %     end
% % end
% % aas=aas(:,1:kk);
% % AAs =writecell(aas);

