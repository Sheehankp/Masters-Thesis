function xSharp = CoSaMP3(y,p,d,s)
xSharp = zeros(p^4,1) ;
r2 = y ;
residual = norm(r2) 
while residual > 1/10^3
    
    U = union( find(xSharp ~= 0), L_s(matTvec3(r2,p,d),2*s)) ;
    u = CG3(xSharp,p,d,matTvec3(y,p,d,U),U) ;
    
    xSharp = H_s(u,s) ;
    
    r1 = y - matvec3(xSharp,p,d) ;
    n1 = norm(r1);
    if n1 >= residual 
        break
    end 
    r2 = r1 ; 
    residual = n1 
end 
