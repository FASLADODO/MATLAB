function gamma = estep(X,prior,mu,sigma)
% GAMMA = ESTEP(X,PRIOR,MU,SIGMA)
% GAMMA [KxN] - p(Ck|xn)
% X [DxN] - observation data
% prior [1xK] - priors of the K Gaussians
% mu [DxK] - means of the K Gaussians
% sigma [DxDxK] - covariances of the K Gaussians
K = length(prior);
[D,N] = size(X);
% Compute joint probabilities p(Ck,xn)
for k=1:K,
  lnpi(k) = log(prior(k)) - 0.5*log(det(2*pi*sigma(:,:,k)));
  prec = inv(sigma(:,:,k));
  for n=1:N,
    gamma(k,n)=exp(lnpi(k)-0.5*(X(:,n)-mu(:,k))?*prec*(X(:,n)-mu(:,k)));
  end
end
% Normalize
gamma = gamma ./ repmat(sum(gamma),[K,1]);