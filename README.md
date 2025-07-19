Real-Time Face Detection & Social Distance Tracking in MATLAB

This project implements a complete pipeline for face and person detection using MATLAB, incorporating real-time webcam tracking, video annotation, and neural network classification. The system uses classic and deep learning approaches such as the Viola-Jones algorithm, ACF detector, Point Feature Tracking, and GoogleNet.



 Features & Tasks

 Task 1: Face Detection and Image Labeling
Detects and labels human faces in static images using MATLAB's `CascadeObjectDetector`.

 Task 2: Person Detection in Images
Uses `vision.PeopleDetector` to locate and annotate humans in a scene with confidence scores.

 Task 3: Social Distance Tracking Assistant
Detects multiple people in a video and highlights if two people are too close (less than a safe threshold). Violations are shown in red, while safe individuals are shown in green.

 Task 4: Face Tracking and Detection in Video
Applies face detection to pre-recorded video using a bounding box overlay, enabling object annotation frame-by-frame.

 Task 5: Real-Time Face Detection and Tracking
Streams video from webcam, detects and tracks face features using point tracking, and performs classification using a pre-trained GoogleNet deep learning model.



 Tech Stack

 MATLAB R2021 or later
 Computer Vision Toolbox
 Deep Learning Toolbox
 Pre-trained GoogleNet (included via `googlenet`)




 Requirements

 Webcam connected
 MATLAB installed with required toolboxes
 


 Sample Output

 Bounding boxes for detected faces
 Real-time classification overlays
 Annotated videos with social distancing tags



 Skills Applied

 Computer Vision
 Real-Time Systems
 Object Detection
 Deep Learning (GoogleNet)
 MATLAB Programming



 Author

**Khawaja Abdul Raffay**  
GitHub: [@khraffay](https://github.com/khraffay)
