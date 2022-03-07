function Get_Data()

    data = importdata('附件5：动态轨迹数据.txt');
    d = [];
    d0 = [];
    for j = 1:length(data.data)/4
        d = [d;reshape([data.data(j*4-3:j*4,3:4)].',[1 8])];
        data_ = [d(j,1),d(j,3),d(j,5),d(j,7)];
        d0 = [d0;data_];
    end
    
    xlswrite('data_question5.xls',d0);

end