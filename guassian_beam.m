close all
clear
clc
%% variables
%they can be changed depending on the laser and other conditions as desired

number_of_rays=100;
%the more the rays are the more accurate the result will be

%alpha is the angle of y according to x
low_alpha=0;
high_alpha=2*pi;

%theta is the agnle between the propagation direction and the incident
%plane
mu_theta=0;
theta0=pi/10;
%I don't know it yet,it's just a random number for now
sigma_alpha=theta0^2/2;

%the beam propagation in z direction
z=0:0.5:10;
selected_index=10;
power_percentage=80;
% they have be changed due to the design
%randon nembers for now

%% draw samples
theta=normrnd(mu_theta,sigma_alpha,[1 number_of_rays]);
alpha=low_alpha+(high_alpha-low_alpha)*rand([1 number_of_rays]);

%% check the actual distribution of parameters
%optional 
%just to observe the frequency of each angle
nbins=30;
figure
subplot(1,2,1)
histogram(theta,nbins)
title('theta normal')
subplot(1,2,2)
histogram(alpha,nbins)
title('alpha uniform')
%% find coordinates
x= transpose(z)*tan(theta).*cos(alpha);
y=transpose(z)*tan(theta).*sin(alpha);
r=x+1i*y;
hole_raduises=find_hole_radius(r,power_percentage);

%% 2D plot 
r_tmp = transpose(hole_raduises);
selected_radius=r_tmp(selected_index);
angle = linspace(0,2*pi,50);

figure
polarplot(r(selected_index,:),'*')
hold on
polarplot(angle,selected_radius+zeros(size(angle)))
title('2D plot in a specefic distance')
%% 3D plot
figure
plot3(x,y,z)
title('3D propagation')
xlabel('transverse_x')
ylabel('transverse_y')
zlabel('propagation direction')
