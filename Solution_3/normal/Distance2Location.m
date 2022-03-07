
function [a,b,c] = Distance2Location(x_range,y_range,z_range,M_pos,dis_a,dis_b,dis_c,dis_d)
%----------------------------------
% 梯度下降计算位置
% x_range 为x方向上的范围
% y_range 为y方向上的范围
% M_pos 为锚点信息
% dis 为读入的距A0,A1,A2,A3的距离数据
% 返回坐标估计值
%----------------------------------

syms x y z;     %定义变量

alpha = 20;    %学习率

% 定义四个锚点坐标
x0 = M_pos(1,1);
x1 = M_pos(2,1);
x2 = M_pos(3,1);
x3 = M_pos(4,1);
y0 = M_pos(1,2);
y1 = M_pos(2,2);
y2 = M_pos(3,2);
y3 = M_pos(4,2);
z0 = M_pos(1,3);
z1 = M_pos(2,3);
z2 = M_pos(3,3);
z3 = M_pos(4,3);

a = x_range/2;
b = y_range/2;
c = (z0+z1+z2+z3)/4;        %a,b,c初始值

f(x,y,z) = abs(sqrt((x-x0)^2+(y-y0)^2+(z-z0)^2)-dis_a)+...
    abs(sqrt((x-x1)^2+(y-y1)^2+(z-z1)^2)-dis_b)+...
    abs(sqrt((x-x2)^2+(y-y2)^2+(z-z2)^2)-dis_c)+...
    abs(sqrt((x-x3)^2+(y-y3)^2+(z-z3)^2)-dis_d);      %目标函数

gx = gradient(f,x);     %x偏导
gy = gradient(f,y);     %y偏导
gz = gradient(f,z);     %z偏导

for i =1:150        %梯度下降
    Ja = double(gx(a,b,c));
    Jb = double(gy(a,b,c));
    Jc = double(gz(a,b,c));
    a = a-alpha*Ja;
    b = b-alpha*Jb;
    c = c-alpha*Jc;
end

end