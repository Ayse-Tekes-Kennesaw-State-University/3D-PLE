clear all
a=arduino(serialportlist("available"),'Uno','Libraries','rotaryEncoder');
encoder = rotaryEncoder(a,'D2','D3');
CPR = 2400; %Counts per revolution of the encoder. (empirically tested)
y =360/CPR; %Angle per count

tmax=20; 
figure
grid on;

k=0;
v=0;
t=0;
resetCount(encoder);
tic
while toc<=tmax
    k=k+1;
    temp=0;
    temp=readCount(encoder);
    temp=temp+readCount(encoder);
    temp=temp+readCount(encoder);
    v(k)=temp/3*y;
    t(k)=toc;
    
    if k>1
        line([t(k-1) t(k)],[v(k-1) v(k)]);
        drawnow;
    end
end