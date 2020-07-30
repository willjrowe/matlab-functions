function [outImg] = justChannel(inputArg1,inputArg2)
outImg = zeros(size(inputArg1));
[x,y] = size(inputArg1);
deltaX = x/inputArg2;
deltaY = y/inputArg2;
redChannel = inputArg1(:,:,1);
greenChannel = inputArg1(:,:,2);
blueChannel = inputArg1(:,:,3);
across=0;
down=0;
while(across < inputArg2)
    while(down < inputArg2)
        currentX = floor(across * deltaX + 1);
        currentY = floor(down * deltaY + 1);
        nextX = ceil(currentX + deltaX - 1);
        nextY = ceil(currentY + deltaY - 1);
        redMean = mean(mean(redChannel(currentX:nextX,currentY:nextY)));
        outImg(currentX:nextX,currentY:nextY,1) = redMean;
        greenMean = mean(mean(greenChannel(currentX:nextX,currentY:nextY)));
        outImg(currentX:nextX,currentY:nextY,2) = greenMean;
        blueMean = mean(mean(blueChannel(currentX:nextX,currentY:nextY)));
        outImg(currentX:nextX,currentY:nextY,3) = blueMean;
        down=down+1;
    end
    across = across + 1;
    down=0;
end
outImg = uint8(outImg);
imshow(outImg);
end


