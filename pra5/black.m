function w = black(N)
    n = 0:N-1;
    w = 0.42 - 0.5*cos(2*n'*pi / (N-1)) + 0.08*cos(4*n'*pi / (N-1));
end