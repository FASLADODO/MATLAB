x = 16.625; 
dist = mod(x, 0.5); 
floorVal = x - dist; 
newVal = floorVal; 
if dist >= 0.25, newVal = newVal + 0.5; end
newVal