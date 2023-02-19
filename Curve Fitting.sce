//Date - 20/04/2022
//Aim- To perform least square fitting of given data (x,y) with known error/uncertainty values using user defined function.
clear
clc
clf
x=[0 2 5 7]
y=[-1 5 12 20]
m=length(x)
sum_y=sum(y)
sum_x=sum(x)
sum_sq_x=sum(x.*x)
//Itr=0
//for i=1:m-1
    //new_sum=Itr+(x(i).*y(i))
    //Itr=new_sum
//end
sum_xy=sum(x.*y)
a0=((sum_sq_x*sum_y)-(sum_x*sum_xy))/((m*sum_sq_x)-((sum_x)^2))
a1=(m*sum_xy-sum_x*sum_y)/(m*sum_sq_x-(sum_x)^2)
disp("Slope(calculated) = ",a1)
disp("Intercept(calculated) =",a0)
[a b]=reglin(x,y)
disp("Slope(reglin) = ",a)
disp("Intercept(reglin) =",b)
y_new=a0+a1*x
plot(x,y_new,'-*r')
plot(x,y)
title('<------ LEAST SQUARE FITTING ----->','color','magenta','Fontsize','5')
xlabel("X-values---------->",'color','brown','Fontsize','4')
ylabel("Y-values---------->",'color','brown','Fontsize','4')
legend('calculated','reglin')
