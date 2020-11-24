//-----------------------------Matrice Us -----------------------------------//


function [res]=usolve(U,b)
    
    n=size(b,1)
    x=zeros(n,1)
    x(n)=b(n)/U(n,n)
    for i= n-1:-1:1
        x(i)=(b(i)-U(i,(i+1):n) * x((i+1):n))/U(i,i)
    end
    res=x
endfunction

function [res]=lsolve(L,b)
    n=size(L,1)
    x=zeros(n,1)
    x(1)=b(1)/L(n,n)
    for i= 2:1:n
        x(i)=( b(i)-L(i,1:(i-1))*x(1:(i-1)))/L(i,i)
    end
    res=x
endfunction


//---------------------------------TEST---------------------------------------//

s=100;
n=10;
rand("seed",s)

xex=rand(n,1)
Ad=rand(n,n)

A=triu(Ad)
b=A*xex

x_u=usolve(A,b)

disp("x exacte:", xex)
disp("x  uslove:", x_u)


//-----Validation des calculs---------------//

frelres=norm(x_u-xex)/norm(xex) //erreur avant
brelres= norm(b-A*x_u)/norm(b)    // erreur arriere
  
capa=cond(A)
born=capa*brelres
    
disp("brelres",brelres)
disp("frelres",frelres)
disp("born",born)
disp("capa",capa)
