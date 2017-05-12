function varargout = chap2(varargin)
% CHAP2 MATLAB code for chap2.fig
%      CHAP2, by itself, creates a new CHAP2 or raises the existing
%      singleton*.
%
%      H = CHAP2 returns the handle to a new CHAP2 or the handle to
%      the existing singleton*.
%
%      CHAP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP2.M with the given input arguments.
%
%      CHAP2('Property','Value',...) creates a new CHAP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap2

% Last Modified by GUIDE v2.5 05-May-2017 11:04:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap2_OpeningFcn, ...
                   'gui_OutputFcn',  @chap2_OutputFcn, ...
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


% --- Executes just before chap2 is made visible.
function chap2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap2 (see VARARGIN)

% Choose default command line output for chap2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%opening function section
%set the window position
movegui( gcf, 'center' )
%set the formula section
set(handles.chap2_axes1,'visible','on');
imshow('2_1.jpg');

%set the output section
set(handles.chap2_text5,'visible','off');
set(handles.uitable1,'RowName',{'p(x)'});
set(handles.uitable1, 'Data', []);
%set the global variables
setappdata(gcf,'currentstate',1);
setappdata(gcf,'N',1);

% --- Outputs from this function are returned to the command line.
function varargout = chap2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in chap2_popupmenu1.
function chap2_popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to chap2_popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chap2_popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chap2_popupmenu1
%chap2_popupmenu1 section
%chap2_popupmenu1 section
currentstate = get(hObject,'Value');
setappdata(gcf,'currentstate',currentstate);

switch currentstate
case 1
	set(handles.chap2_text1,'String','Input source probability distribution:');
	set(handles.chap2_text2,'visible','on');
	set(handles.chap2_text2,'String','Input extension times N:');
	set(handles.chap2_text3,'String','H(X)         =    0    bit');
	set(handles.chap2_text4,'String','H(X^N)    =    0    bit');
	set(handles.chap2_text5,'String','Nth Extension Probability Distribution');
	set(handles.chap2_edit1,'String','0');
	set(handles.chap2_edit2,'visible','on');
	set(handles.chap2_edit2,'String','0');
	cla reset;
	imshow('2_1.jpg');
	set(handles.chap2_axes1,'Visible','off');
	set(handles.uitable1,'RowName',{'p(x)'});
	set(handles.uitable1, 'Data', []);
case 2
	set(handles.chap2_text1,'String','Input transition matrix:');
	set(handles.chap2_text2,'visible','off');
	set(handles.chap2_text3,'String','H(inf)      =    0    bit');
	set(handles.chap2_text4,'String','    R        =    0    ');
	set(handles.chap2_text5,'String','Steady State Distribution')
	set(handles.chap2_edit1,'String','0');
	set(handles.chap2_edit2,'visible','off');
	
	cla reset;
	imshow('2_2.jpg');
	set(handles.chap2_axes1,'Visible','off');
	set(handles.uitable1,'RowName',{'W'});
	set(handles.uitable1, 'Data', []);
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function chap2_popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap2_popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chap2_pushbutton2.
function chap2_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to chap2_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%reset button section
currentstate = getappdata(gcf,'currentstate');
switch currentstate
	case 1
		set(handles.chap2_text3,'String','H(X)         =    0    bit');
		set(handles.chap2_text4,'String','H(X^N)    =    0    bit');
		set(handles.chap2_edit1,'String','0');
		set(handles.chap2_edit2,'String','0');
		set(handles.uitable1, 'Data', []);
	case 2
		set(handles.chap2_text3,'String','H(inf)      =    0    bit');
		set(handles.chap2_text4,'String','    R        =    0    ');
		set(handles.chap2_edit1,'String','0');
		set(handles.chap2_edit2,'String','0');
		set(handles.uitable1, 'Data', []);
end
guidata(hObject,handles);

% --- Executes on button press in chap2_pushbutton1.
function chap2_pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to chap2_pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set the calculate button section
%set the calculate button section
currentstate = getappdata(gcf,'currentstate');
switch currentstate
	case 1
		%get the input data
		input1_1 = 0;
		input1_2 = 0;
		input1_1 = str2num(get(handles.chap2_edit1,'String'));
		input1_2 = str2num(get(handles.chap2_edit2,'String'));
		if (isempty(input1_1) ||isempty(input1_2))
    		errordlg('Please enter numbers (>_<)','Error');
    	elseif(any(input1_1(:) < 0) || any(input1_1(:)>1))
			errordlg('Probability should be in [0,1] (>_<)','Error');
		elseif(abs((sum(input1_1) - 1)) > eps)
    		errordlg('Sum of probability should equal to 1 (>_<)','Error');
    	elseif(fix(input1_2) ~= input1_2)
    		errordlg('N is supposed to be an integer (>_<)','Error');
    	% calculate Nth distribution
    	else
    		output1_3 = ones(1,length(input1_1) ^ input1_2);
    		for(i = 0:length(input1_1) ^ input1_2 - 1)
    			code = dec2base(i,length(input1_1),input1_2);
    			codelist = unique(code);
    			codenum = [];
    			for j = 1:length(codelist)
    				codenum(j) = length(strfind(code,codelist(j)));
    			end
    			marklist = [];
    			for(j = 1:length(codelist))
    				marklist(j) = str2num(codelist(j)) + 1;
    			end
    			for(j = 1:length(marklist))
    				output1_3(i + 1) = output1_3(i + 1) * (input1_1(marklist(j))) ^ codenum(j);
    			end;
    		end;
            set(handles.uitable1,'Data',output1_3);
        
	    	if(any(input1_1(:) == 1))
    		output1_1 = ['H(X)         =    0    bit'];
    		output1_2 = ['H(X^',num2str(input1_2),')    =    0    bit'];
    	else

			output1_1_1 = input1_1;
      		output1_1_1(output1_1_1==0) = 1;
      		output1_3_1 = output1_3;
      		output1_3_1(output1_3_1==0) = 1;
      		output1_1 = ['H(X)         =    ',num2str(-sum(output1_1_1 .* log2(output1_1_1)),'%.3f'),'    bit'];
      		output1_2 = ['H(X^',num2str(input1_2),')    =    ',num2str(-sum(output1_3_1 .* log2(output1_3_1)),'%.3f'),'    bit'];
      	end
      		set(handles.chap2_text3,'String',output1_1);
      		set(handles.chap2_text4,'String',output1_2);
        end


    case 2
		input2_2 = 0;
		input2_2 = str2num(get(handles.chap2_edit1,'String'));
		if (isempty(input2_2))
    		errordlg('Please enter numbers (>_<)','Error');
    	elseif(any(input2_2(:) < 0) || any(input2_2(:)>1))
			errordlg('Probability should be in [0,1] (>_<)','Error');
    	elseif(size(input2_2,1) ~= size(input2_2,2))
    		errordlg('Only square matrix is permitted (>_<)','Error');
    	else
    		input2_2_temp1 = sum(input2_2,2) - ones(size(input2_2,1),1);
    		if(any(abs(input2_2_temp1(:) - 0 ) > eps))
    		errordlg('Each row of the transition matrix should be equal to 1 (>_<)','Error');
    		else
    		%judge whether it has steady state distribution
    		matrixtemp = eye(size(input2_2,1));
    		i = 0;
    		while(i < 20 && (any(abs(matrixtemp(:) - 0 ) < eps)))
    			matrixtemp = matrixtemp * input2_2;
    			i = i + 1;
    		end
    		if(i == 20)
    		errordlg('Doesn''t exist a steady state (>_<)','Error');
    		else
			%calculate the steady state distribution
    		a = (input2_2)' - eye(size(input2_2,1));
    		a(size(input2_2,1) + 1,:) = 1;
    		b = zeros(size(input2_2,1) + 1,1);
    		b(size(input2_2,1) + 1,1) = 1;
    		output2_1 = (a \ b)';
    		set(handles.uitable1,'Data',output2_1);

    		%calculate the H(inf)
    		output2_2_1_temp1 = (output2_1)';
    		input2_2_1_temp2 = input2_2;
    		input2_2_1_temp2(input2_2_1_temp2==0) = 1;
    		for(k = 1:size(input2_2_1_temp2,1))
    			output2_2_1_temp3(k,1) = -sum(input2_2_1_temp2(k,:) .* log2(input2_2_1_temp2(k,:)));
    		end
    		H_inf = sum(output2_2_1_temp3 .* output2_2_1_temp1);
    		H_0 = log2(size(input2_2,2));
    		R = 1 - H_inf / H_0;
    		output2_2 = ['H(inf)      =    ',num2str(H_inf,'%.3f'),'    bit'];
    		output2_3 = ['    R        =    ',num2str(R,'%.3f'),'    '];
    		set(handles.chap2_text3,'String',output2_2);
    		set(handles.chap2_text4,'String',output2_3);

    		end
    		end
    	end


end
guidata(hObject,handles);

% --- Executes on button press in chap2_pushbutton3.
function chap2_pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to chap2_pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection
    case 'Yes'
        delete(gcf);  
    case 'No'
        return
end


function chap2_edit1_Callback(hObject, eventdata, handles)
% hObject    handle to chap2_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap2_edit1 as text
%        str2double(get(hObject,'String')) returns contents of chap2_edit1 as a double


% --- Executes during object creation, after setting all properties.
function chap2_edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap2_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap2_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to chap2_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap2_edit2 as text
%        str2double(get(hObject,'String')) returns contents of chap2_edit2 as a double


% --- Executes during object creation, after setting all properties.
function chap2_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap2_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
selection = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection
    case 'Yes'
        delete(hObject);  
    case 'No'
        return
end
