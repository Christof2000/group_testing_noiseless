function [x] = calcCOMP(A, y, CASES)
    
    setDict = containers.Map('KeyType', 'double', 'ValueType', 'double');
    numbers = 1:CASES;
    
    % Add each number to the dictionary
    for num = numbers
        setDict(num) = num;
    end
    
    %using a dictioary as as set, to increase speed

    [rows, cols] = size(A);

    % Loop through each element of the matrix, remove each case in a negeative test
    for i = 1:rows
        for j = 1:cols
            if y(i) == 0 
                if isKey(setDict, j) && A(i,j) == 1
                    remove(setDict, j);
                end
            end
        end
    end 
    
    set_to_vector = convertSetToVector(setDict);
    

    % Create a vector filled with zeros
    output_vector = zeros(1, CASES);
    
    % Set the elements at indices to 1
    output_vector(set_to_vector) = 1;
    
    x = output_vector;
end


function [vec] = convertSetToVector(set)   
    vec = cell2mat(keys(set));
end

