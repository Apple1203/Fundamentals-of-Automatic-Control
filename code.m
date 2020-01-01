M=2;
m=0.1;
g=9.8;
l=0.3;
%p 用于状态方程计算
%输入倒立摆方程并显示
A=[0 1 0 0;
0 0 -3*m*g/(7*M+4*m) 0;
0 0 0 1;
0 0 6*g*(M+m)/l/(7*M+4*m) 0]
B=[0;
7/(7*M+4*m);
0;
-6/l/(7*M+4*m)]
C=[1 0 0 0;
0 0 1 0]
D=[0;
    0]
%求开环系统的阶跃响应并显示
T=0:0.005:10;
U=0.2*ones(size(T));
[Y,X]=lsim(A,B,C,D,U,T);
plot(T,Y)
axis([0 10 -100 100])
grid
%end


%输入倒立摆传递函数G(S)=num/den
M=2; 
m=0.1;
g=9.8;
l=0.3;
%计算并显示多项式形式的传递函数
num=[-1]
den=[7/6*l*M+2/3*m*l 0 -(M+m)*g]
%计算极点
[r,p,k]=residue(num,den);
s=p
%求传递函数脉冲并显示
t=0:0.005:10;
impulse(num,den,t)
%显示范围
axis([0 1 -10 0])
grid
%---end---

M=2; 
m=0.1;
g=9.8;
l=0.3;
%计算并显示多项式形式的传递函数
num1=[0 0 -1]
den1=[7/6*l*M+2/3*m*l 0 -(M+m)*g]
kp=-300;
ki=-200;
kd=-100;
numPID=[kd kp ki]
denPID=[0 1 0]
num=conv(num1,denPID);
a=conv(denPID,den1)
b=conv(numPID,num1)
den=a+b

 
%计算极点
[r,p,k]=residue(num,den);
s=p
%求传递函数脉冲并显示
t=0:0.005:10;
impulse(num,den,t)
%显示范围
axis([0 1 -10 10])
grid
%---end---

den=[0.72 -50 -220.58 -150]
num=[1 0]
sys=tf(num,den)
margin(sys)



