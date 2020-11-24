//-----------------------------Matrice L -----------------------------------//


function [res]=lsolve(L,b)
    n=size(L,1)
    x=zeros(n,1)
    x(1)=b(1)/L(1,1)
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
A=tril(Ad)
b=A*xex

x_l=lsolve(A,b)

disp("x exacte:", xex)
disp("x  lslove:", x_l)


//-----Validation des calculs---------------//

frelres=norm(x_l-xex)/norm(xex) //erreur avant
brelres= norm(b-A*x_l)/norm(b)    // erreur arriere
  
capa=cond(A)
born=capa*brelres
    
disp("brelres",brelres)
disp("frelres",frelres)
disp("born",born)
disp("capa",capa)
