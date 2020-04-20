# Calculation-of-Feature-Volumes-of-Biofilms

The purpose of this code is to return Volume Images and their sums from a dataset of intensity images on an OMERO server into Matlab. In this instance, a Volume Image is a single xy plane, with each xy location containing the number of the highest z-section segmented in the original intensity image. The sum of this gives the total feature volume of the image. The original use was for detailing the feature volumes of images of bacterial biofilms, but it will conceptually work for any volumetric intensity image of reasonable dynamic range.

[volumes, volSum]= volumeUnderBiofilm(session, dsId);

where 'session' is an active OMERO session object created as a global variable, and dsId is the ID of a dataset on the OMERO server containing XYZ intensity images. Only the first intensity channel will be analysed.

The output 'volumes' is a cell array of planes with the same xy dimensions as the original intensity images.

The output 'volSum' is a vector of the sums of the Volume Images, containing one value per original intensiy image.

This code requires a working OMERO.matlab toolkit with an active OMERO.client and a (globally declared) session object for the server hosting the intensity images. OMERO.matlab is available from https://www.openmicroscopy.org/omero/downloads/ and full instructions for connecting to a server can be found at https://docs.openmicroscopy.org/omero/5.6.1/developers/Matlab.html
