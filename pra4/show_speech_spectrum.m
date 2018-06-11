function show_speech_spectrum( input, fs )
    window = fix(10e-3 * fs); % ????: 10ms
    step = fix(window / 2);   % ??: 5ms
    padding = step-mod(length(input)-window, step);
    input = [input; zeros(padding, 1)]; % ??
    map_width = (length(input)-window)/step;
    output = zeros(window, map_width);
    hann_window = hann(length(window), 'periodic');
    for i = 1:map_width-1
        output(:, i) = abs(fft(input((i-1)*step+1 : (i-1)*step+window) .* hann_window)); 
    end
    
    imshow(output(1:floor(size(output,1)/2), :));colormap(gca,'jet')
end

