function xSharp = HTP3(y,p,d,s)
xSharp = zeros(p^4,1) ;
r2 = y ;
residual = norm(r2) ;
mu = 1/(sqrt(p*d)+eps) ;
while residual > 1/10^3
    
    S = L_s(xSharp + mu*matTvec3(r2,p,d),s) ;
    xSharp = CG3(xSharp,p,d,matTvec3(y,p,d,S),S) ;
    xSharp2 = zeros(p^4,1) ; xSharp2(S) = xSharp(S) ; xSharp = xSharp2 ; 
    
    r1 = round(y - matvec3(xSharp,p,d),10) ;
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end 
    r2 = r1 ;
    residual = n1 ;
end 