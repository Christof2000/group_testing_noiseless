function [x,Z] = LPrelax(A,y)
    Aineq = zeros(sum(y==1),length(A(1,:)));
    Aeq = zeros(sum(y==0),length(A(1,:)));
    pos = 0;
    neg = 0;
    for k = 1:length(y)
        if y(k) == 1
            Aineq(k-neg,:) = (-1).*A(k,:);
            pos = pos + 1;
        end
        if y(k) == 0
            Aeq(k-pos,:) = A(k,:);
            neg = neg + 1;
        end
    end
    
    bineq = (-1).*ones(length(Aineq(:,1)),1);
    beq = zeros(length(Aeq(:,1)),1);

    lb = zeros(length(A(1,:)), 1);
    

    f = ones(length(A(1,:)),1);
    
    options = optimoptions('linprog', 'Display', 'off');
    

    [x, Z] = linprog(f, Aineq, bineq, Aeq, beq,lb, [], options);
    x(x > 0 & x <= 1) = 1;





end
