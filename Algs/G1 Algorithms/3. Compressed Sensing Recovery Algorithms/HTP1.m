function xSharp = HTP1(y,p,d,s)
xSharp = zeros(p^2,1) ;
r2 = y ;
residual = norm(r2) ;
mu = 1/(sqrt(p*d)+eps) ;
while residual > 1/10^5
    
    S = L_s(xSharp + mu*matTvec1(r2,p,d),s) ;
    xSharp = CG1(xSharp,p,d,matTvec1(y,p,d,S),S) ;
    xSharp2 = zeros(p^2,1) ; xSharp2(S) = xSharp(S) ; xSharp = xSharp2 ;
    
    r1 = round(y - matvec1(xSharp,p,d),10) ;
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end 
    r2 = r1 ;
    residual = n1 ;
end 