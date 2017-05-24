function varargout = chap4(varargin)
% CHAP4 MATLAB code for chap4.fig
%      CHAP4, by itself, creates a new CHAP4 or raises the existing
%      singleton*.
%
%      H = CHAP4 returns the handle to a new CHAP4 or the handle to
%      the existing singleton*.
%
%      CHAP4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP4.M with the given input arguments.
%
%      CHAP4('Property','Value',...) creates a new CHAP4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap4

% Last Modified by GUIDE v2.5 23-May-2017 23:41:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap4_OpeningFcn, ...
                   'gui_OutputFcn',  @chap4_OutputFcn, ...
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


% --- Executes just before chap4 is made visible.
function chap4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap4 (see VARARGIN)

% Choose default command line output for chap4
handles.output = hObject;

%set the opening function
movegui( gcf, 'center' );
setappdata(gcf,'seletion',1);
set(handles.edit1,'string','0');
set(handles.text2,'string',['H(s)    =    0    bit']);
set(handles.text3,'string',['Average Code Length    =    0']);
set(handles.text4,'string',['Coding Efficiency=    0']);



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chap4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set the reset button
set(handles.edit1,'string','0');
set(handles.text2,'string',['H(s)    =    0    bit']);
set(handles.text3,'string',['Average Code Length    =    0']);
set(handles.text4,'string',['Coding Efficiency=    0']);
set(handles.uitable1,'data',[]);
guidata(hObject,handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set the calculate button
seletion = getappdata(gcf,'seletion');
set(handles.uitable1, 'Data', []);
input1 = str2num(get(handles.edit1,'String'));
		if (isempty(input1))
    		errordlg('Please enter numbers (>_<)','Error');
    	elseif(any(input1(:) < 0) || any(input1(:)>1))
			errordlg('Probability should be in [0,1] (>_<)','Error');
		elseif(abs((sum(input1) - 1)) > eps)
    		errordlg('Sum of probability should equal to 1 (>_<)','Error');
    	else
    		input1_sort = sort(input1,'descend');
    		n = find(abs(input1_sort - 0) < eps);
    		input1_sort(n)=[];
    		input1_h =sum(input1_sort .* (-log2(input1_sort)));
    		switch(seletion)
    		case 1
    			p = input1_sort;
    			n = length(p);
    			H = 0;
                H = input1_h;
    			pa = zeros(1,n);
    			for j = 2:n
    			    pa(j) = pa(j-1) + p(j-1);
    			end
    			k = zeros(1,n);
    			for i = 1:n
    			    k(i) = ceil(-log2(p(i)));
    			end
    			k_max = max(k);
    			bin = zeros(n,k_max);
    			for i = 1:n
    				for j = 1:k_max
    			        bin(i,j)=floor(pa(i)*2);
    			        pa(i)=pa(i)*2-floor(pa(i)*2);
    			    end
    			end
    			codeword = zeros(n,k_max);
    			for i = 1:n
    				for  j = 1:k_max
    					if j > k(i)
    			            codeword(i,j) = blanks(1);
    			        else
    			        	if bin(i,j) == 0
    			        		codeword(i,j) = '0';
    			        	elseif bin(i,j) == 1
    			        		codeword(i,j) = '1';
    			        	end
    			        end
    			    end
    			end
    			codeword = char(codeword);
    			K = sum(p.* k);
    			eff = H/K;
    			codeword_cell1 = cellstr(codeword);
    			codeword_cell1 = codeword_cell1';

    			input1_sort_cell = num2cell(input1_sort);
    			codeword_cell1(2,:) = input1_sort_cell;
    			 codeword_cell1([1,2],:) = codeword_cell1([2,1],:);
    			set(handles.uitable1,'data',codeword_cell1);
    			set(handles.text2,'string',['H(s)    =    ' ,num2str(H,'%.3f'),'    bit']);
    			set(handles.text3,'string',['Average Code Length    =    ',num2str(K,'%.3f')]);
    			set(handles.text4,'string',['Coding Efficiency=    ' ,num2str(eff,'%.3f')]);
    		case 2
    			P = wrev(input1_sort);
    			A = P;
    			B = [];
    			i = 1;
    			LL = length(P);
    			L = LL;
    			B(1,:) = P;
    			while(L>2)
    			      i = i+1;
    			      B(i,1) = A(1)+A(2);
    			      C(i-1) = B(i,1);
    			  for j = 2:(L-1)
    			     B(i,j) = A(j+1);
    			  end
    			 L = L-1;
    			 B(i,1:L) = sort(B(i,1:L));
    			 A = B(i,1:L);
    			end
    			K = zeros(i,LL);
    			K(i,1:2) = 1;
    			for ll = 1:i
    			    for n = 1:LL
    			W(ll,n) = {'0'};
    			    end
    			end
    			W(i,1) = {'1'};

    			for m = (i-1):-1:1
    			    BB = B(m,1)+B(m,2);
    			     BBB = find(B(m+1,:) == BB);
    			     BBB = BBB(1);

    			        W(m,1:2) = W(m+1,BBB);
    			        K(m,1:2) = K(m+1,BBB);
    			        W(m,1) = strcat(W(m,1),'1');
    			        W(m,2) = strcat(W(m,2),'0');
    			        K(m,1:2) = K(m,1:2)+1;
    			        uu = zeros(1,LL);
    			        uu(1) = BBB;
    			        y = 1;
    			         for n = 3:(LL+1-m)
    			              fd3 = find(B(m,n) == B(m+1,:));
    			              for pp = 1:length(fd3)
    			                  kk = isempty(find(uu == fd3(pp)));
    			                 if(kk == 1)
    			                     y = y+1;
    			                     fd3 = fd3(pp);
    			                     uu(y) = fd3;
    			                     break;
    			                 end
    			              end
    			                  W(m,n) = W(m+1,fd3);
    			                  K(m,n) = K(m+1,fd3);
    			         end
    			end
    			a = W(1,:);
    			b = K(1,:);
    			codeword_cell2 = wrev(a);
    			codeword_length2 = wrev(b);
    			average_code_length2 = sum(codeword_length2 .* input1_sort);
    			efficiency2 = input1_h / average_code_length2;
    			input2_sort_cell2 = num2cell(input1_sort);
    			codeword_cell2(2,:) = input2_sort_cell2;
    			 codeword_cell2([1,2],:) = codeword_cell2([2,1],:);
    			set(handles.uitable1,'data',codeword_cell2);
    			set(handles.text2,'string',['H(s)    =    ' ,num2str(input1_h,'%.3f'),'    bit']);
    			set(handles.text3,'string',['Average Code Length    =    ',num2str(average_code_length2,'%.3f')]);
    			set(handles.text4,'string',['Coding Efficiency=    ' ,num2str(efficiency2,'%.3f')]);
    		case 3
    			codeword_cell3 = fano(input1_sort);
    			for(i = 1:length(codeword_cell3))
                    codeword_length3(1,i) = length(codeword_cell3{i});
    			end;
				average_code_length3 = sum(codeword_length3 .* input1_sort);
    			efficiency3 = input1_h / average_code_length3;
    			input3_sort_cell3 = num2cell(input1_sort);
    			codeword_cell3(2,:) = input3_sort_cell3;
    			 codeword_cell3([1,2],:) = codeword_cell3([2,1],:);
    			set(handles.uitable1,'data',codeword_cell3);
    			set(handles.text2,'string',['H(s)    =    ' ,num2str(input1_h,'%.3f'),'    bit']);
    			set(handles.text3,'string',['Average Code Length    =    ',num2str(average_code_length3,'%.3f')]);
    			set(handles.text4,'string',['Coding Efficiency=    ' ,num2str(efficiency3,'%.3f')]);
    		end
    	end


guidata(hObject,handles);






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection2 = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection2
    case 'Yes',
        delete(gcf);
    case 'No'
        return
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
%set the popup menu
seletion = get(handles.popupmenu1,'value');
setappdata(gcf,'seletion',seletion);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function c = fano(p)
% p = [0.25 0.25 0.20 0.15 0.10 0.05]
% c = fano(p)
n = size(p , 2) ;
%??????
if n == 1 
    c = cell(1,1);
    c{1} = '' ;
    return 
end
[p , index] = sort(p);%?????
p = fliplr(p) ;
total = sum(p) ;%???
acc = 0 ;%????
flag = 0 ;%?????????
for i = 1:n-1
    newacc = acc + p(i) ;
    if abs(total - 2 * newacc) >= abs(total - 2 * acc)
        flag = 1 ;
        break;    
    end
    acc = newacc ;
end
if ~flag
    i = n ;
end
split = i ;
%????????????fano
c1 = fano(p(1:split-1)) ;
c2 = fano(p(split:n)) ;
c = cell(1,n) ;
%????0?1
for i = 1:split-1
    c{i} = strcat('0' , c1{i}) ;
end
for i = split:n
    c{i} = strcat('1' , c2{i - split + 1} ) ; 
end
%???????
c = fliplr(c) ;
c(index) = c ;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
selection2 = questdlg('Close the current window?','Confirm Close','Yes','No','Yes');
switch selection2
    case 'Yes',
        delete(gcf);
    case 'No'
        return
end
