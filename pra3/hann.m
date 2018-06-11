function w = hann(N)
    n = 0:N-1;
    w = 0.5 - 0.5*cos(2*n'*pi / (N-1));
end