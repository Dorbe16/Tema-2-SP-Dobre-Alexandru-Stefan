function [sgn] = my_sgn(t)
    w = 2*pi/40;
    sgn = sawtooth(w*t,0.5)+0.2; %Semnalul initial
    sgn(sgn < 0) = 0;
end

