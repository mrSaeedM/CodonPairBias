function All_64by64_codons = All_paired_codons()
DNA_Elements = {'A' 'T' 'G' 'C'};
[M,~] = permn(DNA_Elements,3);
for i=1:length(M)
    codon{i} = strcat(M{i,1:3});
end

ind =1;
for i=1:length(codon)
    for j=1:length(codon)
        All_64by64_codons(ind) = strcat(codon(i),codon(j));
        ind=ind+1;
    end
end

















