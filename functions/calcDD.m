function [x] = CalcDD(A, y, CASES)
    
        
    output_vector = zeros(1, CASES);
        
    [rows, cols] = size(A);

    comp_x_res = calcCOMP(A,y,CASES);
    non_defectives = ~comp_x_res;

    % Loop through each row of the matrix
    for i = 1:rows
        if y(i) == 1
            
            %set the non-defectives to 0 in all rows of the A matrix
            for z = 1:cols
                if A(i,z) == non_defectives(1,z)
                    A(i,z) = 0;
                end
            end

            % find if row sum is 1
            if sum(A(i, :)) == 1
              % find that index and add it to the set, if it is not already
              % in there
              for j = 1:cols
                if A(i, j) == 1
                    output_vector(1, j) = 1;
                    break;
                end
                
              end

            end
        end
        % for j = 1:cols
        %     if y(i) == 1 
        %         if isKey(setDict, j) == false && A(i,j) == 1
        %             remove(setDict, j);
        %             A(i,j) = 0;  %set all positve tests to zero if 
        %         end
        %     end
        % end
    end 
   
    
    x = output_vector;


end
