%Inclass asssignment 6. 

%1. a. Write a function which takes as inputs: a. a cell array of names. b.
% an array of numbers with the ages corresponding to the names, and c. a binary
% variable which is a P/F grade (true for pass) and returns a structure
% array called students with one structure storing this information for each student. 

function [ names ] = names(varargin)
student=struct('name',[varargin]);
names=struct2array(student);
%students=extractfield(student,'name')
nargin
end

function [ ages ] = ages( varargin )
student=struct('age',[varargin]); %si son números, A WEBO los tienes que poner en brackets, si no, no serán números ¬¬
ages=struct2array(student);
nargin
end

function [ grades ] = grades( varargin )
student=struct('grade',[varargin]);
grades=struct2array(student);
nargin
if (grades~= 'f') & (grades~='p')
    error('Only input f or p');
end
end

name=names('John','Danny','Jack');
age=ages(30,23,45);
grade=grades('p','p','f');

students.name=name;
students.age=age;
students.grade=grade;

students

%for a function that stores all 3 data at the same time for 1 student
function [students]= f6a(a,b,c)
student.name=a;
student.age=b;
student.grade=c;
if nargin~=3
    error('You must input: name, age, grade');
end
if (c~= 'f') & (c~='p')
    error('Only input f or p');
end
students=student(:);
end

f6a('John',23,'p')

%2. Write a function which takes your structure array of students as input and returns
% the average age of the students. 

function [ ages ] = average( students )
ages=mean(students.age);
end

average(students)

%2. In this folder, you will find an immunofluorescence image of human stem
%cells stained for a gene called SOX2. Write a function which takes a
%filename as input and returns a structure containing metaData. Include at
%least the bitdepth, size, and date the image was taken. Do not include any
%information you do not understand. Hint: use the builtin function imfinfo

%img=imread('160611-AntiNodal-SD20x_f0003_w0002.tif');
%imshow(img(:,:,1),[])
%size(img);

function [ nmeta ] = meta( a )
bfopen(a);
metaData=imfinfo(a);

nmeta.date=metaData.FileModDate;
nmeta.size=metaData.FileSize;
nmeta.w=metaData.Width;
nmeta.h=metaData.Height;
nmeta.bits=metaData.BitDepth;
end

meta('160611-AntiNodal-SD20x_f0003_w0002.tif')

%b. Look at the field ImageDescription in the output of imfinfo - there is
%a lot of information here. Write code that gets the actual temperature
%from the camera out of this field. (Hint: it is preceded by the words
%"Actual Temperature" which don't appear anywhere else in
%ImageDescription). 

imgbf=bfopen('160611-AntiNodal-SD20x_f0003_w0002.tif');
info=imfinfo('160611-AntiNodal-SD20x_f0003_w0002.tif');
x=info.ImageDescription;
xi=strfind(x,'Actual Temperature');
xf=strfind(x,'Cooling');
AT=x(xi:xf)
