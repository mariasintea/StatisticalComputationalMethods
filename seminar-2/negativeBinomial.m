clear all

% Simulate Pascal(Negative Binomial) distribution by a discrete method

% the parameters of the NBin distribution
n = input('n (in N) = ');
p = input('p (in (0, 1)) = ');

% Generate one variable
% Y = zeros(1, n); % initial number of failures
% for j = 1 : n
%     while rand >= p
%         Y(j) = Y(j) + 1;
%     end
% end
% X = sum(Y);

% Generate a sample of such variables
N = input('nr. of simulations = '); % at least 1e5
X = zeros(1, N);
for i = 1 : N
    Y = zeros(1, n);
    for j = 1 : n
        while rand >= p
            Y(j) = Y(j) + 1;
        end
    end
    X(i) = sum(Y);
end

% Comparison
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', nbinpdf(2, n, p))
fprintf('error = %e\n\n', abs(nbinpdf(2, n, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', nbincdf(2, n, p))
fprintf('error = %e\n\n', abs(nbincdf(2, n, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', nbincdf(1, n, p))
fprintf('error = %e\n\n', abs(nbincdf(1, n, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', n * (1 - p) / p)
fprintf('error = %e\n\n', abs(n * (1 - p) / p - mean(X)))