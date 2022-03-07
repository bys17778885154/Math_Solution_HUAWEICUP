clc;
close all;
clear all;

a = load('position.mat');
d = load('kekka_5.mat');
d0 = d.kekka(:);
flag = [];
for i = 1:length(d0)
   if d0(i) > 150
       flag = [flag; i];
   end
end

par = 1005;
par0 = 1;

a_new = [];
b_new = [];
c_new = [];
for i = 1:46
    if (mod(i,par) == 0)
        a_new = [a_new; a.position(i,1)];
        b_new = [b_new; a.position(i,2)];
        c_new = [c_new; a.position(i,3)];
    end
end

for i = 47:244
   if (mod(i,par0) == 0)
        a_new = [a_new; a.position(i,1)];
        b_new = [b_new; a.position(i,2)];
        c_new = [c_new; a.position(i,3)];
    end
end

for i = 245:283
    if (mod(i,par) == 0)
           a_new = [a_new; a.position(i,1)];
           b_new = [b_new; a.position(i,2)];
           c_new = [c_new; a.position(i,3)];
    end
end

for i = 284:302
   if (mod(i,par0) == 0)
        a_new = [a_new; a.position(i,1)];
        b_new = [b_new; a.position(i,2)];
        c_new = [c_new; a.position(i,3)];
    end
end

for i = 303:341
    if (mod(i,par) == 0)
       a_new = [a_new; a.position(i,1)];
       b_new = [b_new; a.position(i,2)];
       c_new = [c_new; a.position(i,3)];
    end
end

for i = 342:429
      if (mod(i,par0) == 0)
        a_new = [a_new; a.position(i,1)];
        b_new = [b_new; a.position(i,2)];
        c_new = [c_new; a.position(i,3)];
    end
end

for i = 430:459
    if (mod(i,par) == 0)
       a_new = [a_new; a.position(i,1)];
       b_new = [b_new; a.position(i,2)];
       c_new = [c_new; a.position(i,3)];
    end
end

for i = 460:518
     if (mod(i,par0) == 0)
        a_new = [a_new; a.position(i,1)];
        b_new = [b_new; a.position(i,2)];
        c_new = [c_new; a.position(i,3)];
    end
end

for i = 519:535
    if (mod(i,par) == 0)
           a_new = [a_new; a.position(i,1)];
           b_new = [b_new; a.position(i,2)];
           c_new = [c_new; a.position(i,3)];
    end
end

for i = 536:539
   if (mod(i,par0) == 0)
        a_new = [a_new; a.position(i,1)];
        b_new = [b_new; a.position(i,2)];
        c_new = [c_new; a.position(i,3)];
    end
end
%三次样条插值
t1=0:1:538;
t=0:0.01:539;
XX=spline(t1,a.position(:,1),t);
YY=spline(t1,a.position(:,2),t);
ZZ=spline(t1,a.position(:,3),t);

plot3(XX,YY,ZZ,'g','linewidth',1);
% hold on;
t1=0:1:length(a_new)-1;
t=0:0.01:length(a_new);
XX0=spline(t1,a_new,t);
YY0=spline(t1,b_new,t);
ZZ0=spline(t1,c_new,t);
plot3(XX0,YY0,ZZ0,'b','linewidth',1);
grid minor;grid on;hold on;
xlabel('x');ylabel('y');zlabel('z');