function varargout = chap1(varargin)
% CHAP1 MATLAB code for chap1.fig
%      CHAP1, by itself, creates a new CHAP1 or raises the existing
%      singleton*.
%
%      H = CHAP1 returns the handle to a new CHAP1 or the handle to
%      the existing singleton*.
%
%      CHAP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP1.M with the given input arguments.
%
%      CHAP1('Property','Value',...) creates a new CHAP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap1

% Last Modified by GUIDE v2.5 04-May-2017 17:11:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap1_OpeningFcn, ...
                   'gui_OutputFcn',  @chap1_OutputFcn, ...
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


% --- Executes just before chap1 is made visible.
function chap1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap1 (see VARARGIN)

% Choose default command line output for chap1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%opening Fcn section

%set the window position
movegui( gcf, 'center' );
%set the input section
set(handles.chap1_text2,'visible','off');
set(handles.chap1_text3,'visible','off');
set(handles.chap1_edit2,'visible','off');
set(handles.chap1_edit3,'visible','off');
set(handles.chap1_edit4,'visible','off');

%set the formula section
set(handles.axes1,'visible','on');
imshow('1_1.jpg');

%set the result section
set(handles.chap1_text5,'visible','off');

%set the global variables

setappdata(gcf,'currentstate',1);
setappdata(gcf,'currentunit',1);

setappdata(gcf,'output1_1','0');
setappdata(gcf,'output1_2','0');
setappdata(gcf,'output1_3','0');
setappdata(gcf,'output2_1','0');
setappdata(gcf,'output2_2','0');
setappdata(gcf,'output2_3','0');
setappdata(gcf,'output3_1','0');
setappdata(gcf,'output3_2','0');
setappdata(gcf,'output3_3','0');
setappdata(gcf,'output4_1','0');
setappdata(gcf,'output4_2','0');
setappdata(gcf,'output4_3','0');





% --- Outputs from this function are returned to the command line.
function varargout = chap1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%reset button section
currentstate = getappdata(gcf,'currentstate');
switch currentstate
case 1
	set(handles.chap1_edit1,'String','0');
	set(handles.chap1_text4,'String','I(x)    =    0');
	setappdata(gcf,'output1_1','0');
	setappdata(gcf,'output1_2','0');
	setappdata(gcf,'output1_3','0');
case 2
	set(handles.chap1_edit2,'String','0');
	set(handles.chap1_edit3,'String','0');
	set(handles.chap1_text4,'String','I(x;y)    =    0');
	setappdata(gcf,'output2_1','0');
	setappdata(gcf,'output2_2','0');
	setappdata(gcf,'output2_3','0');
case 3
	set(handles.chap1_edit1,'String','0');
	set(handles.chap1_text4,'String','H(X)    =    0');
	setappdata(gcf,'output3_1','0');
	setappdata(gcf,'output3_2','0');
	setappdata(gcf,'output3_3','0');
case 4
	set(handles.chap1_edit4,'String','0');
	set(handles.chap1_text5,'String',['   H(X)   =    0',char(10,13)','   H(Y)   =    0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0']);
	setappdata(gcf,'output4_1','0');
	setappdata(gcf,'output4_2','0');
	setappdata(gcf,'output4_3','0');
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%calculate button section
currentstate = getappdata(gcf,'currentstate');
currentunit = getappdata(gcf,'currentunit');
switch currentstate
	case 1  %calculator I(x)
		%get the input data
        input1 = 0;
		input1 = str2num(get(handles.chap1_edit1,'String'));
		[m1,n1] = size(input1);
		input1size = m1 + n1 -1;
		%judge whether the input is valid
		if (isempty(input1))
			errordlg('Please enter a number (>_<)','Error');
		elseif(input1size > 1)
			errordlg('Only one input is permitted (>_<)','Error');
		elseif (input1 > 1 || input1 < 0)
			errordlg('Probability should be in [0,1] (>_<)','Error');
		else
		%calculate I(x)
		output1_1 = ['I(x)    =    ',num2str(-log2(input1),'%.3f')];
		output1_2 = ['I(x)    =    ',num2str(-log(input1),'%.3f')];
		output1_3 = ['I(x)    =    ',num2str(-log10(input1),'%.3f')];
		setappdata(gcf,'output1_1',output1_1);
		setappdata(gcf,'output1_2',output1_2);
		setappdata(gcf,'output1_3',output1_3);
		switch currentunit
		case 1
			set(handles.chap1_text4,'String',getappdata(gcf,'output1_1'));
		case 2
			set(handles.chap1_text4,'String',getappdata(gcf,'output1_2'));
		case 3
			set(handles.chap1_text4,'String',getappdata(gcf,'output1_3'));
		end
		end

	case 2  %calculator I(x,y)
		%get the input data
        input2 = 0;
		input2_1 = str2num(get(handles.chap1_edit2,'String'));
		input2_2 = str2num(get(handles.chap1_edit3,'String'));
        [m2_1,n2_1] = size(input2_1);
		input2_1size = m2_1 + n2_1 -1;
		[m2_2,n2_2] = size(input2_2);
		input2_2size = m2_2 + n2_2 -1;
		if (isempty(input2_1) ||isempty(input2_2))
    		errordlg('Please enter a number (>_<)','Error');
    	elseif(input2_1size > 1 || input2_2size > 1)
    		errordlg('Only one input is permitted (>_<)','Error');
    	elseif (input2_1 > 1 || input2_1 < 0 || input2_2 > 1 || input2_2 < 0)
    		errordlg('Probability should be in [0,1] (>_<)','Error');
		else
		%calculate I(x,y)
		output2_1 = ['I(x;y)    =    ',num2str(log2(input2_1 / input2_2),'%.3f')];
		output2_2 = ['I(x;y)    =    ',num2str(log(input2_1 / input2_2),'%.3f')];
		output2_3 = ['I(x;y)    =    ',num2str(log10(input2_1 / input2_2),'%.3f')];
		setappdata(gcf,'output2_1',output2_1);
		setappdata(gcf,'output2_2',output2_2);
		setappdata(gcf,'output2_3',output2_3);
		switch currentunit
			case 1
				set(handles.chap1_text4,'String',getappdata(gcf,'output2_1'));
			case 2
				set(handles.chap1_text4,'String',getappdata(gcf,'output2_2'));
			case 3
				set(handles.chap1_text4,'String',getappdata(gcf,'output2_3'));
		end
	end

	case 3  %calculator H(X)
		%get the input data
		input3 = 0;
		input3 = str2num(get(handles.chap1_edit1,'String'));
		if (isempty(input3))
    		errordlg('Please enter numbers (>_<)','Error');
    	elseif(any(input3(:) < 0) || any(input3(:)>1))
			errordlg('Probability should be in [0,1] (>_<)','Error');
		elseif(abs((sum(input3) - 1)) > eps)
    		errordlg('Sum of probability should be equal to 1 (>_<)','Error');
    	% calculate H(X)
    	elseif(any(input3(:) == 1))
    		output3_1 = ['H(X)    =    ','0'];
    		output3_2 = ['H(X)    =    ','0'];
    		output3_3 = ['H(X)    =    ','0'];
    		setappdata(gcf,'output3_1',output3_1);
    		setappdata(gcf,'output3_2',output3_2);
    		setappdata(gcf,'output3_3',output3_3);
    	else
    		output3_1 = ['H(X)    =    ',num2str(-sum(input3 .* log2(input3)),'%.3f')];
    		output3_2 = ['H(X)    =    ',num2str(-sum(input3 .* log(input3)),'%.3f')];
    		output3_3 = ['H(X)    =    ',num2str(-sum(input3 .* log10(input3)),'%.3f')];
    		setappdata(gcf,'output3_1',output3_1);
    		setappdata(gcf,'output3_2',output3_2);
    		setappdata(gcf,'output3_3',output3_3);
    		end
            switch currentunit
			case 1
				set(handles.chap1_text4,'String',getappdata(gcf,'output3_1'));
			case 2
				set(handles.chap1_text4,'String',getappdata(gcf,'output3_2'));
			case 3
				set(handles.chap1_text4,'String',getappdata(gcf,'output3_3'));

    	end


	case 4  %calculator H(X,Y) and etc
		%get the input data
		input4 = 0;
		input4 = str2num(get(handles.chap1_edit4,'String'));
		if (isempty(input4))
    		errordlg('Please enter numbers (>_<)','Error');
    	elseif(any(input4(:) < 0) || any(input4(:)>1))
			errordlg('Probability should be in [0,1] (>_<)','Error');
            output4_1 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		output4_2 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		output4_3 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		setappdata(gcf,'output4_1',output4_1);
    		setappdata(gcf,'output4_2',output4_2);
    		setappdata(gcf,'output4_3',output4_3);
       elseif(abs((sum(sum(input4)) - 1)) > eps)
			errordlg('Sum of probability should be equal to 1 (>_<)','Error');
            output4_1 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		output4_2 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		output4_3 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		setappdata(gcf,'output4_1',output4_1);
    		setappdata(gcf,'output4_2',output4_2);
    		setappdata(gcf,'output4_3',output4_3);
		elseif(any(input4(:) == 1))
    		output4_1 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		output4_2 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		output4_3 = ['   H(X)   =   0',char(10,13)','   H(Y)   =   0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0'];
    		setappdata(gcf,'output4_1',output4_1);
    		setappdata(gcf,'output4_2',output4_2);
    		setappdata(gcf,'output4_3',output4_3);
      	else
      		input4_1_1 = input4;
      		input4_1_1(input4_1_1==0) = 1;
      		input4_1_2 = sum(input4,2);
      		input4_1_2(input4_1_2==0) = 1;
      		input4_1_3 = sum(input4,1);
      		input4_1_3(input4_1_3==0) = 1;

      		Hx1y1 = sum(-sum(input4_1_1 .* log2(input4_1_1)));
      		Hx2y2 = sum(-sum(input4_1_1 .* log(input4_1_1)));
      		Hx3y3 = sum(-sum(input4_1_1 .* log10(input4_1_1)));
    		Hx1 = -sum(input4_1_2 .* log2(input4_1_2));
    		Hx2 = -sum(input4_1_2 .* log(input4_1_2));
    		Hx3 = -sum(input4_1_2 .* log10(input4_1_2));
    		Hy1 = -sum(input4_1_3 .* log2(input4_1_3));
    		Hy2 = -sum(input4_1_3 .* log(input4_1_3));
    		Hy3 = -sum(input4_1_3 .* log10(input4_1_3));
    		Hx1_y1 = Hx1y1 - Hy1;
    		Hx2_y2 = Hx2y2 - Hy2;
    		Hx3_y3 = Hx3y3 - Hy3;
    		Hy1_x1 = Hx1y1 - Hx1;
    		Hy2_x2 = Hx2y2 - Hx2;
    		Hy3_x3 = Hx3y3 - Hx3;
    		Ix1y1 = Hx1 + Hy1 -Hx1y1;
    		Ix2y2 = Hx2 + Hy2 -Hx2y2;
    		Ix3y3 = Hx3 + Hy3 -Hx3y3;
      		output4_1 = ['   H(X)   =   ',num2str(Hx1,'%.3f'),char(10,13)','   H(Y)   =   ',num2str(Hy1,'%.3f'),char(10,13)','H(X|Y)   =    ',num2str(Hx1_y1,'%.3f'),char(10,13)','H(Y|X)   =    ',num2str(Hy1_x1,'%.3f'),char(10,13)','H(X,Y)   =    ',num2str(Hx1y1,'%.3f'),char(10,13)','I(X;Y)    =    ',num2str(Ix1y1,'%.3f')];
      		output4_2 = ['   H(X)   =   ',num2str(Hx2,'%.3f'),char(10,13)','   H(Y)   =   ',num2str(Hy2,'%.3f'),char(10,13)','H(X|Y)   =    ',num2str(Hx2_y2,'%.3f'),char(10,13)','H(Y|X)   =    ',num2str(Hy2_x2,'%.3f'),char(10,13)','H(X,Y)   =    ',num2str(Hx2y2,'%.3f'),char(10,13)','I(X;Y)    =    ',num2str(Ix2y2,'%.3f')];
      		output4_3 = ['   H(X)   =   ',num2str(Hx3,'%.3f'),char(10,13)','   H(Y)   =   ',num2str(Hy3,'%.3f'),char(10,13)','H(X|Y)   =    ',num2str(Hx3_y3,'%.3f'),char(10,13)','H(Y|X)   =    ',num2str(Hy3_x3,'%.3f'),char(10,13)','H(X,Y)   =    ',num2str(Hx3y3,'%.3f'),char(10,13)','I(X;Y)    =    ',num2str(Ix3y3,'%.3f')];
      		setappdata(gcf,'output4_1',output4_1);
    		setappdata(gcf,'output4_2',output4_2);
    		setappdata(gcf,'output4_3',output4_3);
        end;
    		switch currentunit
			case 1
				set(handles.chap1_text5,'String',getappdata(gcf,'output4_1'));
			case 2
				set(handles.chap1_text5,'String',getappdata(gcf,'output4_2'));
			case 3
				set(handles.chap1_text5,'String',getappdata(gcf,'output4_3'));
     	end
        
end
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection
    case 'Yes'
        delete(gcf);  
    case 'No'
        return
end


% --- Executes on selection change in chap1_popupmenu1.
function chap1_popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to chap1_popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chap1_popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chap1_popupmenu1

% pop-up list section
currentstate = get(hObject,'Value');
setappdata(gcf,'currentstate',currentstate);
switch currentstate
	case 1  %calculate I(x)

		% set the input section
		set(handles.chap1_text1,'Visible','on');
		set(handles.chap1_text1,'String','p(xi)=');
		set(handles.chap1_text2,'Visible','off');
		set(handles.chap1_text3,'Visible','off');
		set(handles.chap1_edit1,'Visible','on');
		set(handles.chap1_edit1,'String','0');
		set(handles.chap1_edit2,'Visible','off');
		set(handles.chap1_edit3,'Visible','off');
		set(handles.chap1_edit4,'Visible','off');

		% set the formula section
		cla reset;
		imshow('1_1.jpg');
		set(handles.axes1,'Visible','off');


		% set the result section

		set(handles.chap1_text4,'Visible','on');
		set(handles.chap1_text4,'String','I(x)    =    0');
		set(handles.chap1_text5,'Visible','off');



	case 2  %calculate I(x;y)

		% set the input section
		set(handles.chap1_text1,'Visible','off');
		set(handles.chap1_text2,'Visible','on');
		set(handles.chap1_text2,'String','p(xi|yj)=');
		set(handles.chap1_text3,'Visible','on');
		set(handles.chap1_text3,'String','p(xi)=');
		set(handles.chap1_edit1,'Visible','off');
		set(handles.chap1_edit2,'Visible','on');
		set(handles.chap1_edit2,'String','0');
		set(handles.chap1_edit3,'Visible','on');
		set(handles.chap1_edit3,'String','0');
		set(handles.chap1_edit4,'Visible','off');

		% set the formula section
		cla reset;
		imshow('1_2.jpg');
		set(handles.axes1,'Visible','off');


		% set the result section

		set(handles.chap1_text4,'Visible','on');
		set(handles.chap1_text4,'String','I(x;y)    =    0');
		set(handles.chap1_text5,'Visible','off');

	case 3  %calculate H(X)

		% set the input section
		set(handles.chap1_text1,'Visible','on');
		set(handles.chap1_text1,'String','p(X)=');
		set(handles.chap1_text2,'Visible','off');
		set(handles.chap1_text3,'Visible','off');
		set(handles.chap1_edit1,'Visible','on');
		set(handles.chap1_edit1,'String','0');
		set(handles.chap1_edit2,'Visible','off');
		set(handles.chap1_edit3,'Visible','off');
		set(handles.chap1_edit4,'Visible','off');

		% set the formula section
		cla reset;
		imshow('1_3.jpg');
		set(handles.axes1,'Visible','off');


		% set the result section

		set(handles.chap1_text4,'Visible','on');
		set(handles.chap1_text4,'String','H(X)    =    0');
		set(handles.chap1_text5,'Visible','off');



	case 4  %calculate H(X,Y) H(X|Y) H(Y|X) I(X;Y)

		% set the input section
		set(handles.chap1_text1,'Visible','on');
		set(handles.chap1_text1,'String','p(X,Y)=');
		set(handles.chap1_text2,'Visible','off');
		set(handles.chap1_text3,'Visible','off');
		set(handles.chap1_edit1,'Visible','off');
		set(handles.chap1_edit2,'Visible','off');
		set(handles.chap1_edit3,'Visible','off');
		set(handles.chap1_edit4,'Visible','on');
		set(handles.chap1_edit4,'String','0');

		% set the formula section
		cla reset;
		imshow('1_4.jpg');
		set(handles.axes1,'Visible','off');


		% set the result section

		set(handles.chap1_text4,'Visible','off');
		set(handles.chap1_text5,'Visible','on');
		set(handles.chap1_text5,'String',['   H(X)   =    0',char(10,13)','   H(Y)   =    0',char(10,13)','H(X|Y)   =    0',char(10,13)','H(Y|X)   =    0',char(10,13)','H(X,Y)   =    0',char(10,13)','I(X;Y)    =    0']);
end
guidata(hObject,handles);







% --- Executes during object creation, after setting all properties.
function chap1_popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap1_popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap1_edit1_Callback(hObject, eventdata, handles)
% hObject    handle to chap1_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap1_edit1 as text
%        str2double(get(hObject,'String')) returns contents of chap1_edit1 as a double


% --- Executes during object creation, after setting all properties.
function chap1_edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap1_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
% popmenu2 section
currentunit = get(hObject,'Value');
currentstate = getappdata(gcf,'currentstate');
setappdata(gcf,'currentunit',currentunit);
switch currentstate
	case 1
		switch(currentunit)
		case 1
			set(handles.chap1_text4,'String',getappdata(gcf,'output1_1'));
		case 2
			set(handles.chap1_text4,'String',getappdata(gcf,'output1_2'));
		case 3
			set(handles.chap1_text4,'String',getappdata(gcf,'output1_3'));

		end
	case 2
		switch(currentunit)
		case 1
			set(handles.chap1_text4,'String',getappdata(gcf,'output2_1'));
		case 2
			set(handles.chap1_text4,'String',getappdata(gcf,'output2_2'));
		case 3
			set(handles.chap1_text4,'String',getappdata(gcf,'output2_3'));
		end
	case 3
		switch(currentunit)
		case 1
			set(handles.chap1_text4,'String',getappdata(gcf,'output3_1'));
		case 2
			set(handles.chap1_text4,'String',getappdata(gcf,'output3_2'));
		case 3
			set(handles.chap1_text4,'String',getappdata(gcf,'output3_3'));
		end
	case 4
		switch(currentunit)
		case 1
			set(handles.chap1_text5,'String',getappdata(gcf,'output4_1'));
		case 2
			set(handles.chap1_text5,'String',getappdata(gcf,'output4_2'));
		case 3
			set(handles.chap1_text5,'String',getappdata(gcf,'output4_3'));
	end
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap1_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to chap1_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap1_edit2 as text
%        str2double(get(hObject,'String')) returns contents of chap1_edit2 as a double


% --- Executes during object creation, after setting all properties.
function chap1_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap1_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap1_edit3_Callback(hObject, eventdata, handles)
% hObject    handle to chap1_edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap1_edit3 as text
%        str2double(get(hObject,'String')) returns contents of chap1_edit3 as a double


% --- Executes during object creation, after setting all properties.
function chap1_edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap1_edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap1_edit4_Callback(hObject, eventdata, handles)
% hObject    handle to chap1_edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap1_edit4 as text
%        str2double(get(hObject,'String')) returns contents of chap1_edit4 as a double


% --- Executes during object creation, after setting all properties.
function chap1_edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap1_edit4 (see GCBO)
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
