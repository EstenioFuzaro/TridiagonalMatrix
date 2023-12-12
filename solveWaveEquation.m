function u = solveWaveEquation(c, L, T, Nx, Nt)
    % Parâmetros da grade
    dx = L / Nx;
    dt = T / Nt;
    
% Coeficiente da equação da onda
    r = (c * dt / dx)^2;
    
% Inicialização da matriz tridiagonal
    A = sparse(Nx, Nx);
    A(1, 1) = 1;
    A(Nx, Nx) = 1;
    
    for i = 2:Nx-1
        A(i, i-1:i+1) = [r, 2*(1-r), r];
    end
    
    % Condições iniciais
    u0 = zeros(Nx, 1);
    
    % Loop temporal
    for n = 1:Nt
        u = solveTridiagonal(A, u0);
        u0 = u;
    end
end
