function xSharp = OMP1(y,p,d)
S = [];
xSharp = zeros(p^2,1) ;
r2 = y;
residual = norm(r2)
b = zeros(p^2,1);
while residual > (1/10)^5
    
    [~,j] = max(abs(matTvec1(r2,p,d))) ;
    S = union(S,j) ;
    b = b + matTvec1(y,p,d,j);
   
    xSharp = CG1(xSharp,p,d,b,S) ;
    
    r1 = y - matvec1(xSharp,p,d,S);
    n1 = norm(r1) ;
    if n1 >= residual
        break
    end 
    r2 = r1;
    residual = n1
end