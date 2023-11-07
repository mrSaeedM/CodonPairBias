function [A,T,C,G] = nucleotide_abundancy(filename)
% too see all the outputs of this function use '[A,T,C,G] = ' before you
% enter the functions name
[~,orfs] = fastaread(filename);
t = 0;
a = 0;
c = 0;
g = 0;
for i=1:length(orfs)
    A = orfs{i};
    A = num2cell(A);
    for j=1:length(A)
        switch A{j}
            case 'T'
                t = t+1;
            case 'A'
                a = a+1;
            case 'C'
                c = c+1;
            case 'G'
                g = g+1;
        end
    end
end
T = t/(t+a+c+g)*100; G = g/(t+a+c+g)*100;
A = a/(t+a+c+g)*100; C = c/(t+a+c+g)*100;
end



