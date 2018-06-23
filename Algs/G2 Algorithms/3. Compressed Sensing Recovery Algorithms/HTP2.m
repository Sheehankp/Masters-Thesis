function xSharp = HTP2(y,p,d,s)
xSharp = zeros(p^3,1) ;
r2 = y ;
residual = norm(r2) ;
mu = 1/(sqrt(p*d)+eps) ;
while residual > 1/10^3
    
    S = L_s(xSharp + mu*matTvec2(r2,p,d),s) ;
    xSharp = CG2(xSharp,p,d,matTvec2(y,p,d,S),S) ;
    xSharp2 = zeros(p^3,1) ; xSharp2(S) = xSharp(S) ; xSharp = xSharp2 ; 
    
    r1 = round(y - matvec2(xSharp,p,d),10) ;
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end 
    r2 = r1 ;
    residual = n1 ;
end 