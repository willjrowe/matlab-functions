function best_x = find_best_match(patch,strip)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
best_x = 0;
min_diff = Inf;
size_strip = size(strip,2);
size_patch = size(patch,2);

sumsqr();


for x = 1:(size_strip - size_patch + 1)
    other_patch = strip(:,x:(x+size_patch-1));
    diff = sumsqr((patch - other_patch),:);
end    

end

