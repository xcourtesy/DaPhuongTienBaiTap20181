% Bai Tap Tuan 1 - Da Phuong Tien
% Hoc Ki 20181 - DH Bach khoa Ha Noi
% Sinh Vien: Nguyen Xuan Luu
% MSSV: 20152346
% Lop: Dien Tu 8 - K60


%% 1. Ghi Am file wave

% Tan so lay mau: 48000 Hz
% Kich thuoc mau: 16 bit/sample
% So kenh: 1 channel

r = audiorecorder(48000, 16, 1);

% Ghi am Ho Ten, So Hieu Sinh Vien, Lop, Khoa

record(r);
%%
% Ket thuc ghi am 
stop(r);
%%
% Lay Du lieu
orig = getaudiodata(r,'double');
% Luu file wave
%wavwrite(orig,48000,16,'orig_input.wav');
%% 2. Tao Giai Dieu bang cach tang tan so lay mau tu 48000 len 96000

rd = wavread('orig_input.wav');
%wavwrite(rd,96000,16,'melody.wav');

%% 3. FFT file melody.wav
rd = wavread('melody.wav');
plot(rd);figure;
fs = 96000; % Tan so lay mau
N = fs; % FFT N diem
transform = fft(rd,N)/N; % Chuan hoa 
magTransform = abs(transform); % Lay bien do

faxis = linspace(-fs/2,fs/2,N); % Tao tin hieu truc tan so
plot(faxis,fftshift(magTransform),'r'); % Ve pho FFT
xlabel('Frequency (Hz)');
title('FFT of melody.wav');

%% 4. Spectrogram file melody.wav
rd = wavread('melody.wav');
fs = 96000; %Tan so lay mau
win = 128; % do rong khung cua so lay mau
% so mau giua hai cua so
hop = win/2 ;           

nfft = win; % do rong khung tan so
spectrogram(rd,win,hop,nfft,fs,'yaxis');
title('Spectrogram of file melody.wav')




