function cr = imratio(f1, f2)
%IMRATIO Compute the ratio of the bytes in two images/variables
% reference: DIPUM
% 2016-11-16
cr = bytes(f1) / bytes(f2);


%------------------
function b = bytes(f)
% Return the number of bytes in input f.
% If f is a string, assume that it is an image filename;
% othwise, it is an image variable.
if ischar(f)
    info = dir(f);
    b = info.bytes;
elseif isstruct(f)
    b = 0;
    fields = fieldnames(f);
    for k = 1:length(fields)
        b = b + bytes(f.(fields{k}));
    end
else
    info = whos('f');
    b = info.bytes;
end
