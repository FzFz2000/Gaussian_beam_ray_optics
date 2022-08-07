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
power_percentage=80;


%% draw samples
alpha=normrnd(mu_alpha,sigma_alpha,[1 number_of_rays]);
theta=low_theta+(high_theta-low_theta)*rand([1 number_of_rays]);

%% check the actual distribution of parameters
nbins=30;
figure
histogram(alpha,nbins)
title('alpha normal')
figure
histogram(theta,nbins)
title('theta uniform')

%% find coordinates
x= transpose(z)*tan(alpha).*cos(theta);
y=transpose(z)*tan(alpha).*sin(theta);
r=x+1i*y;
hole_raduises=find_hole_radius(r,power_percentage);
r_tmp = transpose(hole_raduises);
selected_radius=r_tmp(selected_index);
%% show the result
%2D plot 
figure
polarplot(r(selected_index,:),'*')
hold on
angle = linspace(0,2*pi,50);
polarplot(angle,selected_radius+zeros(size(angle)))
title('2D plot in a specefic distance')
%3D plot
figure
plot3(x,y,z)
title('3D propagation')
xlabel('x(t)')
ylabel('y(t)')
zlabel('propagation direction')
