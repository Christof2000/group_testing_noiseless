function [hamming_distance] = calcHammingDist(ground_truth_x, estimated_x)
    % Check if the input vectors have the same length
    if length(ground_truth_x) ~= length(estimated_x)
        error('Input vectors must have the same length.');
    end
    
    % Calculate the Hamming distance
    hamming_distance = sum(ground_truth_x ~= estimated_x);
end