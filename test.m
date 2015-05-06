C = [1 2 3 4];

if max(C(:)) < 2
    colormap([0.5 0.25 0 ; 0 0.8 1]);
elseif max(C(:)) >= 2 && max(C(:)) < 3
    colormap([0.5 0.25 0 ; 0 0.8 1 ; 0 0.5 0.65]);
elseif max(C(:)) >= 3
    colormap([0.5 0.25 0 ; 0 0.8 1 ; 0 0.5 0.65 ; 0 0.2 0.3]);
end

% whatever to make your plot
imagesc(C);

% display a colorbar
cb_ax = colorbar;

% label it appropriately
% set(cb_ax, 'YTick', [1:4]*3/4+5/8, 'YTickLabels', {'A', 'B', 'C', 'D'});