function output = metadatafun(x)
info = imfinfo(x);
q = strfind(info.ImageDescription, "Date=");
a = strfind(info.ImageDescription, "2016");
a = a(1);
z = q:(a+3);
IDinfo = info.ImageDescription;
output = struct('bitdepth' , info.BitDepth, 'size', info.FileSize, 'date', IDinfo(z));
