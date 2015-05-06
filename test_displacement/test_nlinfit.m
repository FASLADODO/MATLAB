%-----------------------------------------------------------------------
% Demonstrate nonlinear regression -- quick & dirty example with "nlinfit"
% Fit y=alpha*exp(beta*x)
% Programming Note: call "nlinfit"
% Instructor: Nam Sun Wang
%-----------------------------------------------------------------------

% Start fresh
      clear all

% Program header
      disp('Demonstrate nonlinear regression with an exponential decay function')
      disp('  y = alpha*exp(beta*x)')

% Generate test data, which in practice is read into variables
      xDataz = [  0 2 3 5 7 8 9 ]';
      yDataz = [ 10 8 5 3 2 1 1 ]';

% Initial guess
      guess = [15 -0.5];

% Call fminsearch to find the parameters; sse function is specified in decaya.m
      param = nlinfit(xDataz, yDataz, 'decayb', guess);

% Print the coefficients
      alpha = param(1);
      beta  = param(2);
      disp('The coefficients are: ')
      disp([ 'alpha = ', num2str(alpha) ])
      disp([ 'beta  = ', num2str(beta)  ])

% Generate the fitted function
      xx=0:0.1:10 ;
      yfit = alpha*exp(beta*xx);

% Plot and compare results
      plot(xDataz, yDataz, 'o', xx, yfit, '-')
      xlabel('x')
      ylabel('y')
      title('Nonlinear Regression of y=\alpha*exp(\beta*x)')
      legend('data','regression')

%=======================================================================
%=======================================================================
% Define the same 'decayb' function in this m-file ----------------------
% g as a vector function of scalar parameters alpha & beta and matrix x
      g= @(alpha,beta,x) alpha*exp(beta*x);
% f as a vector function of a vector 'param' and matrix x
%     param = [param(1) param(2)] = [alpha beta]
      f= @(param,x) g(param(1),param(2),x);
% The following finds nonlinear regression coefficients
      disp(' ')
      disp('Regression coefficients resulting from another way of defining the nonlinear function f to be fitted')
      param = nlinfit(xDataz, yDataz, f, guess);
% See 'newton5.m' for many other forms of Matlab syntax on 'fsolve', which is similar to 'fminsearch'