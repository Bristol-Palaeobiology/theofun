function [ out ] = spiral( start , img , excl)
% Function to perform a spiral check from a starting point in a co-ordinate
% grid until it finds a black pixel.

%% LOAD INPUT DATA

% Load image file
%img = imread(image);

x = start(1);
y = start(2);


[ymax , xmax] = size(img);

dir = 0;

k = 0;

border = 500;

visited = zeros(xmax + border , ymax + border);

visited(x + border/2 , y + border/2) = 1;

while k == 0
    if x + border/2 > 1 && x + border/2 < xmax+border && y + border/2 > 1 && y + border/2 < ymax+border
        if dir == 0
            y = y + 1;
            visited(x + border/2 , y + border/2) = 1;
            dir = 1;
        elseif dir == 1
            x = x + 1;
            visited(x + border/2 , y + border/2) = 1;
            dir = 2;
        elseif dir == 2
            y = y - 1;
            visited(x + border/2 , y + border/2) = 1;
            dir = 3;
        elseif dir == 3
            x = x - 1;
            visited(x + border/2 , y + border/2) = 1;
            dir = 0;
        else
            error('Direction Bug');
        end

        if x > 0 && xmax > x && y > 0 && ymax > y        
            if img(y,x) == 0 && excl(x,y) == 0
                k = 1;
                break
            end
        end

        if dir == 0
            x1 = x;
            y1 = y + 1;
        elseif dir == 1
            x1 = x + 1;
            y1 = y;
        elseif dir == 2
            x1 = x;
            y1 = y - 1;
        elseif dir == 3
            x1 = x - 1;
            y1 = y;
        else
            error('Direction Bug');
        end

        if x1 + border/2 > 0 && x1 + border/2 <= xmax+border && y1 + border/2 > 0 && y1 + border/2 <= ymax+border
            if visited(x1 + border/2 , y1 + border/2) == 1
               if dir == 0
                   dir = 3;
               elseif dir == 1
                   dir = 0;
               elseif dir == 2
                   dir = 1;
               elseif dir == 3
                   dir = 2;
               end
            end
        else
            x = nan;
            y = nan;
            k = 1;
        end
    else
        x = nan;
        y = nan;
        k = 1;
    end
end

if x == 0 && y == 0
    out = [nan nan];
else
    out = [x y];
end

end

