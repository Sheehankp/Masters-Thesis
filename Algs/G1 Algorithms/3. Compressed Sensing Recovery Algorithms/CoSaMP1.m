function xSharp = CoSaMP1(y,p,d,s)
xSharp = zeros(p^2,1) ;
r2 = y ;
residual = norm(r2) 
while residual > 1/10^5
    
    U = union( find(xSharp ~= 0), L_s(matTvec1(r2,p,d),2*s)) ;
    u = CG1(xSharp,p,d,matTvec1(y,p,d,U),U) ;
    xSharp = H_s(u,s) ;

    r1 = y - matvec1(xSharp,p,d) ;
    n1 = norm(r1);
    if n1 >= residual 
        break
    end 
    r2 = r1 ; 
    residual = n1 
end 
