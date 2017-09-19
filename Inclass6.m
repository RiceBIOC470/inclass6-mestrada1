%Inclass asssignment 6. 

%1. a. Write a function which takes as inputs: a. a cell array of names. b.
% an array of numbers with the ages corresponding to the names, and c. a binary
% variable which is a P/F grade (true for pass) and returns a structure
% array called students with one structure storing this information for each student. 2. Write a
% function which takes your structure array of students as input and returns
% the average age of the students. 

%1. Function for part 1 written below and included in separate file:

function output = structarray(x,y,z)
students = struct('name', x, 'age', y, 'PassFail', z);
output=students; 

%Code to get students structure array written below:
x = {'John Smith', 'Cindy Row', 'Jack Daniels'};
y = {24, 22, 21};
z = {'TRUE', 'FALSE', 'TRUE'};
 
students = structarray(x,y,z);

%2. Function for part 2 written below and included in separate file:
function output = average_age_str(x)
for ii = 1:length(x)
    student_age = x(ii).age;
    agevector(ii) = student_age;
end 
output = sum(agevector)/(length(x));

%Code showing average age of students structure array:
average_age_str(students)

ans =

   22.3333
  
%2. In this folder, you will find an immunofluorescence image of human stem
%cells stained for a gene called SOX2. Write a function which takes a
%filename as input and returns a structure containing metaData. Include at
%least the bitdepth, size, and date the image was taken. Do not include any
%information you do not understand. Hint: use the builtin function imfinfo
%b. Look at the field ImageDescription in the output of imfinfo - there is
%a lot of information here. Write code that gets the actual temperature
%from the camera out of this field. (Hint: it is preceded by the words
%"Actual Temperature" which don't appear anywhere else in
%ImageDescription). 

%2a. Function code written below and included in separate file: 

function output = metadatafun(x)
info = imfinfo(x);
q = strfind(info.ImageDescription, "Date=");
a = strfind(info.ImageDescription, "2016");
a = a(1);
z = q:(a+3);
IDinfo = info.ImageDescription;
output = struct('bitdepth' , info.BitDepth, 'size', info.FileSize, 'date', IDinfo(z));

%Code showing function creating metaData structure:
metaData = metadatafun('160611-AntiNodal-SD20x_f0003_w0002.tif');
metaData

metaData = 

  struct with fields:

    bitdepth: 16
        size: 2117720
        date: 'Date=11/06/2016'
        
%2b. Code exluding "Actual Temperature..." from
%ImageDescription

info = imfinfo('160611-AntiNodal-SD20x_f0003_w0002.tif');
q = strfind(info.ImageDescription, "Actual Temperature=");
a = strfind(info.ImageDescription, "Cooling=");
a = a - 3;
IDinfo = info.ImageDescription;
IDinfo(q:a) = [];
IDinfo;
