//----------------------------------Gauss-------------------------------------//


function [res]=usolve(U,b)
    
    n=size(b,1)
    x=zeros(n,1)
    x(n)=b(n)/U(n,n)
    for i= n-1:-1:1
        x(i)=(b(i)-U(i,(i+1):n) * x((i+1):n))/U(i,i)
    end
    res=x
endfunction

function [res]= gauss(A,b)
    t=[]
    n=size(b,1)
    m=0
    A
    for k= 1:n-1
        for i=k+1:n
            m=A(i,k)/A(k,k)
            b(i)= b(i)-m * b(k)
            for j=k+1 :n
                A(i,j)=A(i,j) - m * A(k,j)
            end
        end
    end
    x=usolve(A,b)
    res=x
endfunction



//---------------------------------TEST---------------------------------------//

s=100;
n=100;
rand("seed",s)

/*
// solution exacte
xex=rand(n,1)
A=rand(n,n)
b=A*xex

te=gauss(A,b)

*/
gauss_result=[]
err_avant=[]
err_arriere=[]
born=[]
capa=[]

//--Resolution via gauss--//

for i= 5:1:50
    n=i;
    rand("seed",s)

    // solution exacte
    xex=rand(n,1)
    A=rand(n,n)
    b=A*xex
    
    gauss_result(i) = gauss(A,b)
    
    err_avant(i) = norm(gauss_result(i)-xex)/norm(xex)
    err_arriere(i) = norm(b-A*x_u)/norm(b)
    capa(i) = cond(gauss_result(i))
    born(i) = capa(i)*err_arriere(i)
end

