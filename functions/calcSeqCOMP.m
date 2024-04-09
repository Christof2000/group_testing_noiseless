function [x] = calcSeqCOMP(A, y, CASES)
    
                
    [rows, cols] = size(A);

    comp_x_res = calcCOMP(A,y,CASES);
    non_defectives = ~comp_x_res;
    
    Kdd = calcDD(A, y, CASES); %dim (1, CASES)
    %disp(sum(Kdd))
    %unexplained_test_counter dict(case, count) = {}
    % amount of unexplained tests in this iteration = 0

    %for each test
    %   determine if test is unexplained
    %   if so increase each tested case counter by 1 
    % 
    %reset unexplained test_counter and go again until no longer a test is
    %unexplained

    unexplained_tests_counter = 1; % set to some value above 0
    %The counter is not necesariily acurate there could be more unexplained
    %tests than this value but never less, this is to increase 

    while unexplained_tests_counter > 0
        
        sum_kdd = sum(Kdd);

        unexplained_tests_counter = 0;
        unexplained_counter = containers.Map('KeyType', 'double', 'ValueType', 'double');
        for test_i = 1:rows
            
            %check if positive test
            if y(test_i) == 1
    
                %checking if test is unexplained
                unexplained = true;
                for case_i = 1:cols
                    
                    if Kdd(case_i) == 1 && A(test_i, case_i) == 1
                        unexplained = false;
                        break;
                    end

                    % if A(test_i, case_i) == 1
                    %     if Kdd(case_i) == 0  && non_defectives(case_i) == 0 %case not in Kdd and case is tested here, and that its also not a non defective
                    %         unexplained = true;
                    %     end
                    % else % not unexplained Kdd = 1
                    %     unexplained = false;
                    %     break;
                    % end
                end
        
                if unexplained
                    for case_i = 1:cols
                        if  A(test_i, case_i) == 1  && non_defectives(case_i) == 0
                            if isKey(unexplained_counter, case_i)
                                unexplained_counter(case_i) = unexplained_counter(case_i) + 1; 
                            else
                                unexplained_tests_counter = unexplained_tests_counter + 1;
                                unexplained_counter(case_i) = 1;
                            end
                        end
                    end
                end       
            end
            
        end
        % find max in set
                
        [keys, value] = findMaxValues(unexplained_counter);
        
        convertToMat = cell2mat(keys);
        if size(convertToMat) > 0
            Kdd(convertToMat(1)) = 1;
        end
        %disp(unexplained_tests_counter)
        
    end

    
    x = Kdd;


end



