function Paired_codon_sequence = Find_paired_codon_sequence(orf)

% [~,orfs] = fastaread('Clostridium_sporogenes_strain_NCIMB_10696.cds');
% i = input('please enter your desired orf cell number: ');
A = orf;
A = num2cell(A);
i = 1;
k = 1;
while (i+5) <= length(A)
    B = A(i:i+5);
    Paired_codon_sequence{k} = strcat(B{1},B{2},B{3},B{4},B{5},B{6});
    i = i+3;
    k = k+1;
end

end