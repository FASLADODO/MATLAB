amu(1) = 10; amu(2) = 100; asigma(1) = 20; asigma(2) = 10;
aD = [random('Normal',amu(1),asigma(1),100,1); random('Normal',amu(2),asigma(2),100,1)];
aDp = randperm(200); aD1 = aD(aDp);
hist(aD1, 20);
% means:
eamu(1) = random('unif',1,100,1); eamu(2) = random('unif',1,100,1);
% standard deviations:
easigma(1) = random('unif',1,30,1); easigma(2) = random('unif',1,30,1);
epi(1) = 0.5; epi(2) = 0.5;
for c=1:2
    paD1{c} = pdf('norm', aD1, eamu(c), easigma(c))
end
for c=1:2
    w{c} = (epi(c)*paD1{c})./(epi(1)*paD1{1}+epi(2)*paD1{2});
end
% New means:
for c=1:2
    eamu(c) = sum(w{c}.*aD1)/sum(w{c});
end
% New sigmas:
for c=1:2
    x = aD1-eamu(c);
    easigma(c) = sqrt(sum(w{c}.*(x.*x))/sum(w{c}));
end
% New mixing proportions:
for c=1:2
    epi(c) = sum(w{c})/200;
end