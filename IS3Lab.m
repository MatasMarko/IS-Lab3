
clear all
x = 0:1 / 22:1;
d1 = (1 + 0.6*sin(2*pi*x/0.7));
d2 = (0.3*sin(2*pi*x));

d=(d1+d2)/2;

figure(1)
plot(x,d)
hold on

c1 = 0.181818;
c2 = 0.909091;

%sigma
r1 = 0.1361;
r2 = 0.1154;

w1 = rand(1);
w2 = rand(1);
w0 = rand(1);
n = 0.1;
N = 100;

for i = 1:N
    for j = 1:length(x)
        f1 = exp(-(((x(j)-c1)^2)/(2*r1^2)));
        f2 = exp(-(((x(j)-c2)^2)/(2*r2^2)));
        y = f1*w1 + f2*w2 + w0;
        err = d(j) - y;
        % svoriai
        w1 = w1 + n*err*f1;
        w2 = w2 + n*err*f2;
        w0 = w0 + n*err;
    end
end

a = 0:1/18:1;
z = zeros(1,length(a));

for j = 1:length(a)
    f1 = exp(-(((a(j)-c1)^2)/(2*r1^2)));
    f2 = exp(-(((a(j)-c2)^2)/(2*r2^2)));
    y = f1*w1 + f2*w2 + w0;
    z(j) = y;
end

plot(a,z,'r-');




