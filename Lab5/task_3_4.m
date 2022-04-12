function W = task_3_4(x, N)
W = [];
x_size = size(x);

if ((x_size(1) > N / (2 * log(N))) || N < x_size(2))
    disp('Ошибка количества нейронов')
    W = [];
else

    if (x_size(2) < N)
        x = [zeros(x_size(1), N - x_size(2)) x];
    end;

    W = x' * x;

    for i = 1:1:N
        W(i, i) = 0;
    end;

end;

end
