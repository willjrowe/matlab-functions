function [newImg] = bit(inputArg1,inputArg2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
disp(size(inputArg1));
newImg = zeros(size(inputArg1));
[x,y,z] = size(inputArg1);
deltaX = x/inputArg2;
deltaY = y/inputArg2;
%work across then down
%could do like across times size
%need to also loop through rgb
redChannel = inputArg1(:,:,1);
greenChannel = inputArg1(:,:,2);
blueChannel = inputArg1(:,:,3);
mean(redChannel(1,2));

across=0;
down=0;
while(across < inputArg2)
    while(down < inputArg2)
        redMean = mean(mean(redChannel(across*deltaX+1:(across+1)*deltaX),down*deltaY+1:(down+1)*deltaY));
        disp(redMean);
        disp('break');
        down=down+1;
    end
    across = across + 1;
    down=0;
end

end

