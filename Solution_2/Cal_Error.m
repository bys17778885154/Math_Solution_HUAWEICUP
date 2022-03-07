function [err_3d, err_2d, err_1d] = Cal_Error (ori_data, test_data, judge)
%三维误差
    dist = [];
    k = length(test_data(:,1));
    for i = 1:k
        cur = sqrt(((test_data(i,1)-ori_data(1))^2 + (test_data(i,2)-ori_data(2))^2 + (test_data(i,3)-ori_data(3))^2))/judge(3);
        if cur > 1
            dist = [dist;0];
        else
            dist = [dist;1];
        end
    end
    err_3d = dist;
    
    %二维误差
    dist = [];
    for i = 1:k
        cur = sqrt(((test_data(i,1)-ori_data(1))^2 + (test_data(i,2)-ori_data(2))^2))/judge(2);
        if cur > 1
            dist = [dist;0];
        else
            dist = [dist;1];
        end
    end
    err_2d = dist;
    
    %一维误差
    x_dist = [];
    y_dist = [];
    z_dist = [];
    for i = 1:k
        x_cur = sqrt((test_data(i,1)-ori_data(1))^2)/judge(1);
        if x_cur > 1
            x_dist = [x_dist;0];
        else
            x_dist = [x_dist;1];
        end
        y_cur = sqrt((test_data(i,2)-ori_data(2))^2)/judge(1);
        if y_cur > 1
            y_dist = [y_dist;0];
        else
            y_dist = [y_dist;1];
        end
        z_cur = sqrt((test_data(i,3)-ori_data(3))^2)/judge(1);
        if z_cur > 1
            z_dist = [z_dist;0];
        else
            z_dist = [z_dist;1];
        end
    end
    err_1d = [x_dist y_dist z_dist];

end