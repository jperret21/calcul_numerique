//---------------------------EXERCICE 3-------------------------------------//


function [res]=matmat3b(A,B)
    m=size(A)(1)
    n=size(B)(2)
    p=size(B)(1)
    
    C=zeros(m,n)
    
    for i= 1:1:m
        for j= 1:1:n
            for k= 1:1:p
                C(i,j)=A(i,k)*B(k,j)+C(i,j)
            end
        end
    end
    res=C
    
endfunction


function [res]= mathmath2b(A,B)
    m=size(A)(1)
    n=size(B)(2)
    p=size(B)(1)
    
    C=zeros(m,n)
    
    for i= 1:1:n
        for j= 1:1:n
            C(i,j)= A(i,:)*B(:,j)+C(i,j)
        end 
    end
    res=C
    
endfunction

function [res]=mathmath1b(A,B)
    m=size(A)(1)
    n=size(B)(2)
    p=size(B)(1)
    
    C=zeros(m,n)
    
    for i=1:1:m
        C(i,:)=A(i,:)*B+C(i,:)
    end
    
    res=C
endfunction













