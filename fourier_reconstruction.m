%% 
f = round(rand(2, 3)*255);
%%
A2 = dftmtx(2);
A3 = dftmtx(3);
%% Στήλες πρώτα, μετά γραμμές
Fleft = A2*f
F = Fleft*A3
%% Γραμμές πρώτα, μετά στήλες
Fright = f*A3
F = A2*Fright
%%
invA2 = inv(A2);
invA3 = inv(A3);
for i = 1:2
    for j = 1:3
        basis_images{i, j} = invA2(i, :).'*invA3(:, j).';
    end
end
%%
frecon = zeros(2, 3);
for i = 1:2
    for j = 1:3
        frecon = frecon + F(i, j)*basis_images{i, j};
    end
end
real(frecon)
