function varargout = chap3(varargin)
% CHAP3 MATLAB code for chap3.fig
%      CHAP3, by itself, creates a new CHAP3 or raises the existing
%      singleton*.
%
%      H = CHAP3 returns the handle to a new CHAP3 or the handle to
%      the existing singleton*.
%
%      CHAP3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP3.M with the given input arguments.
%
%      CHAP3('Property','Value',...) creates a new CHAP3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap3

% Last Modified by GUIDE v2.5 06-May-2017 18:45:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap3_OpeningFcn, ...
                   'gui_OutputFcn',  @chap3_OutputFcn, ...
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


% --- Executes just before chap3 is made visible.
function chap3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap3 (see VARARGIN)

% Choose default command line output for chap3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%opening function section
%set the window position
movegui( gcf, 'center' );

%set the input section
set(handles.chap3_text1,'visible','on');
set(handles.chap3_text1,'String','Input a channel matrix:');

set(handles.chap3_text2,'visible','on');
set(handles.chap3_text2,'String','Input the error margin:');
set(handles.chap3_axes2,'visible','off');
set(handles.chap3_uibuttongroup2,'visible','off');
set(handles.chap3_edit2,'tooltipstring','Maximum deviation between the result and the theoretical value');


%set the output section
set(handles.chap3_text4,'visible','on');
set(handles.chap3_text7,'visible','off');
set(handles.chap3_uitable1,'RowName',{'p(x)'});
set(handles.chap3_uitable1, 'Data', []);
set(handles.chap3_axes1,'visible','off');
set(handles.chap3_uitable1,'tooltipstring','The corrsponding source distribution to the channel capacity');

%set the display section
set(handles.chap3_axes3,'visible','off');
set(handles.chap3_uipanel1,'visible','off');
set(handles.chap3_popupmenu2,'visible','off');


%set the global variables
setappdata(gcf,'currentstate',1);
setappdata(gcf,'buttonstate',1);
setappdata(gcf,'displaystate',1);

% --- Outputs from this function are returned to the command line.
function varargout = chap3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in chap3_pushbutton2.
function chap3_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%reset button section
currentstate = getappdata(gcf,'currentstate');
switch currentstate
case 1
	set(handles.chap3_edit1,'string','0');
	set(handles.chap3_edit2,'string','0');
	set(handles.chap3_uitable1, 'Data', []);
	set(handles.chap3_text5,'String','C    =    0    bit');
case 2
	buttonstate = getappdata(gcf,'buttonstate');
	switch buttonstate
	case 1
		set(handles.chap3_edit1,'string','0');
        set(handles.chap3_text5,'String','C    =    0    bit');
        set(handles.chap3_text7,'String','Optimized Input Distribution:');
		axes(handles.chap3_axes1);
		cla reset;
        set(handles.chap3_axes1,'visible','off');
        

	case 2
		set(handles.chap3_edit2,'string','0');
        set(handles.chap3_text5,'String','C    =    0    bit');
        set(handles.chap3_text7,'String','Optimized Input Distribution:');
		axes(handles.chap3_axes1);
		cla reset;
        set(handles.chap3_axes1,'visible','off');
	end
case 3
	axes(handles.chap3_axes3);
	cla reset;
    set(handles.chap3_axes3,'visible','off');
end
guidata(hObject,handles);

% --- Executes on button press in chap3_pushbutton1.
function chap3_pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentstate = getappdata(gcf,'currentstate');
switch currentstate
	case 1
        input1_1 = 0;
		input1_2 = 0;
		input1_1 = str2num(get(handles.chap3_edit1,'String'));
		input1_2 = str2num(get(handles.chap3_edit2,'String'));
		if (isempty(input1_1) ||isempty(input1_2))
    		errordlg('Please enter numbers (>_<)','Error');
    	elseif(any(input1_1(:) < 0) || any(input1_1(:) > 1) || input1_2 < 0 || input1_2 > 1)
			errordlg('Probability should be in [0,1] (>_<)','Error');
    	% calculate the channel capacity
        else
            input1_1_temp = (sum(input1_1,2) - ones(size(input1_1,1),1))
			if(any(abs(input1_1_temp(:) - 0 ) > eps))
    			errordlg('Each row of the transition matrix should be equal to 1 (>_<)','Error');
            else
                C1 = 1;
				C = 0;
				N = 0;
				r=size(input1_1);
				P_X = ones(1,r(1))/r(1);
				%adjust '0' in the matrix
				Pyx = (input1_1 == 0).*eps;
				input1_1 = input1_1 + Pyx;
				%iteration solve
				while abs(C1-C) - input1_2 > eps
    				P_Y = P_X*input1_1;
    				I1 = sum((input1_1.*log2(input1_1))');
    				I2 = log2(P_Y)*((input1_1)');
    				BETA = exp(I1 - I2);
    				B = P_X*(BETA');
    				C1 = log(B);
    				C = log(max(BETA));
    				P_X = P_X.*BETA/B;
    				N = N + 1;
				end;
                output1_1 = P_X;
                output1_2 = ['C    =    ',num2str(C,'%.3f'),'    bit'];
                set(handles.chap3_uitable1,'data',output1_1);
				set(handles.chap3_text5,'string',output1_2);
            end;    
        end;

        
        case 2
		buttonstate = getappdata(gcf,'buttonstate');
		switch buttonstate
		case 1
			input2_1 = str2num(get(handles.chap3_edit1,'string'));
			if (isempty(input2_1))
    			errordlg('Please enter numbers (>_<)','Error');
    		elseif(any(input2_1(:) < 0) || any(input2_1(:) > 1))
				errordlg('Probability should be in [0,1] (>_<)','Error');
    		% calculate the channel capacity
    		else
    			input2_1_temp = (sum(input2_1,2) - ones(size(input2_1,1),1));
				if(any(abs(input2_1_temp(:) - 0 ) > eps))
    				errordlg('Each row of the transition matrix should equal to 1 (>_<)','Error');
				else
					H=@(p)(sum(-p.*log2(p+eps))); %function handle,equal to H(p) = sum(-p.*log2(p+eps));
					e = 0:0.01:1;
					Ixy = [];
					p1 = input2_1(1,1);
					p2 = 1 - p1;
					for i = 1:length(e)
						Pyx = [1 0;e(i) 1-e(i)];
						py = [p1 p2] * Pyx;
						Ixy(i) = H(py)-(p1*H(Pyx(1,:))+p2*H(Pyx(2,:)));
					end;
					[C,index] = max(Ixy);
					axes(handles.chap3_axes1);
					plot(e,Ixy);
					set(gca,'FontName','Microsoft YaHei UI','FontSize',12);
					xlabel('e');
					ylabel('Channel Capacity(bit)');
					title('I(x)');
					q = find(Ixy == max(Ixy));
					text(e(q),Ixy(q),'x','color','r');
					output2_2_1 = ['C    =    ',num2str(C,'%.3f'),'    bit'];
					output2_2_2 = ['Optimized Error Rate:   ',num2str(e(index),'%.3f')];
					set(handles.chap3_text5,'string',output2_2_1);
					set(handles.chap3_text7,'string',output2_2_2);
				end;
			end;



		case 2
			input2_2 = str2num(get(handles.chap3_edit2,'string'));
			if (isempty(input2_2))
    			errordlg('Please enter numbers (>_<)','Error');
    		elseif(input2_2 < 0 || input2_2 > 1)
				errordlg('e should be in [0,1] (>_<)','Error');
			else
				%function handle,equal to H(p) = sum(-p.*log2(p+eps));
				H=@(p)(sum(-p.*log2(p+eps)));
				e = input2_2;
				Pyx = [1 0;e 1-e];
				p = 0:0.01:1;
				Ixy = [];
				for i = 1:length(p)
					p1 = p(i);
					p2 = 1-p1;
					py = [p1 p2] * Pyx;
					Ixy(i) = H(py)-(p1*H(Pyx(1,:))+p2*H(Pyx(2,:)));
				end
				[C,index] = max(Ixy);
				axes(handles.chap3_axes1);
				plot(p,Ixy);
				set(gca,'FontName','Microsoft YaHei UI','FontSize',12);
				xlabel('p(x)');
				ylabel('Channel Capacity(bit)');
				title('I(X;Y)');
				q = find(Ixy == max(Ixy));
				text(p(q),Ixy(q),'x','color','r');
				output2_2_1 = ['C    =    ',num2str(C,'%.3f'),'    bit'];
				output2_2_2 = ['Optimized Input Distribution:   ',num2str(p(index),'%.3f'),'  ,  ',num2str(1 - p(index),'%.3f')];
				set(handles.chap3_text5,'string',output2_2_1);
				set(handles.chap3_text7,'string',output2_2_2);
			end;
		end;
        case 3
		displaystate = getappdata(gcf,'displaystate');
		switch displaystate
		case 1
			p1i = 0;
			p2i = 0;
			ej = 0;
			hy = 0;
			Ixy = [];

			H=@(p)(sum(-p.*log2(p+eps))); %function handle,equal to H(p) = sum(-p.*log2(p+eps));
			e = 0:0.01:1;
			p1 = 0:0.01:1;
			for(i = 1:length(p1))
			    for(j = 1:length(e))
			p1i = p1(i);
			p2i = 1 - p1(i);
			ej = e(j);
			hy = -(p1i + p2i * ej) *log2(p1i + p2i * ej + eps)-(p2i * (1 - ej))*log2((p2i * (1 - ej)) + eps);
			Ixy(i,j) = hy - p2i * (-ej * log2(ej + eps) - (1 - ej) * log2(1 - ej + eps));
			    end;
			end;
			axes(handles.chap3_axes3);
			surf(e,p1,Ixy);
			title('Z Channel 3D I(x;y) Figure');
			xlabel('Error rate e');
			ylabel('Initial probability p1');
            zlabel('I(X;Y)');
			rotate3d on;
			colormap('jet');
			colorbar();


		case 2
			p1i = 0;
			p2i = 0;
			ej = 0;
			hy = 0;
			Ixy = [];

			H=@(p)(sum(-p.*log2(p+eps))); %function handle,equal to H(p) = sum(-p.*log2(p+eps));
			e = 0:0.01:1;
			p1 = 0:0.01:1;
			for(i = 1:length(p1))
			    for(j = 1:length(e))
			p1i = p1(i);
			p2i = 1 - p1(i);
			ej = e(j);
			hy1 = p1i * (1 - ej) + p2i * ej;
			hy2 = p1i * ej + p2i * (1 - ej);
			hy = -hy1 *log2(hy1 + eps)- hy2 * log2(hy2 + eps);
			Ixy(i,j) = hy + ej * log2(ej + eps) + (1 - ej) * log2(1 - ej + eps);
			    end
			end
			axes(handles.chap3_axes3);
			surf(e,p1,Ixy);
			title('BSC 3D I(x;y) Figure');
			xlabel('Error rate e');
			ylabel('Initial probability p1');
             zlabel('I(X;Y)');
			rotate3d on;
			colormap('jet');
			colorbar();
		end;
 end;
 guidata(hObject,handles);


% --- Executes on button press in chap3_pushbutton3.
function chap3_pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection,
    case 'Yes',
        delete(gcf);  %gcf???????
    case 'No'
        return
end

% --- Executes on selection change in chap3_popupmenu1.
function chap3_popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chap3_popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chap3_popupmenu1
%Pop up menu section
%Pop up menu section
currentstate = get(hObject,'Value');
setappdata(gcf,'currentstate',currentstate);

switch currentstate
case 1
	%set the input section
	cla reset;
    set(handles.chap3_text1,'visible','on');
	set(handles.chap3_text1,'String','Input a channel matrix:');
	set(handles.chap3_text2,'visible','on');
	set(handles.chap3_text2,'String','Input the error margin:');
	set(handles.chap3_axes2,'visible','off');
	set(handles.chap3_uipanel2,'visible','on');
    set(handles.chap3_edit1,'visible','on');
    set(handles.chap3_edit1,'string','0');
    set(handles.chap3_edit2,'visible','on');
    set(handles.chap3_edit2,'string','0');
    set(handles.chap3_uibuttongroup2,'visible','off');
    set(handles.chap3_edit2,'tooltipstring','Maximum deviation between the result and the theoretical value');

	%set the output section
	set(handles.chap3_text4,'visible','on');
	set(handles.chap3_uitable1,'visible','on');
	set(handles.chap3_uitable1, 'Data', []);
	set(handles.chap3_text5,'visible','on');
	set(handles.chap3_text5,'String','C    =    0    bit');
	set(handles.chap3_text7,'visible','off');
	set(handles.chap3_axes1,'visible','off');
	set(handles.chap3_uipanel3,'visible','on');
    set(handles.chap3_uitable1,'tooltipstring','The corrsponding source distribution to the channel capacity');

	%set the display section
	set(handles.chap3_axes3,'visible','off');
    set(handles.chap3_axes4,'visible','off');
	set(handles.chap3_uipanel1,'visible','off');
	set(handles.chap3_popupmenu2,'visible','off');
    set(handles.chap3_pushbutton1,'string','Calculate');


case 2
	%set the input section
	set(handles.chap3_text1,'visible','off');
	set(handles.chap3_text2,'visible','off');
    set(handles.chap3_edit1,'visible','on');
    set(handles.chap3_edit1,'string','0');
    set(handles.chap3_edit2,'visible','on');
    set(handles.chap3_edit2,'string','0');
    set(handles.chap3_uibuttongroup2,'visible','on');
    set(handles.chap3_edit2,'tooltipstring','');
	%set the image section
    cla reset;
    set(handles.chap3_axes1,'Visible','off');
	set(handles.chap3_uipanel3,'visible','on');

    axes(handles.chap3_axes2);
    imshow('3_1.jpg');
	set(handles.chap3_axes2,'Visible','off');
	set(handles.chap3_uipanel2,'visible','on');

	%set the output section
	set(handles.chap3_text4,'visible','off');
	set(handles.chap3_uitable1,'visible','off');
	set(handles.chap3_text5,'visible','on');
	set(handles.chap3_text5,'String','C    =    0    bit');
	set(handles.chap3_text7,'visible','on');
	set(handles.chap3_text7,'String','Optimized Input Distribution:');
	set(handles.chap3_radiobutton4,'value',1);
	set(handles.chap3_radiobutton5,'value',0);






	%set the display section
	set(handles.chap3_axes3,'visible','off');
    set(handles.chap3_axes4,'visible','off');
	set(handles.chap3_uipanel1,'visible','off');
	set(handles.chap3_popupmenu2,'visible','off');
    set(handles.chap3_pushbutton1,'string','Calculate');

case  3
	%set the input section
	set(handles.chap3_text1,'visible','off');
	set(handles.chap3_text2,'visible','off');
	set(handles.chap3_edit1,'visible','off');
	set(handles.chap3_edit2,'visible','off');
	set(handles.chap3_axes2,'visible','off');
	set(handles.chap3_uipanel2,'visible','off');
    set(handles.chap3_pushbutton1,'string','Display');
    set(handles.chap3_uibuttongroup2,'visible','off');

	%set the output section
	set(handles.chap3_text4,'visible','off');
	set(handles.chap3_text5,'visible','off');
	set(handles.chap3_text7,'visible','off');
	set(handles.chap3_axes1,'visible','off');
	set(handles.chap3_uitable1,'visible','off');
	set(handles.chap3_uipanel3,'visible','off');

	%set the display section
	set(handles.chap3_axes3,'visible','off');
	set(handles.chap3_uipanel1,'visible','on');
	set(handles.chap3_popupmenu2,'visible','on');
    cla reset;
    axes(handles.chap3_axes4);
    imshow('3_1.jpg');

end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function chap3_popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap3_popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap3_edit1_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap3_edit1 as text
%        str2double(get(hObject,'String')) returns contents of chap3_edit1 as a double


% --- Executes during object creation, after setting all properties.
function chap3_edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap3_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chap3_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chap3_edit2 as text
%        str2double(get(hObject,'String')) returns contents of chap3_edit2 as a double


% --- Executes during object creation, after setting all properties.
function chap3_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap3_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on selection change in chap3_popupmenu2.
function chap3_popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns chap3_popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from chap3_popupmenu2
%set displaystate section
displaystate = get(handles.chap3_popupmenu2,'value');
setappdata(gcf,'displaystate',displaystate);
switch displaystate
case 1
    axes(handles.chap3_axes4);
    imshow('3_1.jpg');
case 2
    axes(handles.chap3_axes4);
    imshow('3_2.jpg');
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function chap3_popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chap3_popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chap3_radiobutton4.
function chap3_radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chap3_radiobutton4
setappdata(gcf,'buttonstate',1);
set(handles.chap3_edit2,'string','0');
set(handles.chap3_text5,'String','C    =    0    bit');
set(handles.chap3_text7,'String','Optimized Input Distribution:');
axes(handles.chap3_axes1);
cla reset;
set(handles.chap3_axes1,'visible','off');
guidata(hObject,handles);


% --- Executes on button press in chap3_radiobutton5.
function chap3_radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to chap3_radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chap3_radiobutton5
setappdata(gcf,'buttonstate',2);
set(handles.chap3_edit1,'string','0');
set(handles.chap3_text5,'String','C    =    0    bit');
set(handles.chap3_text7,'String','Optimized Input Distribution:');
axes(handles.chap3_axes1);
cla reset;
set(handles.chap3_axes1,'visible','off');
guidata(hObject,handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
selection = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection,
    case 'Yes',
        delete(gcf);  
    case 'No'
        return
end
