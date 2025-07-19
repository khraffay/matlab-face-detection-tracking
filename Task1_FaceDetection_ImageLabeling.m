the_Image =imread('image_musk.jpg.jpeg');

[width, height] = size(the_Image);  

if width>320
the_Image = imresize(the_Image,[320 NaN]);
end

faceDetector = vision.CascadeObjectDetector();

face_Location = step(faceDetector, the_Image);

the_Image = insertShape(the_Image, 'Rectangle', face_Location);
figure; 
imshow(the_Image); 
title('Detected face');
