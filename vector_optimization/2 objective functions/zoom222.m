
function [alphak,nf,ng]=zoom222(alpha1,alpha0,epsiki,xk,dk,sigmaba,rhoba,nf,ng,d,r1,r2)
s=0;smax=20;
while (s<smax )
    alphaj=(alpha0+alpha1)/2;
    if r2*f2(xk+alphaj*dk,d)>r2*f2(xk,d)+alphaj*rhoba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk])  ||  r2*f2(xk+alphaj*dk,d)>=r2*f2(xk+alpha1*dk,d)
        nf=nf+2;
        alpha0=alphaj;
    else
        if (r2*g2(xk+alphaj*dk,d)'*dk>=sigmaba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk])&& r2*g2(xk+alphaj*dk,d)'*dk<=epsiki)
            ng=ng+1;
            alphak=alphaj;
            break;
        end
        if  (r2*g2(xk+alphaj*dk,d)'*dk)*(alpha0-alpha1)>=0
            ng=ng+1;
            alpha0=alpha1;
        end
        alpha1=alphaj ;
    end
    s=s+1;
   if s==20
    alphak=alphaj;
    end
end
