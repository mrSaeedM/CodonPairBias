function Single_codon_Sequence = Find_single_codon_sequence(orf)
% [~,orfs] = fastaread('Clostridium_sporogenes_strain_NCIMB_10696.cds');
        A = orf;
        A = num2cell(A);
        k=1;
    for j=1:length(orf)/3
        B = A(k:k+2);
        Single_codon_Sequence{j} = strcat(B{1},B{2},B{3});
        k = k+3;
    end
end