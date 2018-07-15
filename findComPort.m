% Run this script first without Arduino connected
% Follow instructions
% Note COM port for Arduino

serialInfo = instrhwinfo('serial');
comPorts = serialInfo.AvailableSerialPorts;

disp('Current COM ports connected without Arduino:');
if ~isempty(comPorts)
    disp(comPorts);
else
    disp('No COM ports');
end
input('Connect Ardiuno and press enter');

serialInfo = instrhwinfo('serial');
newComPorts = serialInfo.AvailableSerialPorts;
arduinoCOM = setxor(comPorts,newComPorts);
disp('Arduino COM port: ');
disp(arduinoCOM);

