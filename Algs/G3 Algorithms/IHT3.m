function xSharp = IHT3(y,p,d,s)
xSharp = zeros(p^4,1) ;
r2 = y;
residual = norm(y) 
mu = 1/(sqrt(p*d)+eps) ; 
while residual > 1/10^5
    
    xSharp = H_s(xSharp + mu*matTvec3(r2,p,d),s) ; 
   
    r1 = y - matvec3(xSharp,p,d);
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end 
    r2 = r1;
    residual = n1
end