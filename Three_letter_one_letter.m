function X = Three_letter_one_letter(Y)
Three_letter = {'arg';'asn';'asp';'asx';'cys';'glu';'gln';'glx';...
    'gly';'his';'ile';'leu';'lys';'met';'phe';'pro';'ser';'thr';...
    'trp';'tyr';'val'};
One_letter = {'R';'N';'D';'B';'C';'E';'Q';'Z';'G';'H';'I';'L';...
    'K';'M';'F';'P';'S';'T';'W';'Y';'V'};

if ismember(Y,One_letter) == 1
    
    x = strfind(One_letter,Y);
    ind = find(~cellfun(@isempty,x)) ;
    X = Three_letter{ind};
    fprintf('The three letter abb of the aminoacid is %d \n',X)
    
elseif   ismember(Y,Three_letter) == 1
    x = strfind(Three_letter,Y);
    ind = find(~cellfun(@isempty,x)) ;
    X = One_letter{ind};
    fprintf('The one letter abb of the aminoacid is %d \n',X)
else
    ismember(Y,Three_letter) == 0 & ismember(Y,One_letter) == 0
    
    fprintf('your desired Aminoacid name is not on the list \n or you may have the wrong name')
end
end
