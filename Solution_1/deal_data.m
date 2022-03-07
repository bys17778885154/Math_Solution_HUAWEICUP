% 如下代码用于遍历文件夹抓取xls中的8列数据
% 清洗数据
function deal_data(data_path, output_path)

    namelist = dir([data_path,'*.xls']);%load the information of *.xls
    namelist =sort_nat({namelist.name});
    namelist = cell2struct(namelist, 'name', 1);
    l =length(namelist);% the number of xls files
    length_ = [];
    for i = 1:l
        fullname{i} = [data_path,namelist(i).name];% directory
        A = [];
        B = [];
        A = xlsread(fullname{i});% data to matrix
        B = unique(A, 'rows');
        
        n = length(B);
        ave = [sum(B(:,2))/n; sum(B(:,4))/n; sum(B(:,6))/n; sum(B(:,8))/n];
        add = [] ;
        % delete the error data rows
        for k = 1:n
            if (abs(B(k,2) - ave(1)) > 1e+03) || (abs(B(k,4) - ave(2)) > 1e+03) || (abs(B(k,6) - ave(3)) > 1e+03) || (abs(B(k,8) - ave(4)) > 1e+03)
               add = [add;k];
            end
        end
        if length(add) > 0
            for Q = length(add):-1:1
                B(add(Q),:) = [];
            end
        end
        
        xlswrite([output_path,num2str(i)],B);
        l0 = length(B);
        length_ = [length_;l0];
    end
    xlswrite([output_path,'number'],length_);
end