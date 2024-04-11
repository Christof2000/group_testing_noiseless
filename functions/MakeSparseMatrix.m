function matrix = MakeSparseMatrix(rows,cols,ones_per_col)

%Function creates a random sparse matrix like the given dataset this will
%be the ground truth of x


matrix = zeros(rows, cols);

for col = 1:cols
    indices = randperm(rows, ones_per_col);
    matrix(indices, col) = 1;
end
end