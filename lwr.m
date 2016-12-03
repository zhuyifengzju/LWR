%% locally weighted regression --- a small practice

clear;
load datax.dat;
load datay.dat;
datax = datax;
x = [ones(size(datax'));datax'];
y = datay;
num = size(x,2);
t = -6:0.01:12;
t = t;
theta = inv(x*x')*x*y;
figure(1)
plot(x(2,:),y,'r.')
hold on;

k = 1;
t = -6:0.01:12;
t = [ones(1,size(t,2));t];
Y_lwr = zeros(1,size(t,2));

for i = 1:size(t,2)
    W = zeros(num, num);
    for j = 1:size(x,2)
        W(j,j) = exp(-(datax(j)-t(2,i))'*(datax(j)-t(2,i))./(2.0*k^2));
    end;
    theta = inv(x * W * x')*x*W*y;
   Y_lwr(i) = theta'*[1; t(2,i)];
end;
plot(t(2,:),Y_lwr,'g.');
