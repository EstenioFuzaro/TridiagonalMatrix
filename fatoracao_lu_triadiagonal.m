function [L, U] = fatoracao_lu_triadiagonal(A)
    n = length(A);

    % Inicialização das matrizes L e U
    L = eye(n);
    U = zeros(n);

    % Fatoração LU para matriz triadiagonal
    for k = 1:n
        U(k, k) = A(k, k);
        L(k+1:n, k) = A(k+1:n, k) / U(k, k);
        U(k, k+1:n) = A(k, k+1:n);

        if k < n
            A(k+1, k+1) = 
            A(k+1, k+1) - L(k+1, k) * U(k, k+1);
        end
    end
end
