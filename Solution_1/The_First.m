clc;
clear all;
close all;

%% 抓取数据
normal_data_path = ('.\normal_data\');
normal_output_path = ('.\normal_outputdata\');

error_data_path = ('.\error_data\');
error_output_path = ('.\error_outputdata\');


Remake_Matrix(normal_data_path, normal_output_path);
Remake_Matrix(error_data_path, error_output_path);

%% 数据清洗
normal_output_path = ('.\normal_outputdata\');
normal_deal_path = ('.\normal_dealdata\');

error_output_path = ('.\error_outputdata\');
error_deal_path = ('.\error_dealdata\');
% 
deal_data(normal_output_path, normal_deal_path);
deal_data(error_output_path, error_deal_path);

% plot_data = xlsread('number_all.xlsx');
% figure;
% subplot(2,1,1);
% plot(1:324,plot_data(:,1),'b','linewidth',1.0);
% hold on;
% plot(1:324,plot_data(:,2),'r','linewidth',1.0);
% grid minor;grid on;
% xlabel('位置编号');ylabel('样本数目');
% title("清洗前后有干扰样本数目对比图");
% legend('清洗前','清洗后');
% hold on;
% subplot(2,1,2);
% plot(1:324,plot_data(:,3),'b','linewidth',1.0);
% hold on;
% plot(1:324,plot_data(:,4),'r','linewidth',1.0);
% grid minor;grid on;
% xlabel('位置编号');ylabel('样本数目');
% title("清洗前后无干扰样本数目对比图");
% legend('清洗前','清洗后');
% hold on;





