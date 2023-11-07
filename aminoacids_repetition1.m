function Aminoacids_abundancy = aminoacids_repetition1(filename)
[~,orfs] = fastaread(filename);
Family_group = {'Ala','Ala','Ala','Ala','Arg','Arg','Arg','Arg',...
    'Arg','Arg','Asn','Asn','Asp','Asp','Cys','Cys','Gln','Gln',...
    'Glu','Glu','Gly','Gly','Gly','Gly','His','His','Ile','Ile',...
    'Ile','Leu','Leu','Leu','Leu','Leu','Leu','Lys','Lys','Met',...
    'Phe','Phe','Pro','Pro','Pro','Pro','Ser','Ser','Ser','Ser',...
    'Ser','Ser','Thr','Thr','Thr','Thr','Trp','Tyr','Tyr','Val',...
    'Val','Val','Val','Asx','Asx','Asx','Asx','Glx','Glx','Glx',...
    'Glx'};
Family_group = Family_group';
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

Family = {Ala;Arg;Asn;Asp;Cys;Gln;Glu;Gly;His;Ile;Leu;Lys;...
    Met;Phe;Pro;Ser;Thr;Trp;Tyr;Val;Asx;Glx};
SUM = zeros(length(cat(1,Family{:})),1);
Freq = zeros(length(cat(1,Family{:})),1);
k = 1;
for j=1:length(Family)
    for i=1:length(orfs)
        Single_codon_Sequence = Find_single_codon_sequence(orfs{i});
        COUNT = countmember(Family{j},Single_codon_Sequence);
        SUM(k:k+length(Family{j})-1,1) = SUM(k:k+length(Family{j})-1,1) + COUNT;
    end
    Freq(k:k+length(Family{j})-1,1) = SUM(k:k+length(Family{j})-1,1)./sum(SUM(k:k+length(Family{j})-1,1)).*100;
    k = k+length(Family{j});
end
Family = cat(1,Family{:});
Aminoacids_abundancy = table(Family_group,Family,SUM,Freq);
end