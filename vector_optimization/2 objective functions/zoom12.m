
function [alphak,nf,ng]=zoom12(alpha1,alpha0,xk,dk,sigmaba,rhoba,nf,ng,d,r1,r2)
s=0;smax=20;
while (s<smax)
   alphaj=(alpha0+alpha1)/2;
    if r1*f1(xk+alphaj*dk,d)>r1*f1(xk,d)+alphaj*rhoba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk])  ||  r1*f1(xk+alphaj*dk,d)>=r1*f1(xk+alpha1*dk,d)
        nf=nf+2;
        alpha0=alphaj;
    else
        if abs(r1*g1(xk+alphaj*dk,d)'*dk)<=sigmaba*abs(max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk]))
            ng=ng+1;
            alphak=alphaj;
            break;
        end
        if  (r1*g1(xk+alphaj*dk,d)'*dk)*(alpha0-alpha1)>=0
            ng=ng+1;
            alpha0=alpha1;
        end
        alpha1=alphaj;
    end
    s=s+1;
    if s==20
    alphak=alphaj;
    end
end
        