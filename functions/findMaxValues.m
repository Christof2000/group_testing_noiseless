function [maxKeys, maxValue] = findMaxValues(myMap)
    % Extract values and keys
    valuesArray = cell2mat(values(myMap));
    keysArray = keys(myMap);

    % Find maximum value
    maxValue = max(valuesArray);

    % Find keys corresponding to the maximum value
    maxKeys = keysArray(valuesArray == maxValue);
end
