function [x,iterations] = CG3(x,p,d,y,S) 
r = y - matTmatvec3(x,p,d,S);
pp = r;
r0 = y'*y;
rHat = r'*r;
maxIterations = p;
for iterations = 0:maxIterations
    if sqrt(rHat/r0) <= 1/10^10
        return
    end
    t = matTmatvec3(pp,p,d,S);
    a = rHat/(pp'*t);
    x = x+a*pp;
    r = r-a*t;
    rBar = rHat;
    rHat = r'*r;
    pp = r+(rHat/rBar)*pp;
end