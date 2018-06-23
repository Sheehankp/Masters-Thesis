function xSharp = IHT2(y,p,d,s)
xSharp = zeros(p^3,1) ;
r2 = y;
residual = norm(y) 
mu = 1/(sqrt(p*d)+eps) ; 
while residual > 1/10^5
    
    xSharp = H_s(xSharp + mu*matTvec2(r2,p,d),s) ; 
   
    r1 = y - matvec2(xSharp,p,d);
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end 
    r2 = r1;
    residual = n1
end