function w = hamm(N)
    n = 0:N-1;
    w = 0.54 - 0.46 * cos(2*n'*pi / (N-1));

end