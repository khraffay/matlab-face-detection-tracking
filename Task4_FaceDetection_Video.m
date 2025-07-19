% Specify the path to your video file
videoFile = 'C:\Users\Computer\Desktop\matlab project\visionface.avi.mp4';

% Create a VideoReader object
videoReader = VideoReader(videoFile);

% Create a video player object
videoPlayer = vision.VideoPlayer('Position', [100, 100, 680, 520]);

% Create a face detector object
faceDetector = vision.CascadeObjectDetector();

% Process each frame of the video
while hasFrame(videoReader)
    % Read the current frame
    frame = readFrame(videoReader);
    
    % Detect faces in the current frame
    bbox = step(faceDetector, frame);
    
    % Display the frame with bounding boxes around detected faces
    if ~isempty(bbox)
        annotatedFrame = insertObjectAnnotation(frame, 'rectangle', bbox, 'Face');
        step(videoPlayer, annotatedFrame);
    else
        step(videoPlayer, frame);
    end
end

% Release the video reader and player objects
release(videoReader);
release(videoPlayer);
