clear all;
for i=1:10
     k=imread(strcat('og/',string(i),'.bmp'));
     kmeansresult=Kmeans(k);
     otsuresult=Kmeans(k);
     kg=imread(strcat('og/',string(i),'.bmp'));
     kg=rgb2gray(kg);
     kg=im2double(kg);
     kmeanes=immse(kmeansresult,kg);
     ostures=immse(otsuresult,kg);
     imwrite(kmeansresult,strcat('kmeans_results/',string(i),'.bmp'));
     imwrite(otsuresult,strcat('otsu_results/',string(i),'.bmp'));
     temp=[ostures,kmeanes];
     disp(temp);
         
end 
 


function result=utsu(img)
    T=graythresh(img);
    result=im2bw(img,T);
end 
function result=Kmeans(img)
     img=rgb2gray(img);
     img=im2double(img);
     J = reshape(kmeans(img(:),2),size(img));
     J=1-J;
     J=1-abs(J);
     result=J;
end 
