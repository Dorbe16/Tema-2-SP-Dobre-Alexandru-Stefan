%Semnal triunghiular, deoarece am numarul de ordine 12, care este par
P=40;  % Perioada semnalului
w=2*pi/P; 
D=12;  % Durata semnalului dreptunghiular (am ales D in functie de numarul meu de ordine)
rezolutie=1/10; 
% Rezolutie aleasa ca sa avem imagine mai exacta, dar si sa nu avem timp de rulare foarte mare
t = -2*P:rezolutie:2*P;
sgn=my_sgn(t);
% Semnalul dreptunghiular este format doar din valori de 1 si 0 asa ca am
% facut 4 perioade una dupa alta pentru afisare

f = @(t) (my_sgn(t));
X0 = integral(f, 0, P);

xk = [];
for i = 1:10
    f = @(t) (my_sgn(t).*exp(-1j*w*t*i)); %Functia f(t)
    xk = [xk integral(f, 0, P)]; %La fiecare iteratie se adauga un nou xk in
    %vector, xk fiind integrala din f(t).
end

coef = [2*abs(fliplr(xk)) 2*X0 2*abs(xk)];
 %Determinarea coeficientilor dezvoltarii semnalului x(t) in SFC  
figure(1);
stem(-10:10, coef); %Afisarea spectrului


k = 1:10;
sgn2 = 1/P*(X0 + 2*xk*exp(1j*w*k'*t)); %Semnalul reconstruit
figure(2);
plot(t, sgn); %Afisarea semnalului initial
hold on;
plot(t, sgn2); %Afisarea semnalului reconstruit
hold off;

%Conform cursului de semnale si sisteme, orice semnal poate fi aproximat
%printr-o suma de cosinusuri si sinusuri de diferite frecvente (numite
%armonice de frecventa) fiecare avand in fata sa cate un coeficient.
%In acest proiect am reprezentat spectrul de valori.  
%Apoi am reconstruit un semnal cu 10 elemente care se apropie
%de semnalul original, avand o mica eroare. Daca numarul termenilor creste,
%aceasta eroare se diminueaza.
