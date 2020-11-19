s=10
rand("seed",s)
n=5

A=rand(n,n)
B=rand(n,n)

tic();
result_3b=matmat3b(A,B)
t1=toc();
disp(t1)
disp(result_3b)


tic();
result_2b=mathmath2b(A,B)
t2=toc();

disp( t2)
disp(result_2b)

tic();
result_1b=mathmath1b(A,B)
t3=toc();

disp(t3)
disp(result_1b)

// Mesure du temps en focntion de la taille 


//math3B
tab_res_1=[]

for i= 10:10:400
    tmp=0
    for j=1:1:10
        A=rand(i,i)
        B=rand(i,i)
        tic();
        matmat3b(A,B);
        t=toc();
        tmp=tmp+t
    end
    tab_res_1(i)=tmp/10
end

//math3B
tab_res_2=[]

for i= 10:10:400
    tmp=0
    for j=1:1:10
        A=rand(i,i)
        B=rand(i,i)
        tic();
        mathmath2b(A,B);
        t=toc();
        tmp=tmp+t
    end
    tab_res_2(i)=tmp/10
end

//math3B
tab_res_3=[]

for i= 10:10:400
    tmp=0
    for j=1:1:10
        A=rand(i,i)
        B=rand(i,i)
        tic();
        mathmath1b(A,B);
        t=toc();
        tmp=tmp+t
    end
    tab_res_3(i)=tmp/10
end


plot(size_tab,tab_res_3,size_tab,tab_res_2,size_tab,tab_res_1)
