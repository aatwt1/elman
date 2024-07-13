p=0:0.5:10;
t=(1/4).*(p.*(p<=4)+4*((p>4) & (p<=6)) + (10-p).*((p>6) & (p<=10)));
P=p;
T=t;
Pseq=con2seq(P);
Tseq=con2seq(T);
net=newelm(minmax(P),[40 1],{'tansig','purelin'}, 'traingdx');
net.trainParam.epochs=2500;
net.trainParam.show=50;
net.trainParam.goal=1e-7;
tic
[net,tr]=train(net,Pseq,Tseq);
toc
a=sim(net,Pseq);
b=cat(2,a{:});
time=1:length(p);
plot(time,t,'b--',time,b,'r')

grid on
title('Rezultati');
xlabel('vrijeme');
ylabel('izlazne vrijednosti')
legend('funkcija','neuronska mreza')