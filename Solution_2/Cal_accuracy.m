clc;
% clear;
close all;

data = importdata("Tag坐标信息.txt");

% 读入正常数据
% x = importdata("pos_x.mat");
% y = importdata("pos_y.mat");
% z = importdata("pos_z.mat");

% 读入异常数据
x = importdata("pos_x_err.mat");
y = importdata("pos_y_err.mat");
z = importdata("pos_z_err.mat");

pos_normal = [];
for i = 1:length(x)
    pos_normal(i,1) = x(i);
    pos_normal(i,2) = y(i);
    pos_normal(i,3) = z(i);
end


basedata = data;
testdata = pos_normal;

err_3 = [];
err_2 = [];
err_1 = [];


for i = 1:length(testdata)
    [err_3d,err_2d,err_1d] = Cal_Error(basedata.data(i,:)*10,testdata(i,:), [250;300;300]);
    err_3 = [err_3;err_3d];
    err_2 = [err_2;err_2d];
    err_1 = [err_1;err_1d];
end

% 1D精度
accuracy_1d = [0 0 0];
for k = 1:3
    for i = 1:324
        accuracy_1d(k) = accuracy_1d(k)+err_1(i,k);
    end
end
accuracy_1d/324

% 2D精度
accuracy_2d = 0;
for i = 1:324
    accuracy_2d = accuracy_2d+err_2(i);
end
accuracy_2d/324

% 3D精度
accuracy_3d = 0;
for i = 1:324
    accuracy_3d = accuracy_3d+err_3(i);
end
accuracy_3d/324