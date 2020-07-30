function [H, theta, rho] = hough_lines_acc(inputIMG, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});
    
    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;
    
    
    
    %% TODO: Your code here
    edgeIMG = edge(inputIMG,'canny');
    imwrite(edgeIMG,'edgeIMG.png');
    D = sqrt(size(edgeIMG,1).^2 + size(edgeIMG,2).^2);
    theta = (1:180);
    houghTable = zeros(2*ceil(D),numel(theta));
   
   for x = 1: size(edgeIMG,1)
       for y = 1: size(edgeIMG,2)
           if (edgeIMG(x,y) ~= 0)
               for iterTheta = 1:180
                   d = x*cosd(iterTheta) + y*sind(iterTheta);
                   if (d>0)
                       d = ceil(d);
                       houghTable(d,iterTheta) = houghTable(d,iterTheta) + 1;
                   end
               end
           end
       end   
   end                 
    
    
%     for i = 1: numel(x)
%         
%         for iterTheta = 1:180
%             d = x(i)*cosd(iterTheta)+y(i)*sind(iterTheta);
%             if (d > 0)
%                 d = ceil(d);
%                 houghTable(d,iterTheta) = houghTable(d,iterTheta) + 1;
%             end
%         end    
%     end
    H = houghTable;
   theta = 1;
   rho = 1;
end
    
    
