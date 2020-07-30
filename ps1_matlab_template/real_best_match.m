function best_x = real_best_match(patch,strip)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
best_x = 0;
min_diff = Inf;
size_strip = size(strip,2);
size_patch = size(patch,2);

for x = 1:(size_strip - size_patch + 1)
   other_patch = strip(:,x:(x+size_patch-1));
   diff = sumsqr((patch-other_patch));
   if diff < min_diff
       min_diff = diff;
       best_x = x;
   end
end
new_patch = strip(:,best_x:(best_x+size_patch-1));
figure, imshow(patch);
figure, imshow(new_patch);
end

