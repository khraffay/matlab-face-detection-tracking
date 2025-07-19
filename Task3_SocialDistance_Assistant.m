% Initialize Video Reader and Player
videoReader = vision.VideoFileReader('vtest.avi');
videoPlayer = vision.VideoPlayer('Position', [300 100 1000 500]);

% Initialize ACF Object Detector
detector = peopleDetectorACF('caltech-50x21');

% Create Video Writer for Result Visualization
WriterObj = VideoWriter('nnnewvision.mp4');
WriterObj.FrameRate = 8;
open(WriterObj);

% Process Each Frame
while ~isDone(videoReader)
    frame = step(videoReader);
    I = double(frame);

    % Detect people using ACF Object Detector
    [bboxes, scores] = detect(detector, I);

    % Initialize condition variable
    cond = zeros(size(bboxes, 1), 1);

    % Check for potential unsafe distances
    if ~isempty(bboxes)
        for i = 1:(size(bboxes, 1)-1)
            for j = (i+1):(size(bboxes, 1)-1)
                dis1_v = abs(bboxes(i, 1) + bboxes(i, 3) - bboxes(j, 1));
                dis2_v = abs(bboxes(j, 1) + bboxes(j, 3) - bboxes(i, 1));
                dis1_h = abs(bboxes(i, 2) - bboxes(j, 2));
                dis2_h = abs(bboxes(i, 2) + bboxes(i, 4) - bboxes(j, 2) - bboxes(j, 4));

                if ((dis1_v < 50 || dis2_v < 50) && (dis1_h < 50 || dis2_h < 50))
                    cond(i) = cond(i) + 1;
                    cond(j) = cond(j) + 1;
                else
                    cond(i) = cond(i) + 0;
                end
            end
        end
    end

    % Annotate potentially unsafe distances and display annotated frame
    I = insertObjectAnnotation(I, 'rectangle', bboxes((cond > 0), :), 'danger', 'color', 'r');
    I = insertObjectAnnotation(I, 'rectangle', bboxes((cond == 0), :), 'safe', 'color', 'g');
    
    % Display the annotated frame using Video Player
    step(videoPlayer, I);
    
    % Write annotated frame to Video Writer
    frame = im2frame(I);
    writeVideo(WriterObj, frame);
end

% Release resources
release(videoReader);
release(videoPlayer);
close(WriterObj);
Error using vision.VideoFileReader
Invalid input file.
