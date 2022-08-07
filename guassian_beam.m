close all
clear
clc
%% variables
number_of_rays=100;

low_theta=0;
high_theta=2*pi;

mu_alpha=0;
alpha0=pi/10;
sigma_alpha=alpha0^2/2;

z=0:0.5:10;
selected_index=10;
nbins=30;
power_percentage=70;
%% draw samples
alpha=normrnd(mu_alpha,sigma_alpha,[1 number_of_rays]);
theta=low_theta+(high_theta-low_theta)*rand([1 number_of_rays]);

%% find coordinates
x= z'*tan(alpha).*cos(theta);
y=z'*tan(alpha).*sin(theta);
r=x+1i*y;
selected_r=r(selected_index,:);
data=sort(abs(selected_r));
threshold=ceil(length(data)*power_percentage/100);
hole_radius=data(threshold);
%% show the result
figure
polarplot(selected_r,'*')
title('2D plot in a specefic distance')
figure
histogram(alpha,nbins)
title('alpha normal')
figure
histogram(theta,nbins)
title('theta uniform')
figure
plot3(x,y,z)
title('3D propagation')
xlabel('x(t)')
ylabel('y(t)')
zlabel('propagation direction')
