function mat_to_latex(M, type, precision)
% Lukas Gamard, dec 2021
% converts a RxC-matrix to Latex notation
% INPUT: matrix M
%        bracket type
%        numbers equal to zero below given precision vill be written with
%        one digit
% USAGE: mat_to_latex(M, "bmatrix", 1e-4)
    file = fopen(sprintf("%s_to_latex.m", inputname(1)), "w");
    
    fprintf(file, "\\begin{%s}\n", type);
    [R, C] = size(M);    
    for i = 1:R
        for j = 1:C-1
            fprintf(file, "%s & ", format_float(M(i,j), precision));    
        end
        fprintf(file, "%s \\\\\n", format_float(M(i,C), precision));
    end
    fprintf(file, "\\end{%s}", type);
end

function y=format_float(x, eps)
% returns a string representation of a float
% an integer if enough precision
% 2 digits otherwise
    if x - floor(x) <= eps
        y = sprintf("%d",floor(x));
    else
        y = sprintf("%.2f", x);
    end
end