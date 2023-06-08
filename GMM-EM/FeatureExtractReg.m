function FeatureVes=FeatureExtractReg(Region,OriImg_1,OriImg_2)
Sv1=ExtractSignal(Region,OriImg_1);
Sv2=ExtractSignal(Region,OriImg_2);
a1=0.5*(quantile(Sv1,.6)-max(Sv2))+0.5*(mean(Sv1)-max(Sv2));
a2=max(sum(Sv2<10))/length(Sv2);
dataPoi=EnlargeRegionExt(OriImg_2,Region,160,5);
IndexM=EllipseMatchIndex(dataPoi);
a3=IndexM(2)/IndexM(3);
FeatureVes=[a1;a2;a3];








