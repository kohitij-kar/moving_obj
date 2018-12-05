function createMovie(varargin)
% use this function to create movies of moving objects with the images
% provided. 
% use: createMovie('targetDirectory', '~/Documents/','filename','movie1.avi', 'sequenceNumber',2);;
p=inputParser;
p.addParameter('sequenceNumber',1,@isnumeric);
p.addParameter('targetDirectory',[],@isstr);
p.addParameter('filename','movie.avi',@ischar);
p.parse(varargin{:});
sequenceNumber = p.Results.sequenceNumber;
targetDirectory = p.Results.targetDirectory;
filename = p.Results.filename;
%%
images = cell(18,1);
for i = 1:18
    images{i} = repmat(imread(['im',num2str(18*sequenceNumber-19 +i),'.png']),1,1,3);
end

%%
% create the video writer with 60 fps
 writerObj = VideoWriter([targetDirectory,filename]);
 writerObj.FrameRate = 60;

 % open the video writer
 open(writerObj);
 % write the frames to the video
 
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u});
%      for v=1:length(images) 
         writeVideo(writerObj, frame);
%      end
 end
 % close the writer object
 close(writerObj);