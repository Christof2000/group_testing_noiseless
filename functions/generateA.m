function [A] = generateA(p, T, CASES)
    
    test_subjects = CASES;
    
    A = zeros(T,test_subjects);

    [rows, cols] = size(A);

    % Loop through each element of the matrix
    for i = 1:rows
        for j = 1:cols
            A(i,j) = generate_bernoulli(p);
        end
    end 
end

function result = generate_bernoulli(p)
    r = rand(); 
    if r <= p
        result = 1; 
    else
        result = 0; 
    end
end
