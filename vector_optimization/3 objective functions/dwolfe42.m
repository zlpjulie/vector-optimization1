
function [alphak,nf,ng]=dwolfe42(xk,dk,alphamax,epsiki,sigmaba,rhoba,nf,ng,d,r1,r2,r3)
alpha0=0;alpha1=alphamax/2;i=1;imax=40;
while i<imax
    if r2*f2(xk+alpha1*dk,d)>r2*f2(xk,d)+alpha1*rhoba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk,r3*g3(xk,d)'*dk]) || (r2*f2(xk+alpha1*dk,d)>=r2*f2(xk+alpha0*dk,d) &&  i>1)
        nf=nf+2;
        [alphak,nf,ng]=zoom421(alpha0,alpha1,xk,dk,epsiki,sigmaba,rhoba,nf,ng,d,r1,r2,r3);
        break;
    end
    if (r2*g2(xk+alpha1*dk,d)'*dk>=sigmaba*max([r1*g1(xk,d)'*dk,r2*g2(xk,d)'*dk,r3*g3(xk,d)'*dk])&&r2*g2(xk+alpha1*dk,d)'*dk<=epsiki) 
      ng=ng+1;
        alphak=alpha1;
        break
    end
    if r2*g2(xk+alpha1*dk,d)'*dk>=0
       ng=ng+1;
        [alphak,nf,ng]=zoom422(alpha1,alpha0,xk,dk,epsiki,sigmaba,rhoba,nf,ng,d,r1,r2,r3);
        break;
    end
    alpha2=(alpha1+alphamax)/2;
    alpha1=alpha2;
    i=i+1;
end
