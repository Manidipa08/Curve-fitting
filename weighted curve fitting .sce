//Date - 20/04/2022
//Aim- To perform Weighted least square fitting of given data (x,y) with known error/uncertainty values using user defined function.
clear
clc
clf
x=[60 25 6 3]
y=[300 350 400 500]
W=[1 10 100 5]
XY=x.*y
XX=x.^2
m=length(x)
s_x=sum(x)
s_y=sum(y)
s_xy=sum(XY)
s_xx=sum(XX)
s_w=sum(W)
s_wx=sum(W.*x)
s_wy=sum(W.*y)
s_wxx=sum(W.*x.*x)
s_wxy=sum(W.*x.*y)
a0=((s_wy.*s_wxx)-(s_wxy.*s_wx))/((s_w.*s_wxx)-(s_wx)^2)//a0-intercept
a1=((s_w.*s_wxy)-(s_wx.*s_wy))/((s_w.*s_wxx)-(s_wx)^2)///a1-slope
disp("Slope(calculated) = ",a1)
disp("Intercept(calculated) =",a0)
[a b]=reglin(x,y)
disp("Slope(reglin) = ",a)
disp("Intercept(reglin) =",b)
fx=a0+a1*x
plot(x,y,'o-r')
plot(x,fx,'*-Y')
title('<<<< Weighted Least Square Fitting >>>>','color','Blue','Fontsize','5')
xlabel("X-values---------->",'color','green','Fontsize','4')
ylabel("Y-values---------->",'color','green','Fontsize','4')
legend('calculated','reglin')
