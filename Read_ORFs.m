function required_orfs = Read_ORFs(filename,x)

[~,orfs] = fastaread(filename);
j = 1;
for i = 1:length(orfs)
    if length(orfs{1,i}) >= x
        required_orfs{1,j} = orfs{1,i};
        j = j+1;
    end
end
end