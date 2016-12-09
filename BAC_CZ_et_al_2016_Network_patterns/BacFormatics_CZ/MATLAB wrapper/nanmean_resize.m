function [ V ] =  nanmean_resize( input_vector,number_of_time_points )

%     function that resize vector input using nanmean (better than imresize for nan values)
d=round(linspace(1,length(input_vector),number_of_time_points+1));


for ii=1:number_of_time_points
    V(ii)=nanmean(input_vector(d(ii):d(ii+1)));
end

 
