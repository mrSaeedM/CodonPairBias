clc
clear all

filename = 'Clostridium_sporogenes_strain_NCIMB_10696.cds';
ORFs = Read_ORFs(filename,300);

for i=1:1%length(ORFs)
Single_codon_sequence{i} = Find_single_codon_sequence(ORFs{i});
% Paired_codon_sequence{i} = Find_paired_codon_sequence(ORFs{i});
% Triple_codon_sequence{i} = Find_triple_codon_sequence(ORFs{i});
codon_to_aminoacid(Single_codon_sequence{i})
end

% All_64times64_codons=All_paired_codons;
% All64times64times64_codons = All_triple_codons;
% 
% aminoacids_repetition(filename)