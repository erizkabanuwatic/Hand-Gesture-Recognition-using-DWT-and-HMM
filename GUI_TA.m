function varargout = GUI_TA(varargin)
% GUI_TA MATLAB code for GUI_TA.fig
%      GUI_TA, by itself, creates a new GUI_TA or raises the existing
%      singleton*.
%
%      H = GUI_TA returns the handle to a new GUI_TA or the handle to
%      the existing singleton*.
%
%      GUI_TA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TA.M with the given input arguments.
%
%      GUI_TA('Property','Value',...) creates a new GUI_TA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_TA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_TA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_TA

% Last Modified by GUIDE v2.5 25-Jun-2019 19:51:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_TA_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_TA_OutputFcn, ...
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


% --- Executes just before GUI_TA is made visible.
function GUI_TA_OpeningFcn(hObject, eventdata, handles, varargin)
movegui('center')
gambar = imread ('telu2.jpg');
axes(handles.axes1); imshow (gambar);
gambar = imread ('foto.jpg');
axes(handles.axes2); imshow (gambar);

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_TA (see VARARGIN)

% Choose default command line output for GUI_TA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_TA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_TA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on selection change in level.
function level_Callback(hObject, eventdata, handles)
% hObject    handle to level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns level contents as cell array
%        contents{get(hObject,'Value')} returns selected item from level


% --- Executes during object creation, after setting all properties.
function level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in subband.
function subband_Callback(hObject, eventdata, handles)
% hObject    handle to subband (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns subband contents as cell array
%        contents{get(hObject,'Value')} returns selected item from subband


% --- Executes during object creation, after setting all properties.
function subband_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subband (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2 level jenis_subband im_prepro feature_uji mother_wavelet time_dwt
im_prepro      = im2
level          = get(handles.level,'value');
jenis_subband  = get(handles.subband,'value');
mother_wavelet = get(handles.mother,'value');
tic
switch mother_wavelet
        case 1
            mom_wav='haar';
        case 2
            mom_wav='db3';
        case 3
            mom_wav='db5';
        case 4 
            mom_wav='db7';
     end
for ilevel = 1:level
    [LL,LH,HL,HH]=dwt2(im_prepro,mom_wav);
    switch jenis_subband
        case 1
            im_prepro=LL;
        case 2
            im_prepro=LH;
        case 3
            im_prepro=HL;
        case 4 
            im_prepro=HH;
    end
end
[pnj lb] = size(im_prepro);
pnj_feature = pnj*lb
feature_uji = reshape(im_prepro,pnj_feature,1);
time_dwt = toc
axes(handles.axes5); imshow(im_prepro,[]);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_uji im2 tipe_prepro time_prepro dataset_name
dataset_name = get(handles.nama_dataset,'value');
tipe_prepro = get(handles.prepro_type,'value');
tic
im2 = preprocessing(im_uji,tipe_prepro,dataset_name);
time_prepro = toc
axes(handles.axes4); imshow (im2);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im_uji
im = uigetfile('*.bmp','Select a .bmp file');
im_uji = imread (im);
set(handles.edit1,'string',im);
axes(handles.axes3); imshow (im);




function state_Callback(hObject, eventdata, handles)
% hObject    handle to state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of state as text
%        str2double(get(hObject,'String')) returns contents of state as a double


% --- Executes during object creation, after setting all properties.
function state_CreateFcn(hObject, eventdata, handles)
% hObject    handle to state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cluster_Callback(hObject, eventdata, handles)
% hObject    handle to cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cluster as text
%        str2double(get(hObject,'String')) returns contents of cluster as a double


% --- Executes during object creation, after setting all properties.
function cluster_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global level clusterCenters params jenis_subband tipe_prepro mother_wavelet dataset_name
dataset_name = get(handles.nama_dataset,'value')
kluster  = get(handles.cluster,'string');
nkluster = str2num(kluster);
States   = get(handles.state,'string');
nStates  = str2num (States);
[params,clusterCenters]= Data_Latih (nkluster,nStates,tipe_prepro,jenis_subband,mother_wavelet,level,dataset_name);
save('parameters','params','clusterCenters');
tulis = 'Done';
set(handles.edit7,'string',[tulis]);



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in result.
function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global feature_uji clusterCenters params level tipe_prepro jenis_subband mother_wavelet time_prepro time_dwt dataset_name
tic
dataset_name = get(handles.nama_dataset,'value');
%% Klasifikasi HMM
obs = knnsearch(clusterCenters,feature_uji);
[prediction,classProb] = uji_hmm(obs,params);
if prediction == 1
    classfy = 'A';
elseif prediction == 2
    classfy = 'B';
elseif prediction == 3
    classfy = 'C';
elseif prediction == 4
    classfy = 'Point';
else prediction == 5
    classfy = 'Five';
end 

%% Akurasi
accuracy = Data_Uji (level,tipe_prepro,jenis_subband,mother_wavelet,dataset_name);
accuracy = num2str(accuracy);
time_uji = toc;
time     = time_prepro+time_dwt+time_uji;
set(handles.edit4,'string',classfy);
set(handles.edit5,'string',accuracy);
set(handles.edit6,'string',time);


% --- Executes on selection change in mother.
function mother_Callback(hObject, eventdata, handles)
% hObject    handle to mother (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mother contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mother


% --- Executes during object creation, after setting all properties.
function mother_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mother (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in prepro_type.
function prepro_type_Callback(hObject, eventdata, handles)
% hObject    handle to prepro_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns prepro_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from prepro_type


% --- Executes during object creation, after setting all properties.
function prepro_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prepro_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in nama_dataset.
function nama_dataset_Callback(hObject, eventdata, handles)
% hObject    handle to nama_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nama_dataset contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nama_dataset


% --- Executes during object creation, after setting all properties.
function nama_dataset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nama_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
