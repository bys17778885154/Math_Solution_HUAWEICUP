clc;
clear;
close all;

%start-------------------------------------------------------


Get_data();     %读取txt并存于data_question5.xls
syms x y z;
mo = 30;    %模糊因子
pos_x = [];
pos_y = [];
pos_z = [];     %位置数组
res = [];

threshold = 150;    %阈值

data = xlsread('data_question5.xls');

% 场景信息
x_range = 5000;
y_range = 5000;
z_range = 3000;

%锚点信息
M_pos = [0,0,1300; 5000,0,1700; 0,5000,1700; 5000,5000,1300];     

generation = length(data);    %循环次数，次数为位置个数

for i = 1:generation
    fprintf("迭代次数："+i+"\n");
    a0 = data(i,1);
    a1 = data(i,2);
    a2 = data(i,3);
    a3 = data(i,4);     %定义四个位置变量
    a0 = a0 + mo;
    a1 = a1 + mo;
    a2 = a2 + mo;
    a3 = a3 + mo;       %添加模糊因子

    %% 计算坐标与精度（利用A1,A2,A3的距离梯度下降计算）
    [a,b,c] = Distance2Location(x_range,y_range,z_range,M_pos,a0,a1,a2,a3);      %返回目标点的三维坐标a,b,c与偏移系数beta

    
    pos_x = [pos_x a];      %x坐标
    pos_y = [pos_y b];      %y坐标
    pos_z = [pos_z c];      %z坐标
    f = abs(sqrt((a)^2+(b)^2+(c-1300)^2)-a0)
    res = [res;f];

end
tag = [];

for i = 1:length(res)
    if(res(i)<=threshold)
        tag = [tag "1"];    %标签1为正常
    else
        tag = [tag "0"];    %标签2为异常
    end
end


xlswrite("标签结果.xls",tag);

position = [pos_x',pos_y',pos_z'];
save position.mat;      %保存坐标
save res.mat;       %保存偏离值
save tag.mat;       %保存标签

xlswrite('position.xls',position);