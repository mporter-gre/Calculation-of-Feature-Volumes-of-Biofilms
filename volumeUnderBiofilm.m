function [volumes, volSum]= volumeUnderBiofilm(session, dsId)

% Copyright (C) 2013-2020 University of Dundee & Open Microscopy Environment.
% All rights reserved.
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License along
% with this program; if not, write to the Free Software Foundation, Inc.,
% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

[~, imageIds]= getImageIdsAndNamesFromDatasetIds(dsId);
for thisImage = 1:length(imageIds)
    tic;
    disp(thisImage);
    stack = getStack(session, imageIds(thisImage), 0, 0);
    
    [sizeY, sizeX, sizeZ] = size(stack);
    stackSeg = logical(seg3D(double(stack), 0, 1, 0));
    vol = zeros(sizeY, sizeX);
    
    for y = 1:sizeY
        oSliceSeg = flip(squeeze(stackSeg(y, :, :))');
        for x = 1:sizeX
            vec = oSliceSeg(:, x);
            idx = find(vec, 1);
            if idx
                vol(y, x) = sizeZ-idx;
            end
        end
    end
    
    volumes{thisImage} = vol;
    volSum(thisImage) = sum(sum(vol));
    toc;
end

volSum = volSum';