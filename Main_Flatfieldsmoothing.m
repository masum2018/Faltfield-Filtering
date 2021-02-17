%Monirul, 08/05/2020
%{
Idea box:
1. Perform filtering: Median, after FFT, cut higher frequency
2. Perform polyfit of each line and make it works
%}
close all;clear;close all;
set(0,'defaultfigurecolor',[1 1 1]);
set(0,'defaultAxesXLimSpec', 'tight');

%% load file
load('C:\Gamma\65MP\A12345678\Calibration Files\FlatfieldCalibrationImage.mat');
Image=FlatfieldImage; clear FlatfieldImage;

%% Perform low pass filtering

%Before filter
Red=Image(:,:,1);
Green=Image(:,:,2);
Blue=Image(:,:,3);

% figure,
% plot(Red(:, size(Red,2)/2),'r');hold on;
% plot(Green(:, size(Red,2)/2),'g');hold on;
% plot(Blue(:, size(Red,2)/2),'b');hold off;
% title('Vertical');
% 
% figure,
% plot(Red(size(Red,1)/2,:),'r');hold on;
% plot(Green( size(Red,1)/2,:),'g');hold on;
% plot(Blue(size(Red,1)/2,:),'b');hold off;
% title('Horizontal');
nSize=10;
RedFilt10= medfilt2(Red,[nSize nSize],'symmetric');

nSize=20;
RedFilt20= medfilt2(Red,[nSize nSize],'symmetric');

nSize=30;
RedFilt30= medfilt2(Red,[nSize nSize],'symmetric');

nSize=50;
RedFilt50= medfilt2(Red,[nSize nSize],'symmetric');

nSize=100;
% RedFilt100= medfilt2(Red,[nSize nSize],'symmetric');
figure,
plot(Red(size(Red,1)/2,:),'k');hold on;
plot(RedFilt10(size(Red,1)/2,:),'r');hold on;
plot(RedFilt20(size(Red,1)/2,:),'b');hold on;
plot(RedFilt30(size(Red,1)/2,:),'m');hold on;
% plot(RedFilt100(size(Red,1)/2,:),'c');hold on;
plot(RedFilt50(size(Red,1)/2,:),'g');hold off;
legend('No filter','Filter 10', 'Filter 20','Filter 30','Filter 50');
xlabel('Pixels');ylabel('# Counts')

RowNumber=3000;
figure,
plot(Red(RowNumber,:),'k');hold on;
plot(RedFilt10(RowNumber,:),'r');hold on;
plot(RedFilt20(RowNumber,:),'b');hold on;
plot(RedFilt30(RowNumber,:),'m');hold on;
plot(RedFilt50(RowNumber,:),'g');hold off;
legend('No filter','Filter 10', 'Filter 20','Filter 30','Filter 50');
xlabel('Pixels');ylabel('# Counts')

