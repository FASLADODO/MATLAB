%Mixture by EM algorithm
 clear all
 close all
%-----------------figure defaults
disp('Mixture by EM algorithm')
lw = 2;
set(0, 'DefaultAxesFontSize', 16);
fs = 14;
msize = 5;
%----------------
randn('state',3) %set the seeds (state) to have
rand ('state',3) %the constancy of results
%--------------generate the data ----------------
x=[]; n=150;
for i=1:n
    ra=rand(1,1);
    add = 2 * randn - 5; %N(-5,4) 50% comp 1
    if ra < 0.2
       add =  randn + 2; %N(2,1) 20% comp 2
    elseif ra > 0.7
       add = 0.5*randn; %N(0,0.25) 30% comp 3
    end
   x = [x add];
end
% we got 150 obsercations from
% 0.5 N(-5, 2^2) + 0.3 N(0, 0.5^2) + 0.2 N(2,1).
%------- forget the weights now ------------------------------
k = 3; %number of distributions
omega_current = 1/3 * ones(1, 3); %------ignorance start------ %---------
mus = [-5 0 2 ]; %-------- we know the distributions sig2s = [4 0.25 1 ]; %---- exactly, so means, vars are known %---------------EM starts!------------------------------------- for M=1:20 %----#ofE-Mcycles.20isplenty! szs=[]; z=zeros(n,k);
%-------------E-Step, conditional expectations of z's
for i=1:n
    for j=1:k
        z(i,j) = omega_current(j) * 1./(sqrt(2*pi*sig2s(j))) *exp( -(x(i)-mus(j))^2/(2*sig2s(j)) );
    end
end

%  z(i,j)  are probabilities that observation i is coming
%  from the component j.    But the probs are not normalized.
%  The following cycle will compute the normalizing constant.
for i=1:n
    sz = 0;
    for j=1:k
        sz = sz + z(i,j);
    end
    szs =[szs, sz];
end
norm=[];
for j=1:k
norm = [norm szs'];
end
zm = z ./ norm;
%---------------- M-Step, just plug in zk's
omega_new = sum(zm)/n;    % and repeat...
omega_current = omega_new;
end
omega_current
figure(1)
 histo(x,25,0,1)
 hold on
 xx=-12:0.1:5; omega=[0.5 0.3 0.2]; mixt=0; mixe=0;
 for j=1:k
 mixt = mixt+omega(j) .* 1./(sqrt(2*pi*sig2s(j))) .* ...
            exp( -(xx-mus(j)).^2./(2*sig2s(j)) );
    end
 plot(xx, mixt, 'r--','linewidth',lw)
 for j=1:k
 mixe = mixe+omega_current(j) .* 1./(sqrt(2*pi*sig2s(j))) .* ...
            exp( -(xx-mus(j)).^2./(2*sig2s(j)) );
 end
 plot(xx, mixe, 'b-','linewidth',lw)
 axis tight
 print -depsc 'C:\Brani\Courses\Bayes\Handouts\Working12\Figs\mix_em.eps'