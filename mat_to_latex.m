function y=mat_to_latex(M, type)
% Lukas Gamard, dec 2021
% converts a RxC-matrix to Latex notation
% INPUT: matrix M
%        bracket type
% USAGE: mat_to_latex(M, "bmatrix")
    file = fopen(sprintf("%s_to_latex.m", inputname(1)), "w");
    
    fprintf(file, "\\begin{%s}\n", type);
    [R, C] = size(M);    
    for i = 1:R
        for j = 1:C-1
            fprintf(file, "%f & ", M(i,j));    
        end
        fprintf(file, "%f \\\\\n", M(i, C));
    end
    fprintf(file, "\\end{%s}", type);
end