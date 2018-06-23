function xSharp = OMP3(y,p,d)
S = [];
xSharp = zeros(p^4,1) ;
r2 = y;
residual = norm(r2)
b = zeros(p^4,1); %b = A^T_S * y
while residual > (1/10)^5 
    
    [~,j] = max(abs(matTvec3(r2,p,d))) ;
    S = union(S,j) ;          
    
    b = b + matTvec3(y,p,d,j);
    xSharp = CG3(xSharp,p,d,b,S) ;
    
    r1 = y - matvec3(xSharp,p,d,S);
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end  
    r2 = r1;
    residual = n1
    
end