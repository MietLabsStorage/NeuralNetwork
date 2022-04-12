function outputY = OutputSignal(inputX, n, w)
outputY(1) = inputX * w;

for l = 1:1:n - 1
    outputY(l + 1) = outputY(l) * w;
end

end
