function [y] = genSound(fr_amp,t)
    fs = 8000;
    tseg = (1/fs:1/fs:t);
    
    for xx = 1:size(fr_amp,1),  
        y(xx,:) = fr_amp(xx,2)*sin(2*pi*fr_amp(xx,1)*tseg);
    end

    y = sum(y,1);
end