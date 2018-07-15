% Run findComPort first
% After running findComPort.m, change COM port
s = serial('COM3'); % creates serial object
fopen(s); % connects to serial object

model = [];
disp('sample');
str = input('Input: ','s');
while str ~= 'q'
    fwrite(s,'u'); % writes letter to Arduino
    pause(0.2);
    while s.bytesAvailable > 0  % recieve data from Arduino
        sample = fscanf(s);     %
        index = find(sample == ' ');                 % parce string for number
        sensorVal = str2double(sample(index+1:end)); %
        disp(sensorVal);
        model = [model sensorVal];
        y = genSound([sensorVal*30 1],0.3);
        sound(y,8000);
        pause(0.1);
    end                         %
end
plot(model); % plots the characterisation of the sensor
fclose(s); % disconnects serial connection
delete(s); % deletes serial object
