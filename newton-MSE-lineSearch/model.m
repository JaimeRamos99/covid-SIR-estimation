function dy = model(~, y, p)
    dy = zeros(3,1);
    dy(1) = -p(1) * y(2) * y(1);
    dy(2) = p(1) * y(2) * y(1) - p(2) * y(2);
    dy(3) = p(2) * y(2);
end
% beta = p(1), gamma = p(2), 