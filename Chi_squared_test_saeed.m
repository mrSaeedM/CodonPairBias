close all
clear all
clc
format shortG
alpha = 0.01/(21*21);
% Critical_values = [10.83 13.82 16.27 18.47 20.52 22.46 24.32 26.13 27.88 29.59...
%     31.26 32.91 34.53 36.12 37.70 39.25 40.79 42.31 43.82 45.32 46.80 48.27 49.73...
%     51.18 52.62 54.05 55.48 56.89 58.30 59.70 61.10 62.49 63.87 65.25 66.62 67.99];

 Critical_values = chi2inv(1-alpha,1:36);
T1 = readtable('Clostridium sporogenes codon pair calculations.xlsx');
% T1=T1(strcmp(T1.Group_codon,'AA'),:)

Observed = T1.Fraction;
Expected = T1.Multiplied_fractions;
[I,G]=findgroups(T1.Group_codon);
P_values=nan*ones(size(T1,1),1);

for i=1:length(G)
    deg_free1(i,1) = sum(I==i)-1;
    a = T1.SPECIES(I==i);
    b = cell2mat(a);
    c=reshape(b,[size(a,1)*2,3]);
    deg_free(i,1)=length(unique(cellstr(c)))-2;
    
    
    N= sum(T1.PerMillion(I==i))*34.895366;
    if deg_free(i)==0
        CV = 0;
    else
        CV = Critical_values(deg_free(i));
    end
    Chi2_Val(i,1) = sum(((Observed(I==i)-Expected(I==i)).^2)./Expected(I==i))*N;
%     [CV Chi2_Val(i,1)]
    P_values(I==i,1) = 1-chi2cdf(Chi2_Val(i,1),deg_free(i));
    if Chi2_Val(i) >= CV
        Conclusion(I==i) = {'Null H REJECTED'};
    else
        Conclusion(I==i) = {'Null H ACCEPTED'};
    end
end
Conclusion=Conclusion';
Fraction_Ratio = T1.Fraction./T1.Multiplied_fractions;
T2 = [T1 table(P_values,Conclusion,Fraction_Ratio)];
writetable(T2,'Clostridium sporogenes codon pair Chi_squre test results.xlsx','Sheet',1);

T_result=T2(strcmp(T2.Conclusion,'Null H REJECTED'),:);
size(unique(T_result.Group_codon))
21*21