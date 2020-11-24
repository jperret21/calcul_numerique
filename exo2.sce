//---------------------------EXERCICE 2-------------------------------------//


format("e",16)

function [res]=ex1(n)
    result=[0 0 0 0]
    
    a=rand(n,n)         //creation matrice A
    x_ex=rand(n,1)      //creation du veceteur x exact
    
    b=a*x_ex            //deduction de b
    x=a\b               //calcul de x avec blackbox scilab
  
    frelres=norm(x-x_ex)/norm(x_ex) //erreur avant
    brelres= norm(b-a*x)/norm(b)
  
    capa=cond(a)
    born=capa*brelres
    
    result(1)=frelres
    result(2)=brelres
    
    disp("brelres",brelres)
    disp("frelres",frelres)
    disp("born",born)
    disp("capa",capa)
    
    res=result
    
endfunction


printf("TEST avec 100")
test_1=ex1(100)
printf("TEST avec 1000")
test_2=ex1(1000)


