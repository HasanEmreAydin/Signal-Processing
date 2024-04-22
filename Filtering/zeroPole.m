pkg load signal

% transfert  function of the system is :
 
%        B(z)    b0+b1z^{-1}+b2z^{-2}
% H(z)= ----- = ----------------------
%        A(z)    a0+a1z^{-1}+a2z^{-2}
 
% Coefs of numerator  in power of  z^{-1}
b0 =  1;
b1 =  0.5;
b2 = -1;
 
%  Coefs of denominator  in power of  z^{-1}
a0 =  1;
a1 =  0;
a2 = 0.81;
 
B=[b0 b1 b2]; % Numerator of transfer function 
A=[a0 a1 a2]; % Denominator of transfer function  
 

%        B(z)    
% H(z)= -----
%        A(z)
 
 
% The function roots computes the roots of a polynomial
Z=roots(B)         % Zeros of the transfer function
P=roots(A)         % Poles  of the transfer function
 
% Representation of zeros/poles in the complex plan
figure
zplane(Z,P)  % Draw zeros and poles
title ('Zeros and poles of the transfer function')
legend('zeros','poles')
grid on
 
% Representations of the impulse response of the system
figure
impz(B,A)    % Draw the impulse response
title ('Impulse response')
xlabel('Sample (n)')
grid on
 