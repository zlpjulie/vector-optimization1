
function [alphak,nf,ng]=zoom432(alpha1,alpha0,dk,xk,epsiki,sigmaba,rhoba,nf,ng,d,r1,r2,r3)
s=0;smax=20;
while (s<smax )
    alphaj=(alpha0+alpha1)/2;
    if r3*f3(xk+alphaj*dk,d)>r3*f3(xk,d)+alphaj*rhoba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk,r3*g3(xk,d)'*dk])  ||  r3*f3(xk+alphaj*dk,d)>=r3*f3(xk+alpha1*dk,d)
        nf=nf+2;
        alpha0=alphaj;
    else
        if (r3*g3(xk+alphaj*dk,d)'*dk>=sigmaba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk,r3*g3(xk,d)'*dk])&&r3*g3(xk+alphaj*dk,d)'*dk<=epsiki)
            ng=ng+1;
            alphak=alphaj;
            break;
        end
        if  (r3*g3(xk+alphaj*dk,d)'*dk)*(alpha0-alpha1)>=0
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