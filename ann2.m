    a= rand(1,1000);
    b=rand(1,1000);
    
    y=a*5+b*5;
    I=[a; b;];
    O=y;
    R=[0 1; 0 1 ;];
    S=[5 1];
    net = newff([0 1;0 1; ],S,{'tansig','purelin'});
    net=train(net,I,O);
    O1=sim(net,I);
    plot(1:1000,O,1:1000,O1);
    scatter(O,O1);