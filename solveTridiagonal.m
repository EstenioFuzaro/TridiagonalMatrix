function x = solveTridiagonal(A, b)
    n = length(b);
    
    % Decomposição de Thomas
    for i = 2:n
        m = A(i, i-1) / A(i-1, i-1);
        A(i, :) = A(i, :) - m * A(i-1, :);
        b(i) = b(i) - m * b(i-1);
    end
    
    % Substituição de volta
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    
    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1) * ...
        ... x(i+1)) / A(i, i);
    end
end
