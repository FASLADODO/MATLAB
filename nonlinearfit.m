function nonlinearfit
% fit the data to this model and find A, B
% y(x) = A*x/(B+x)
% the model is nonlinear, and we need to use a non-linear least-squares 
% fitting % method.
x = [0.5 0.387 0.24 0.136 0.04 0.011];
y = [1.255 1.25 1.189 1.124 0.783 0.402];

initialguesses = [0.03 1.3];
pars = lsqcurvefit(@model,initialguesses,...
                    x,y)
fit_y = model(pars,x)

plot(x,y,'ko',x,fit_y,'  -')
               
function fit = model(parameters,x)
A = parameters(1);
B = parameters(2);
fit = A*x./(B+x);