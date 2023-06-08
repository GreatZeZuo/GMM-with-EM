function [ p ] = get_prob( a,x,sigma,mu )
    p1=[0 0 0];
    for i=1:3
        %p1(i) = 1/((2*pi)*(norm(sigma(:,(2*i-1):2*i))))*exp(-1/2*(x-mu(i,:))*inv(sigma(:,2*i-1:2*i)*sigma(:,2*i-1:2*i)')*(x-mu(i,:))');
        
        p1(i)=mvnpdf(x',mu(i,:)',sigma(:,2*i-1:2*i));
    end
    p = p1.*a/(p1*a');
end