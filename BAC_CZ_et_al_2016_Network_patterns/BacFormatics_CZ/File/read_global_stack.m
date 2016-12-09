function read_global_stack(vec)
global box_Raw

if vec(1)==1
    choice = questdlg('Do you want to load binary stack file to memory?','Hello User','Yes','No','Yes');
    switch choice
        case 'Yes'
            h=waitbar(0,'reading stack file to memory ....');
            set(h,'color','w');
            global Ch00_stack_Segmented
            Ch00_stack_Segmented=[];
            for ii=1:size(box_Raw,1)
                waitbar(ii/size(box_Raw,1))
                temp=read_image(ii,3);
                eval(strcat('Ch00_stack_Segmented(',num2str(ii),').cdata= temp;'))
            end
            close(h)
    end
end
if vec(2)==1
    msgbox('read global from filtered channel is not supported')
end
if vec(3)==1
    choice = questdlg('Do you want to load raw-phase contrast stack file to memory?', 'Hello User', 'Yes','No','Yes');
    switch choice
        case 'Yes'
            h=waitbar(0,'reading stack file to memory ....');
            set(h,'color','w');
            
            for ii=1:size(box_Raw,1)
                waitbar(ii/size(box_Raw,1))
                temp=double(read_image(ii,1));
                temp=uint8(255*(temp./max(temp(:))));
                eval(strcat('Ch00_stack_Raw(',num2str(ii),').cdata= temp;'))
            end
            close(h)
    end
end
