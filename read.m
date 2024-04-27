fileID = fopen('Test_Text_File.txt','r');
formatSpec = '%s';
A = lower(fscanf(fileID,formatSpec));
fclose(fileID);