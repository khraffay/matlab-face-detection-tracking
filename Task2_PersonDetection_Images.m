% Clear command window, workspace, and close all figures
clc
clear all 
close all

% Turn off unnecessary warnings
warning off

% Read the image
x = imread('5.jpg');
imshow(x);

% Initialize PeopleDetector
peopleDetector = vision.PeopleDetector;

% Detect people in the image
[bboxes, scores] = peopleDetector(x);

% Display the results
if(sum(sum(bboxes)) ~= 0)
    I = insertObjectAnnotation(x, 'rectangle', bboxes, scores);
    imshow(I);
    title('Detected People and Detection Scores');
else
    imshow(x);
    title('No People Detected');
end
