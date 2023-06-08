[ sigma1,D,mu,a] = get_data_gauss(  );

sigma=sigma1;
gama=zeros(3000,3);
 int = 1;%迭代计数变量
% %
while int <8
    for j = 1:3000
        gama(j,:)=get_prob(a,D(j,:),sigma,mu);%计算概率矩阵gama：3列3000行
    end
    figure()
    plot(gama(:,1))
    
    for i = 1:3
        mu(i,:) = gama(:,i)'*D/sum(gama(:,i));%更新mu
        sigma(:,(2*i-1):2*i) = (gama(:,i).*(D-mu(i,:)))'*(D-mu(i,:))/sum(gama(:,i));%更新sigma
        a(i) = sum(gama(:,i))/3000;%更新a
    end
    int = int+1;
end

 C1=zeros(1,2);
    C2=zeros(1,2);
    C3=zeros(1,2);
    for i=1:3000
        m=max(gama(i,:));
        if m==gama(i,1)
            C1=cat(1,C1,D(i,:));
        elseif m==gama(i,2)
            C2=cat(1,C2,D(i,:));
        elseif m==gama(i,3)
            C3=cat(1,C3,D(i,:));
        end
    end
    D=cat(1,C1(2:end,:),C2(2:end,:),C3(2:end,:));
% %以下根据得到的gama矩阵划分
% C1=C1(2:(length(C1')),:);
% C2=C2(2:(length(C2')),:);
% C3=C3(2:(length(C3')),:);
plot(C1(:,1),C1(:,2),'*');hold on;
plot(C2(:,1),C2(:,2),'*');hold on
plot(C3(:,1),C3(:,2),'*');