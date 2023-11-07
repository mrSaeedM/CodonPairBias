function [X] = aminoacid_family_to_codon(Y)
% Y is a character please insert it inside apostrophe
Ala = {'GCT';'GCC';'GCA';'GCG'};
Arg = {'GTC';'CGC';'CGA';'CGG';'AGA';'AGG'};
Asn = {'AAT';'AAC'};
Asp = {'GAT';'GAC'};
Cys = {'TGT';'TGC'};
Gln = {'CAA';'CAG'};
Glu = {'GAA';'GAG'};
Gly = {'GGT';'GGC';'GGA';'GGG'};
His = {'CAT';'CAC'};
Ile = {'ATT';'ATC';'ATA'};
Leu = {'TTA';'TTG';'CTT';'CTC';'CTA';'CTG'};
Lys = {'AAA';'AAG'};
Met = {'ATG'};
Phe = {'TTT';'TTC'};
Pro = {'CCT';'CCC';'CCA';'CCG'};
Ser = {'TCT';'TCC';'TCA';'TCG';'AGT';'AGC'};
Thr = {'ACT';'ACC';'ACA';'ACG'};
Trp = {'TGG'};
Tyr = {'TAT';'TAC'};
Val = {'GTT';'GTC';'GTA';'GTG'};
Asx = {'AAT';'AAC';'GAT';'GAC'};
Glx = {'CAA';'CAG';'GAA';'GAG'};


X = eval(Y);
end
