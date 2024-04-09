function [result] = IsSuccesfull(ground_truth_x, estimated_x)
    % Check if the input vectors have the same length
    result = isequal(ground_truth_x, estimated_x);
end