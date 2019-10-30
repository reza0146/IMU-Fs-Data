clc
clear
%%
% reading the files and converting them from binary format
for i = 1:19
    [a,b] = Convert_MPU6050_Binary();
    c(i) = {a};
end
%%
%finding the beginning points
for i = 17:19
    data = c{i};
    for j = 1:2
        fig = figure;
        plot(data(:,6))
        dcm_obj = datacursormode(fig);
        set(dcm_obj,'Enable','on')
        pause
        c_info = getCursorInfo(dcm_obj);
        click = c_info.Position;
        if j == 1 
            xone = click(1);
        else
            xtwo = click(1);
        end
        close(fig)
    end  
    dif(i) = xtwo - xone;
end
%%
fs(1:10) = dif(1:10)/10;
fs(11:13) = dif(11:13)/60;
fs(14:16) = dif(14:16)/300;
fs(17:19) = dif(17:19)/600;
%%
%calculating standard error
sd = std(fs);
se = sd/sqrt(19);
m = mean(fs);





