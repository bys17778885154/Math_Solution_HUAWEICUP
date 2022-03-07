% 如下代码用于遍历文件夹抓取txt中的8列数据
function Remake_Matrix(data_path, output_path)
    % data_path is the directory of folder
    namelist = dir([data_path,'*.txt']);% load the information of *.txt
    namelist =sort_nat({namelist.name});
    namelist = cell2struct(namelist, 'name', 1);
    l =length(namelist);% the number of txt files
    length_ = [];
    for i = 1:l
        fullname{i} = [data_path,namelist(i).name];% directory
        A(i) = importdata(fullname{i});% data to matrix
        d = [];
        for j = 1:length(A(i).data)/4
            d = [d;reshape([A(i).data(j*4-3:j*4,3:4)].',[1 8])];
        end
        xlswrite([output_path,num2str(i)],d);
        l0 = length(d);
        length_ = [length_;l0];
    end
    xlswrite([output_path,'number'],length_);
end

