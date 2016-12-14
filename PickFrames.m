function varargout = PickFrames(varargin)
% addpath('/home/rnsandeep/Desktop/new desktop january/Sem Project/English_Magazine_Imgs/pixellevel/differentsizes/images');
% GUI_1 MATLAB code for GUI_1.fig
%      GUI_1, by itself, creates a new GUI_1 or raises the existing
%      singleton*.
%
%      H = GUI_1 returns the handle to a new GUI_1 or the handle to
%      the existing singleton*.
%
%      GUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_1.M with the given input arguments.
%
%      GUI_1('Property','Value',...) creates a new GUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_1

% Last Modified by GUIDE v2.5 28-Apr-2016 11:52:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_1_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_1_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_1 is made visible.
function GUI_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_1 (see VARARGIN)

% Choose default command line output for GUI_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in text.
function text_Callback(hObject, eventdata, handles)

%img = imread([handles.currFrameFolder filesep handles.currFrameFiles(handles.currFileId).name]);
[~,rect]=imcrop;

%check the query word
if(get(handles.radiobutton1, 'Value')==0 && get(handles.radiobutton2, 'Value')==0 && get(handles.radiobutton3, 'Value')==0 ...
        && get(handles.radiobutton4, 'Value')==0 && get(handles.radiobutton5, 'Value')==0 && get(handles.radiobutton6, 'Value')==0 ...
        && get(handles.radiobutton7, 'Value')==0 && get(handles.radiobutton8, 'Value')==0 && get(handles.radiobutton9, 'Value')==0 ...
        && get(handles.radiobutton10, 'Value')==0 && get(handles.radiobutton11, 'Value')==0 && get(handles.radiobutton12, 'Value')==0 ...
        && get(handles.radiobutton20, 'Value')==0 && get(handles.radiobutton13, 'Value')==0)
    msgbox('Please select Query Text','Error');
    return
else
    switch get(get(handles.uipanel6,'SelectedObject'),'Tag')
        case 'radiobutton1'
            handles.currQueryText = get(handles.radiobutton1, 'String');
        case 'radiobutton2'
            handles.currQueryText = get(handles.radiobutton2, 'String');
        case 'radiobutton3'
            handles.currQueryText = get(handles.radiobutton3, 'String');
        case 'radiobutton4'
            handles.currQueryText = get(handles.radiobutton4, 'String');
        case 'radiobutton5'
            handles.currQueryText = get(handles.radiobutton5, 'String');
        case 'radiobutton6'
            handles.currQueryText = get(handles.radiobutton6, 'String');
        case 'radiobutton7'
            handles.currQueryText = get(handles.radiobutton7, 'String');
        case 'radiobutton8'
            handles.currQueryText = get(handles.radiobutton8, 'String');
        case 'radiobutton9'
            handles.currQueryText = get(handles.radiobutton9, 'String');
        case 'radiobutton10'
            handles.currQueryText = get(handles.radiobutton10, 'String');
        case 'radiobutton11'
            handles.currQueryText = get(handles.radiobutton11, 'String');
        case 'radiobutton12'
            handles.currQueryText = get(handles.radiobutton12, 'String');
        case 'radiobutton20'
            handles.currQueryText = get(handles.radiobutton20, 'String');
        case 'radiobutton13'
            listBoxString = get(handles.listbox1,'String');
            listBoxValue = get(handles.listbox1,'Value');
            handles.currQueryText = listBoxString{listBoxValue};
    end
    if(strcmp(handles.currQueryText,''))
        msgbox('Please select Query Text','Error');
        return
    end
end

switch get(get(handles.uipanel7,'SelectedObject'),'Tag')
    case 'radiobutton14'
        handles.occStatus = 0;
    case 'radiobutton15'
        handles.occStatus = 1;
    case 'radiobutton16'
        handles.occStatus = 2;
    otherwise
        msgbox('Error in occlusion status','Error');
        return
end

switch get(get(handles.uipanel8,'SelectedObject'),'Tag')
    case 'radiobutton17'
        handles.inflectStatus=0;
    case 'radiobutton18'
        handles.inflectStatus=1;
    otherwise
        msgbox('Error in inflection status','Error');
        return
end

[~,fName,~]= fileparts(handles.currFrameFolder);
%capture current annotation
handles.currAnnotation{handles.currAnnId,1} = [fName '_' num2str(handles.currAnnId)];
handles.currAnnotation{handles.currAnnId,2} = fName;
handles.currAnnotation{handles.currAnnId,3} = handles.currFrameFiles(handles.currFileId).name;
handles.currAnnotation{handles.currAnnId,4} = handles.occStatus;
handles.currAnnotation{handles.currAnnId,5} = handles.inflectStatus;

handles.currAnnotation{handles.currAnnId,6} = rect(1,1);
handles.currAnnotation{handles.currAnnId,7} = rect(1,2);
handles.currAnnotation{handles.currAnnId,8} = rect(1,3);
handles.currAnnotation{handles.currAnnId,9} = rect(1,4);
handles.currAnnotation{handles.currAnnId,10} = handles.currQueryText;


%create mask image
cords = ceil(rect);
%cords(3) = min(cords(1)+cords(3),size(handles.currImg,2));
%cords(4) = min(cords(2)+cords(4),size(handles.currImg,1));


% maskImg = zeros(size(handles.currImg),'uint8');
% maskImg(cords(2):cords(4),cords(1):cords(3),1) = 255;
% maskImg(cords(2):cords(4),cords(1):cords(3),2) = 255;
% handles.currImg(cords(2):cords(4),cords(1):cords(3),:) = ...
%     0.25*handles.currImg(cords(2):cords(4),cords(1):cords(3),:) + ...
%     0.75*maskImg(cords(2):cords(4),cords(1):cords(3),:);
% imshow(handles.currImg);

if(handles.currAnnotation{handles.currAnnId,4} > 0)
    lineStyle = '--';
else
    lineStyle = '-';
end
if(handles.currAnnotation{handles.currAnnId,5} > 0)
    colorVal = 'b';
else
    colorVal = 'y';
end
rectangle('Position',cords,'EdgeColor',colorVal,'LineWidth',3,'LineStyle',lineStyle);
text(cords(1),cords(2),handles.currAnnotation{handles.currAnnId,10});

handles.currAnnId = handles.currAnnId + 1;

%uncheck all radio button
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
set(handles.radiobutton8,'Value',0);
set(handles.radiobutton9,'Value',0);
set(handles.radiobutton10,'Value',0);
set(handles.radiobutton11,'Value',0);
set(handles.radiobutton12,'Value',0);
set(handles.radiobutton20,'Value',0);
set(handles.radiobutton13,'Value',0);

set(handles.radiobutton14,'Value',1);
set(handles.radiobutton17,'Value',1);

set(handles.static_notify, 'String', 'Good!');

guidata(hObject,handles);

% --- Executes on button press in graphics.
function graphics_Callback(hObject, eventdata, handles)
handles.numTextFrames = handles.numTextFrames + 1;

if(handles.currFileId < numel(handles.currFrameFiles))
    handles.currFileId = handles.currFileId + 1;
    handles.currImg = imread([handles.currFrameFolder filesep handles.currFrameFiles(handles.currFileId).name]);
    imshow(handles.currImg);
    set(handles.static_numFrames, 'String', [num2str(handles.currFileId) '/' num2str(numel(handles.currFrameFiles))]);
    set(handles.static_notify, 'String', 'Good!');
    
    %plot existing boundaries
    if(~isempty(handles.currAnnotation))
        for j=1:size(handles.currAnnotation,1)
            if(strcmp(handles.currAnnotation{j,3},handles.currFrameFiles(handles.currFileId).name))
                cords = cell2mat([handles.currAnnotation(j,6) handles.currAnnotation(j,7) ...
                    handles.currAnnotation(j,8) handles.currAnnotation(j,9)]);
                cords = ceil(cords);
                
                if(cell2mat(handles.currAnnotation(j,4)) > 0)
                    lineStyle = '--';
                else
                    lineStyle = '-';
                end
                if(cell2mat(handles.currAnnotation(j,5)) > 0)
                    colorVal = 'b';
                else
                    colorVal = 'y';
                end
                rectangle('Position',cords,'EdgeColor',colorVal,'LineWidth',3,'LineStyle',lineStyle);
                text(cords(1),cords(2),handles.currAnnotation{j,10});
            end
        end
    end
    set(handles.listbox1, 'Enable', 'off');
else
    %Save meta data
    [~,fName,~] = fileparts(handles.currFrameFolder);
    fid = fopen([handles.currFrameFolder filesep fName '_Meta.txt'],'w');
    
    for i=1:handles.currAnnId-1
        fprintf(fid,'%s %s %s %d %d %f %f %f %f %s\n',handles.currAnnotation{i,1}, ...
            handles.currAnnotation{i,2},handles.currAnnotation{i,3}, ...
            handles.currAnnotation{i,4},handles.currAnnotation{i,5}, ...
            handles.currAnnotation{i,6},handles.currAnnotation{i,7},handles.currAnnotation{i,8}, ...
            handles.currAnnotation{i,9},handles.currAnnotation{i,10});
    end
    fclose(fid);
    set(handles.static_notify, 'String', 'Data Saved !!!. Choose New Folder.');
    set(handles.listbox1, 'Enable', 'off');
end

guidata(hObject,handles);




function edit_newQuery_Callback(hObject, eventdata, handles)

input = get(hObject,'String');
data=guidata(hObject);
data.text=input;
guidata(hObject,data);
% hObject    handle to edit_newQuery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_newQuery as text
%        str2double(get(hObject,'String')) returns contents of edit_newQuery as a double


% --- Executes during object creation, after setting all properties.
function edit_newQuery_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_newQuery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit_currFramePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_currFramePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currFrameFolder = uigetdir;
set(handles.edit_currFramePath,'string',currFrameFolder);

%read all files in frame folder
handles.currFrameFolder=currFrameFolder;
handles.currFileId=1;
handles.numQueries=0;
handles.numTextFrames=0;
handles.numBGFrames=0;
handles.currFrameFiles = dir([currFrameFolder filesep '*.png']);
handles.queryCell = {};
handles.currAnnotation = {};
handles.currAnnId = 1;


%check if meta file already exists
[~,fName,~] = fileparts(handles.currFrameFolder);
currMetaFile = [handles.currFrameFolder filesep fName '_Meta.txt'];
metaData = [];
if(exist(currMetaFile,'file'))
    fid = fopen(currMetaFile);
    metaData = textscan(fid,'%s %s %s %d %d %f %f %f %f %s');
    fclose(fid);
end

queryList = {'','','','','','','','','','','','',''};
tic
if(numel(handles.currFrameFiles) > 0)
    handles.frameType = zeros(1,numel(handles.currFrameFiles));
    handles.currImg = imread([handles.currFrameFolder filesep handles.currFrameFiles(handles.currFileId).name]);
    imshow(handles.currImg);
    
    %plot existing boundaries
    if(~isempty(metaData))
        %fAIdx = find(strcmp(metaData{3},handles.currFrameFiles(handles.currFileId).name));
        for j=1:numel(metaData{1})
            handles.currAnnotation{handles.currAnnId,1} = metaData{1}{j};
            handles.currAnnotation{handles.currAnnId,2} = metaData{2}{j};
            handles.currAnnotation{handles.currAnnId,3} = metaData{3}{j};
            handles.currAnnotation{handles.currAnnId,4} = metaData{4}(j);
            handles.currAnnotation{handles.currAnnId,5} = metaData{5}(j);
            handles.currAnnotation{handles.currAnnId,6} = metaData{6}(j);
            handles.currAnnotation{handles.currAnnId,7} = metaData{7}(j);
            handles.currAnnotation{handles.currAnnId,8} = metaData{8}(j);
            handles.currAnnotation{handles.currAnnId,9} = metaData{9}(j);
            handles.currAnnotation{handles.currAnnId,10} = metaData{10}{j};
            
            if(strcmp(metaData{3}{j},handles.currFrameFiles(handles.currFileId).name))
                cords = [metaData{6}(j) metaData{7}(j) ...
                    metaData{8}(j) metaData{9}(j)];
                cords = ceil(cords);
                
                if(metaData{4}(j) > 0)
                    lineStyle = '--';
                else
                    lineStyle = '-';
                end
                if(metaData{5}(j) > 0)
                    colorVal = 'b';
                else
                    colorVal = 'y';
                end
                rectangle('Position',cords,'EdgeColor',colorVal,'LineWidth',3,'LineStyle',lineStyle);
                text(cords(1),cords(2),metaData{10}{j});
            end
            handles.currAnnId = handles.currAnnId + 1;
        end
    end
    
    
    %read query file
    [pathstr, name, ext] = fileparts(handles.currFrameFolder);
    fQ = fopen(get(handles.edit_queryPath,'String'));
    qData = textscan(fQ,'%s %s');
    cntr=1;
    for qCntr=1:numel(qData{1})
        if(strcmp(qData{1}{qCntr},name))
            if(cntr>13)
                msgbox('Num queries greater than 13','Error');
            else
                queryList{cntr} = qData{2}{qCntr};
                cntr = cntr+1;
            end
        end
    end
    fclose(fQ);
    
    %queryList = {'q1','q2','q3','q4','q5','','','','','','',''};
    allQueryList = qData{2};
    
    set(handles.radiobutton1,'String',queryList{1});
    set(handles.radiobutton2,'String',queryList{2});
    set(handles.radiobutton3,'String',queryList{3});
    set(handles.radiobutton4,'String',queryList{4});
    set(handles.radiobutton5,'String',queryList{5});
    set(handles.radiobutton6,'String',queryList{6});
    set(handles.radiobutton7,'String',queryList{7});
    set(handles.radiobutton8,'String',queryList{8});
    set(handles.radiobutton9,'String',queryList{9});
    set(handles.radiobutton10,'String',queryList{10});
    set(handles.radiobutton11,'String',queryList{11});
    set(handles.radiobutton12,'String',queryList{12});
    set(handles.radiobutton20,'String',queryList{13});
    
    set(handles.radiobutton14,'Value',1);
    set(handles.radiobutton17,'Value',1);
    
    set(handles.listbox1,'String',unique(sort(allQueryList)));
    %set(handles.listbox1,'value', []);
    set(handles.static_numFrames, 'String', [num2str(handles.currFileId) '/' num2str(numel(handles.currFrameFiles))]);
    set(handles.listbox1, 'Enable', 'off');
else
    set(handles.static_notify, 'String', 'Choose Correct Folder!');
end
guidata(hObject,handles);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.frameType(handles.currFileId) = 0;  %Delete frame is 0

if(handles.currFileId < numel(handles.currFrameFiles))
    handles.currFileId = handles.currFileId + 1;
    handles.currImg = imread([handles.currFrameFolder filesep handles.currFrameFiles(handles.currFileId).name]);
    imshow(handles.currImg);
    set(handles.static_numFrames, 'String', [num2str(handles.currFileId) '/' num2str(numel(handles.currFrameFiles))]);
else
    toc
    set(handles.static_notify, 'String', 'Choose New Folder!');
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13



% --- Executes on key press with focus on radiobutton12 and none of its controls.
function radiobutton12_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radiobutton12.
function radiobutton12_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
% radio1Value = get(handles.radiobutton1, 'Value');
% radio2Value = get(handles.radiobutton2, 'Value');
% radio3Value = get(handles.radiobutton3, 'Value');
% radio4Value = get(handles.radiobutton4, 'Value');
% radio5Value = get(handles.radiobutton5, 'Value');
% radio6Value = get(handles.radiobutton6, 'Value');
% radio7Value = get(handles.radiobutton7, 'Value');
% radio8Value = get(handles.radiobutton8, 'Value');
% radio9Value = get(handles.radiobutton9, 'Value');
% radio10Value = get(handles.radiobutton10, 'Value');
% radio11Value = get(handles.radiobutton11, 'Value');
% radio12Value = get(handles.radiobutton12, 'Value');
% radio20Value = get(handles.radiobutton20, 'Value');
radio13Value = get(handles.radiobutton13, 'Value');

if(radio13Value==1)
    set(handles.listbox1, 'Enable', 'on');
else
    set(handles.listbox1, 'Enable', 'off');
end


% --- Executes during object creation, after setting all properties.
function imgAxes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imgAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate imgAxes



function edit_queryPath_Callback(hObject, eventdata, handles)
% hObject    handle to edit_queryPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_queryPath as text
%        str2double(get(hObject,'String')) returns contents of edit_queryPath as a double


% --- Executes during object creation, after setting all properties.
function edit_queryPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_queryPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[currQueryFile,currQueryPath] = uigetfile;
set(handles.edit_queryPath,'String',[currQueryPath currQueryFile]);
guidata(hObject,handles);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numTextFrames = handles.numTextFrames - 1;

if(handles.currFileId > 1)
    handles.currFileId = handles.currFileId - 1;
    handles.currImg = imread([handles.currFrameFolder filesep handles.currFrameFiles(handles.currFileId).name]);
    imshow(handles.currImg);
    set(handles.static_numFrames, 'String', [num2str(handles.currFileId) '/' num2str(numel(handles.currFrameFiles))]);
    set(handles.static_notify, 'String', 'Good!');
    
    %plot existing boundaries
    if(~isempty(handles.currAnnotation))
        for j=1:size(handles.currAnnotation,1)
            if(strcmp(handles.currAnnotation{j,3},handles.currFrameFiles(handles.currFileId).name))
                cords = cell2mat([handles.currAnnotation(j,6) handles.currAnnotation(j,7) ...
                    handles.currAnnotation(j,8) handles.currAnnotation(j,9)]);
                cords = ceil(cords);
                
                if(cell2mat(handles.currAnnotation(j,4)) > 0)
                    lineStyle = '--';
                else
                    lineStyle = '-';
                end
                if(cell2mat(handles.currAnnotation(j,5)) > 0)
                    colorVal = 'b';
                else
                    colorVal = 'y';
                end
                rectangle('Position',cords,'EdgeColor',colorVal,'LineWidth',3,'LineStyle',lineStyle);
                text(cords(1),cords(2),handles.currAnnotation{j,10});
            end
        end
    end
    set(handles.listbox1, 'Enable', 'off');
end

guidata(hObject,handles);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(~isempty(handles.currAnnotation))
    fIdx = find(strcmp(handles.currAnnotation(:,3),handles.currFrameFiles(handles.currFileId).name));
    handles.currAnnotation(fIdx,:) = [];
    handles.currAnnId = handles.currAnnId-numel(fIdx);
end

imshow(handles.currImg);

guidata(hObject,handles);