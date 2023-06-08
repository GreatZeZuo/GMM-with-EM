function ResutlsObserve(Labeldata,OriImg,Indexx,PixelNum)

  RegionP=Labeldata{Indexx};
  [~,FeatureS]=PartsConnetRegionTotal(RegionP,OriImg,PixelNum);
  
  FeatureS(2,:)./FeatureS(3,:)
  
  FeatureS(2,:)./FeatureS(4,:)
  Signalv=ExtractSignal(RegionP,OriImg);
  length(Signalv)/max(sum(Signalv<10),1)
  figure()
  plot(Signalv)
  figure()
  imagesc(OriImg)
  viewLabeldata(Labeldata,Indexx,0);