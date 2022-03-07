function [data_get] = Get_Data(name_data)
    A = [];
    A = xlsread(name_data);%将文件中的数据赋值到矩阵中
    d = [];
    for j = 1:length(A)
        data_ = [A(j,1),A(j,3),A(j,5),A(j,7)];
        d = [d;data_];
    end
    data_get = d;
end
