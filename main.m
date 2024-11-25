

figure

N = 200;

Field = zeros(N, N);
Field(floor(N/2), floor(N/2)) = 1;

source_end = [0 0 0 0];
k = 0;
Period = 10000;
timer = tic;
stop = false;
while ~stop
time = toc(timer);
if time > Period
    stop = true;
end

% add particle
R = floor(randi([1, 4], 1));
switch R
    case 1
        x = 1;
        y = 1;
    case 2
        x = 1;
        y = N;
    case 3
        x = N;
        y = 1;
    case 4
        x = N;
        y = N;
end


iter_num = 0;
fix_part = false;
while ~fix_part
    iter_num = iter_num + 1;

    if x == 1
        fix_part = fix_part || Field(x+1, y) == 1;
    elseif x == N
        fix_part = fix_part || Field(x-1, y) == 1;
    else
        fix_part = fix_part || Field(x+1, y) == 1;
        fix_part = fix_part || Field(x-1, y) == 1;
    end
    
    if y == 1
        fix_part = fix_part || Field(x, y+1) == 1;
    elseif y == N
        fix_part = fix_part || Field(x, y-1) == 1;
    else
        fix_part = fix_part || Field(x, y+1) == 1;
        fix_part = fix_part || Field(x, y-1) == 1;
    end
    
    if ~fix_part
        x = x + randi([-1 1]);
        y = y + randi([-1 1]);
        if x < 1
            x = 1;
        end
        if y < 1
            y = 1;
        end
        if x > N
            x = N;
        end
        if y > N
            y = N;
        end
    end
end

if iter_num == 1
    source_end(R) = 1;
end

if sum(source_end) == 4
    stop = true;
end

%         Field2(x, y) = 1;
        Field(x, y) = 1;
        k = k + 1;
        if k == 25
            k = 0;
        cla
        imagesc(Field)
        axis equal
        drawnow
        end


end





