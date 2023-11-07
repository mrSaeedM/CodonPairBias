function Aminoacids_abundancy = aminoacids_repetition(filename)
[~,orfs] = fastaread(filename);
load('amino_acid.mat')
SUM = 0;
for i=1:length(orfs)
    Single_codon_Sequence = Find_single_codon_sequence(orfs{i});
    COUNT = countmember(Codon,Single_codon_Sequence);
    SUM = SUM + COUNT;
    Freq = SUM/sum(SUM)*100;
end
Aminoacids_abundancy = table(Aminoacid,SUM,Freq);
end
