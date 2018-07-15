[y1] = genSound([1000 10],1);
[y2] = genSound([2000 1],2);
[y3] = genSound([500 100],1);
[y4] = genSound([500 10; 2000 10],1);
[y5] = genSound([100 1; 200 1],1);

y = [y1 y2 y3 y4 y5];

sound(y,8000);
plot(y);