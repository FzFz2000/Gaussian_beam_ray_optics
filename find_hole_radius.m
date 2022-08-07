function [hole_radiuses] = find_hole_radius(guassian_rays,power_percentage)
%we place a hole in front of the laser beam
%we would like to find the appropriate hole raduis in which a specefic
%amout of laser power cross the hole

abs_rays=abs(guassian_rays);
sorted_rays=sort(abs_rays,2);
threshold_index=ceil(length(sorted_rays)*power_percentage/100);
hole_radiuses=sorted_rays(:,threshold_index);

end

