function varargout = asmctool(varargin)
warning off
% Note: Please Run in MATLAB R2015a or later 

% History:
%   2017  The first official version of the Toolbox by Masoud Moghaddasi
%   2012  Pure Simulink codes are published by Jinkun Liu and Xinhua Wang
%   Ref: Liu, Jinkun, and Xinhua Wang. Advanced sliding mode control for mechanical systems. Berlin: Springer, 2012.
%
% Copyright (C) 2017 Masoud Moghaddasi
%
% $Id: lti_disc.m 111 2007-09-04 12:09:23Z ssarkka $
%
% This software is distributed under the GNU General Public 
% Licence (version 2 or later)

% Last Modified by GUIDE v2.5 16-Jan-2017 00:00:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @asmctool_OpeningFcn, ...
                   'gui_OutputFcn',  @asmctool_OutputFcn, ...
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


% --- Executes just before asmctool is made visible.
function asmctool_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.figure1, 'Name', 'Advanced Sliding Mode Control Toolbox');
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes asmctool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = asmctool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in SolutionSelector.
function SolutionSelector_Callback(hObject, eventdata, handles)
% hObject    handle to SolutionSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.VerticalAxis,'Enable','off')
set(handles.HorizontalAxis,'Enable','off')
set(handles.GridStatus,'Enable','off')
set(handles.LegendStatus,'Enable','off')
set(handles.SubplotAll,'Enable','off')
set(handles.ExternalFigureCheckBox,'Enable','off')

contents = cellstr(get(hObject,'String')) ;
switch contents{get(hObject,'Value')}
    case 'Nominal Model'
        %%
        handles.File = './chap2_1/chap2_1sim' ;
        addpath('./chap2_1')
        %
        set(handles.ParameterName1,'String','B')
        set(handles.ParameterEdit1,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName1,'TooltipString','Damping Coefficient')
        set(handles.ParameterEdit1,'TooltipString','Damping Coefficient')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','J')
        set(handles.ParameterEdit2,'String','3+0.5*sin(2*pi*t)')
        set(handles.ParameterName2,'TooltipString','Moment of Inertia')
        set(handles.ParameterEdit2,'TooltipString','Moment of Inertia')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','d')
        set(handles.ParameterEdit3,'String','10*sin(t)')
        set(handles.ParameterName3,'TooltipString','Disturbance')
        set(handles.ParameterEdit3,'TooltipString','Disturbance')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','B_n')
        set(handles.ParameterEdit4,'String','10')
        set(handles.ParameterName4,'TooltipString','Nominal Damping Coefficient')
        set(handles.ParameterEdit4,'TooltipString','Nominal Damping Coefficient')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','J_n')
        set(handles.ParameterEdit5,'String','3')
        set(handles.ParameterName5,'TooltipString','Nominal Moment of Inertia')
        set(handles.ParameterEdit5,'TooltipString','Nominal Moment of Inertia')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','B_m')
        set(handles.ParameterEdit6,'String','7')
        set(handles.ParameterName6,'TooltipString','Minimum of Damping Coefficient')
        set(handles.ParameterEdit6,'TooltipString','Minimum of Damping Coefficient')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','B_M')
        set(handles.ParameterEdit7,'String','13')
        set(handles.ParameterName7,'TooltipString','Maximum of Damping Coefficient')
        set(handles.ParameterEdit7,'TooltipString','Maximum of Damping Coefficient')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','J_m')
        set(handles.ParameterEdit8,'String','2.5')
        set(handles.ParameterName8,'TooltipString','Minimum of Moment of Inertia')
        set(handles.ParameterEdit8,'TooltipString','Minimum of Moment of Inertia')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','J_M')
        set(handles.ParameterEdit9,'String','3.5')
        set(handles.ParameterName9,'TooltipString','Maximum of Moment of Inertia')
        set(handles.ParameterEdit9,'TooltipString','Maximum of Moment of Inertia')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','d_M')
        set(handles.ParameterEdit10,'String','10')
        set(handles.ParameterName10,'TooltipString','Maximum of Disturbance')
        set(handles.ParameterEdit10,'TooltipString','Maximum of Disturbance')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','k')
        set(handles.ParameterEdit11,'String','3.0')
        set(handles.ParameterName11,'TooltipString','Design Parameter')
        set(handles.ParameterEdit11,'TooltipString','Design Parameter')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','K')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','On')
        set(handles.ParameterEdit12,'Visible','On')
        set(handles.FakeEqual12,'Visible','On')
        %
        set(handles.ParameterName13,'String','Theta_d')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','On')
        set(handles.ParameterEdit13,'Visible','On')
        set(handles.FakeEqual13,'Visible','On')
        %
        set(handles.ParameterName14,'String','InitialStateVector')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','On')
        set(handles.ParameterEdit14,'Visible','On')
        set(handles.FakeEqual14,'Visible','On')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking' ;'Speed Tracking';'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking' ;'Speed Tracking';'Control Input' })
        handles.FunctionHandleParameterString='@(t)';
    case 'for an Uncertain System'
        %
        handles.File = './chap2_2/chap2_2sim' ;
        addpath('./chap2_2')
        %
        set(handles.ParameterName1,'String','J')
        set(handles.ParameterEdit1,'String','1.0+0.2*sin(t)')
        set(handles.ParameterName1,'TooltipString','Moment of Inertia')
        set(handles.ParameterEdit1,'TooltipString','Moment of Inertia')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','d')
        set(handles.ParameterEdit2,'String','0.1*sin(2*pi*t)')
        set(handles.ParameterName2,'TooltipString','Disturbance')
        set(handles.ParameterEdit2,'TooltipString','Disturbance')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','J_min')
        set(handles.ParameterEdit3,'String','0.80')
        set(handles.ParameterName3,'TooltipString','Minimum of Moment of Inertia')
        set(handles.ParameterEdit3,'TooltipString','Minimum of Moment of Inertia')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','J_max')
        set(handles.ParameterEdit4,'String','1.2')
        set(handles.ParameterName4,'TooltipString','Maximum of Moment of Inertia')
        set(handles.ParameterEdit4,'TooltipString','Maximum of Moment of Inertia')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','D')
        set(handles.ParameterEdit5,'String','0.10')
        set(handles.ParameterName5,'TooltipString','Design Parameter')
        set(handles.ParameterEdit5,'TooltipString','Design Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','Theta_d')
        set(handles.ParameterEdit6,'String','sin(t)')
        set(handles.ParameterName6,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit6,'TooltipString','Desired Trajectory')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','c')
        set(handles.ParameterEdit7,'String','10')
        set(handles.ParameterName7,'TooltipString','Design Parameter')
        set(handles.ParameterEdit7,'TooltipString','Design Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','M')
        set(handles.ParameterEdit8,'String','2')
        set(handles.ParameterName8,'TooltipString','Saturated or Switch Function')
        set(handles.ParameterEdit8,'TooltipString','Saturated or Switch Function')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Phi')
        set(handles.ParameterEdit9,'String','0.05')
        set(handles.ParameterName9,'TooltipString','Saturated Function Slope')
        set(handles.ParameterEdit9,'TooltipString','Saturated Function Slope')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','InitialStateVector')
        set(handles.ParameterEdit10,'String','[pi/6 0]')
        set(handles.ParameterName10,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit10,'TooltipString','Initial State Vector')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','3.0')
        set(handles.ParameterName11,'TooltipString','Design Parameter')
        set(handles.ParameterEdit11,'TooltipString','Design Parameter')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{'Position Tracking';'Control Input';'Switch Function' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Control Input';'Switch Function' })
        handles.FunctionHandleParameterString='@(t)';
    case 'Linearization Feedback'
        %
        handles.File = './chap2_3/chap2_3sim' ;
        addpath('./chap2_3')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1.0')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','Unit: Kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum Bar')
        set(handles.ParameterEdit2,'TooltipString','Unit: Kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One Half of Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','Unit: m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','g')
        set(handles.ParameterEdit4,'String','9.8')
        set(handles.ParameterName4,'TooltipString','Gravity Acceleration')
        set(handles.ParameterEdit4,'TooltipString','Unit: m/s^2')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName6,'String','k1')
        set(handles.ParameterEdit6,'String','5')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','k2')
        set(handles.ParameterEdit7,'String','5')
        set(handles.ParameterName7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName5,'String','x_d')
        set(handles.ParameterEdit5,'String','0.10*sin(pi*t)')
        set(handles.ParameterName5,'TooltipString','Design Trajectory')
        set(handles.ParameterEdit5,'TooltipString','Design Trajectory')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName8,'String','InitialStateVector')
        set(handles.ParameterEdit8,'String','[pi/60 0]')
        set(handles.ParameterName8,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit8,'TooltipString','Unit: rad')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.05')
        set(handles.ParameterName9,'TooltipString','Saturated Function Slope')
        set(handles.ParameterEdit9,'TooltipString','Saturated Function Slope')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','[pi/6 0]')
        set(handles.ParameterName10,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit10,'TooltipString','Initial State Vector')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','3.0')
        set(handles.ParameterName11,'TooltipString','Design Parameter')
        set(handles.ParameterEdit11,'TooltipString','Design Parameter')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Control Input' })
        handles.FunctionHandleParameterString='@(t)';
    case 'Linearization Feedback SMC'
        handles.File = './chap2_4/chap2_4sim' ;
        addpath('./chap2_4')
                %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1.0')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','Unit: Kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum Bar')
        set(handles.ParameterEdit2,'TooltipString','Unit: Kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One Half of Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','Unit: m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','g')
        set(handles.ParameterEdit4,'String','9.8')
        set(handles.ParameterName4,'TooltipString','Gravity Acceleration')
        set(handles.ParameterEdit4,'TooltipString','Unit: m/s^2')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','c')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','delta_0')
        set(handles.ParameterEdit6,'String','0.03')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','delta_1')
        set(handles.ParameterEdit7,'String','5')
        set(handles.ParameterName7,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit7,'TooltipString','Initial State Vector')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','x_d')
        set(handles.ParameterEdit8,'String','0.10*sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Design Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Design Trajectory')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','InitialStateVector')
        set(handles.ParameterEdit9,'String','[-pi/60 0]')
        set(handles.ParameterName9,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit9,'TooltipString','Unit: rad')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','d_t')
        set(handles.ParameterEdit10,'String','10*sin(t)' )
        set(handles.ParameterName10,'TooltipString','Disturbance')
        set(handles.ParameterEdit10,'TooltipString','Disturbance')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','M')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','etta')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','On')
        set(handles.ParameterEdit12,'Visible','On')
        set(handles.FakeEqual12,'Visible','On')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Control Input' })  
        handles.FunctionHandleParameterString='@(t)';
    case 'Input-Output Feedback Linearization'
        handles.File = './chap2_5/chap2_5sim' ;
        addpath('./chap2_5')
        set(handles.ParameterName1,'String','x1dot')
        set(handles.ParameterEdit1,'String','sin(x2)+(x2+1)*x3')
        set(handles.ParameterName1,'TooltipString','First State Derivative')
        set(handles.ParameterEdit1,'TooltipString','First State Equation')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','x2dot')
        set(handles.ParameterEdit2,'String','x1^5+x3')
        set(handles.ParameterName2,'TooltipString','Second State Derivative')
        set(handles.ParameterEdit2,'TooltipString','Second State Equation')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','x3dot')
        set(handles.ParameterEdit3,'String','x1^2+ut')
        set(handles.ParameterName3,'TooltipString','Third State Derivative')
        set(handles.ParameterEdit3,'TooltipString','Third State Equation')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','y_d')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterName4,'TooltipString','Desired Output')
        set(handles.ParameterEdit4,'TooltipString','Desired Output')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','InitialStateVector')
        set(handles.ParameterEdit5,'String','[0.15 0 0]')
        set(handles.ParameterName5,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit5,'TooltipString','Initial State Vector')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','fx')
        set(handles.ParameterEdit6,'String','(x1^5+x3)*(x3+cos(x2))+(x2+1)*x1^2')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','v')
        set(handles.ParameterEdit7,'String','ddyd+k1*e+k2*de')
        set(handles.ParameterName7,'TooltipString','Auxiliary Controller')
        set(handles.ParameterEdit7,'TooltipString','Auxiliary Controller')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','k1')
        set(handles.ParameterEdit8,'String','10')
        set(handles.ParameterName8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','k2')
        set(handles.ParameterEdit9,'String','10')
        set(handles.ParameterName9,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','ut')
        set(handles.ParameterEdit10,'String','1.0/(x2+1)*(v-f)' )
        set(handles.ParameterName10,'TooltipString','Disturbance')
        set(handles.ParameterEdit10,'TooltipString','Disturbance')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Position Tracking Error';'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Position Tracking Error';'Control Input' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,ut,k1,k2,v,f,e,de,dde,yd,dyd,ddyd)';
    case 'Input-Output Feedback Linearization SMC'
        handles.File = './chap2_6/chap2_6sim' ;
        addpath('./chap2_6')
        %
        set(handles.ParameterName1,'String','y_d')
        set(handles.ParameterEdit1,'String','sin(t)')
        set(handles.ParameterName1,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit1,'TooltipString','Desired Trajectory')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','c')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterName2,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit2,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','etta')
        set(handles.ParameterEdit3,'String','3.0')
        set(handles.ParameterName3,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit3,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','d1')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterName4,'TooltipString','Plant Uncertainty')
        set(handles.ParameterEdit4,'TooltipString','Plant Uncertainty')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','d2')
        set(handles.ParameterEdit5,'String','sin(t)')
        set(handles.ParameterName5,'TooltipString','Plant Uncertainty')
        set(handles.ParameterEdit5,'TooltipString','Plant Uncertainty')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','d3')
        set(handles.ParameterEdit6,'String','sin(t)')
        set(handles.ParameterName6,'TooltipString','Plant Uncertainty')
        set(handles.ParameterEdit6,'TooltipString','Plant Uncertainty')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','InitialStateVector')
        set(handles.ParameterEdit7,'String','[0.15 0 0]')
        set(handles.ParameterName7,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit7,'TooltipString','Initial State Vector')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.10*sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Design Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Design Trajectory')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','[-pi/60 0]')
        set(handles.ParameterName9,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit9,'TooltipString','Unit: rad')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','10*sin(t)' )
        set(handles.ParameterName10,'TooltipString','Disturbance')
        set(handles.ParameterEdit10,'TooltipString','Disturbance')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Position Tracking Error';'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Position Tracking Error';'Control Input' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on Low Pass Filter'
        handles.File = './chap2_7/chap2_7sim' ;
        addpath('./chap2_7')
        %
        set(handles.ParameterName1,'String','J')
        set(handles.ParameterEdit1,'String','10')
        set(handles.ParameterName1,'TooltipString','Initial Moment')
        set(handles.ParameterEdit1,'TooltipString','Initial Moment')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','d_t')
        set(handles.ParameterEdit2,'String','3.0*sin(t)')
        set(handles.ParameterName2,'TooltipString','Disturbance')
        set(handles.ParameterEdit2,'TooltipString','Disturbance')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','r')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName3,'TooltipString','Ideal Position Signal')
        set(handles.ParameterEdit3,'TooltipString','Ideal Position Signal')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','Lambda')
        set(handles.ParameterEdit4,'String','25')
        set(handles.ParameterName4,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit4,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','Lambda_1')
        set(handles.ParameterEdit5,'String','30')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','Lambda_2')
        set(handles.ParameterEdit6,'String','30')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','InitialStateVector')
        set(handles.ParameterEdit7,'String','[0.5;0]')
        set(handles.ParameterName7,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit7,'TooltipString','Initial State Vector')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','etta')
        set(handles.ParameterEdit8,'String','80')
        set(handles.ParameterName8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','[-pi/60 0]')
        set(handles.ParameterName9,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit9,'TooltipString','Unit: rad')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','10*sin(t)' )
        set(handles.ParameterName10,'TooltipString','Disturbance')
        set(handles.ParameterEdit10,'TooltipString','Disturbance')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Initial Control Input';'Practical Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Initial Control Input';'Practical Control Input' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Linear Matrix Inequality for Inverted Pendulum'
        handles.File = './chap3_1/chap3_1sim' ;
        addpath('./chap3_1')
        %
        set(handles.ParameterName1,'String','M')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString','Pole Mass')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','L')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','Half Length Of Pole')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','T')
        set(handles.ParameterEdit4,'String','20')
        set(handles.ParameterName4,'TooltipString','Sampling Period')
        set(handles.ParameterEdit4,'TooltipString','ms')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','delta_f')
        set(handles.ParameterEdit5,'String','0.30')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','epsilon_0')
        set(handles.ParameterEdit6,'String','0.15')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','delta')
        set(handles.ParameterEdit7,'String','0.05')
        set(handles.ParameterName7,'TooltipString','Boundary Layer')
        set(handles.ParameterEdit7,'TooltipString','Boundary Layer')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','InitialStateVector')
        set(handles.ParameterEdit8,'String','[-pi/3 0 5.0 0]')
        set(handles.ParameterName8,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit8,'TooltipString','[Rolling angle,rolling_rate,vehicle position,vehicle velocity]')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','f')
        set(handles.ParameterEdit9,'String','0.3*sin(t)')
        set(handles.ParameterName9,'TooltipString','Uncertainties and the Disturbances')
        set(handles.ParameterEdit9,'TooltipString','Lower than delta_f')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','P')
        set(handles.ParameterEdit10,'String','[7.4496 1.2493 1.0782 1.1384; 1.2493 0.3952 0.2108 0.3252; 1.0782 0.2108 0.3854 0.2280; 1.1384 0.3252 0.2280 0.4286]' )
        set(handles.ParameterName10,'TooltipString','Design Parameter')
        set(handles.ParameterEdit10,'TooltipString','Design Parameter')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Angle Response' ; 'Angle Speed Response' ; 'Cart Position Response' ; 'Cart Speed Response' ; 'Control Input' ; 'Sliding Mode' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Angle Response' ; 'Angle Speed Response' ; 'Cart Position Response' ; 'Cart Speed Response' ; 'Control Input' ; 'Sliding Mode' }) 
        handles.FunctionHandleParameterString='@(t)';
    case 'E3_2'
        handles.File = './chap3_2/chap3_2sim' ;
        addpath('./chap3_2')
        %
        set(handles.ParameterName1,'String','M')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString','Pole Mass')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','L')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','Half Length Of Pole')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','T')
        set(handles.ParameterEdit4,'String','20')
        set(handles.ParameterName4,'TooltipString','Sampling Period')
        set(handles.ParameterEdit4,'TooltipString','ms')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','delta_f')
        set(handles.ParameterEdit5,'String','0.30')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','epsilon_0')
        set(handles.ParameterEdit6,'String','0.15')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','delta_1')
        set(handles.ParameterEdit7,'String','0.5')
        set(handles.ParameterName7,'TooltipString','Boundary Layer')
        set(handles.ParameterEdit7,'TooltipString','Boundary Layer')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','InitialStateVector')
        set(handles.ParameterEdit8,'String','[-pi/6 0 5.0 0]')
        set(handles.ParameterName8,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit8,'TooltipString','[Rolling angle,rolling_rate,vehicle position,vehicle velocity]')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','f')
        set(handles.ParameterEdit9,'String','0.3*sin(t)')
        set(handles.ParameterName9,'TooltipString','Uncertainties and the Disturbances')
        set(handles.ParameterEdit9,'TooltipString','Lower than delta_f')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','DesiredStates')
        set(handles.ParameterEdit10,'String','[0 0 0 0]' )
        set(handles.ParameterName10,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit10,'TooltipString','[Rolling angle,Rolling rate,vehicle_position,vehicle velocity]')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Angle response';'Angle response';'Cart position response';'Cart speed response';'Control Input' 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Angle response';'Angle response';'Cart position response';'Cart speed response';'Control Input' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Backstepping SMC for Inverted Pendulum'
        handles.File = './chap3_3/chap3_3sim' ;
        addpath('./chap3_3')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','Unit: kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum Bar')
        set(handles.ParameterEdit2,'TooltipString','Unit: kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One Half Of Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','x_d')
        set(handles.ParameterEdit4,'String','0.1*sin(pi*t)')
        set(handles.ParameterName4,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit4,'TooltipString','Desired Trajectory')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','c_1')
        set(handles.ParameterEdit5,'String','35')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','c_2')
        set(handles.ParameterEdit6,'String','15')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','InitialStateVector')
        set(handles.ParameterEdit7,'String','[-pi/60 0]')
        set(handles.ParameterName7,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit7,'TooltipString','Initial State Vector')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.5')
        set(handles.ParameterName8,'TooltipString','Boundary Layer')
        set(handles.ParameterEdit8,'TooltipString','Boundary Layer')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.3*sin(t)')
        set(handles.ParameterName9,'TooltipString','Uncertainties and the Disturbances')
        set(handles.ParameterEdit9,'TooltipString','Lower than delta_f')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','[0,0,0,0]' )
        set(handles.ParameterName10,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit10,'TooltipString','[Rolling angle,Rolling rate,vehicle_position,vehicle velocity]')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking' ; 'Position Tracking Error' ; 'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking' ; 'Position Tracking Error' ; 'Control Input' }) 
        handles.FunctionHandleParameterString='@(t)';
    case 'Discrete'
        handles.File = './chap4_1/chap4_1.m' ;
        addpath('./chap4_1')
        %
        set(handles.ParameterName1,'String','A')
        set(handles.ParameterEdit1,'String','[1,0.001;0,0.9753]')
        set(handles.ParameterName1,'TooltipString','State (or system) matrix')
        set(handles.ParameterEdit1,'TooltipString','State (or system) matrix')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','B')
        set(handles.ParameterEdit2,'String','[0.0001;0.1314]')
        set(handles.ParameterName2,'TooltipString','input matrix')
        set(handles.ParameterEdit2,'TooltipString','input matrix')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','d_k')
        set(handles.ParameterEdit3,'String','1.5*sin(t)')
        set(handles.ParameterName3,'TooltipString',' disturbance')
        set(handles.ParameterEdit3,'TooltipString',' disturbance')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','x_d')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterName4,'TooltipString','Ideal Position Signal')
        set(handles.ParameterEdit4,'TooltipString','Desired Trajectory')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','C_T')
        set(handles.ParameterEdit5,'String','[15 1]')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','q')
        set(handles.ParameterEdit6,'String','0.80')
        set(handles.ParameterName6,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','D')
        set(handles.ParameterEdit7,'String','1.5')
        set(handles.ParameterName7,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','InitialStateVector')
        set(handles.ParameterEdit8,'String','[0.15;0]')
        set(handles.ParameterName8,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit8,'TooltipString','Initial State Vector')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','ts')
        set(handles.ParameterEdit9,'String','0.001')
        set(handles.ParameterName9,'TooltipString','Sampling Time')
        set(handles.ParameterEdit9,'TooltipString','Unit: s')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','[0,0,0,0]' )
        set(handles.ParameterName10,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit10,'TooltipString','[Rolling angle,Rolling rate,vehicle_position,vehicle velocity]')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking' ; 'Control Input' ; 'e' ; 'de' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking' ; 'e' ; 'de' ; 'Control Input' }) 
        handles.FunctionHandleParameterString='@(t)';     
    case 'Based on Disturbance Observer'
        handles.File = './chap4_2/chap4_2.m' ;
        addpath('./chap4_2')
        %
        set(handles.ParameterName1,'String','A')
        set(handles.ParameterEdit1,'String','[1,0.001;0,0.9753]')
        set(handles.ParameterName1,'TooltipString','State (or system) matrix')
        set(handles.ParameterEdit1,'TooltipString','State (or system) matrix')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','B')
        set(handles.ParameterEdit2,'String','[0.0001;0.1314]')
        set(handles.ParameterName2,'TooltipString','input matrix')
        set(handles.ParameterEdit2,'TooltipString','input matrix')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','d_k')
        set(handles.ParameterEdit3,'String','1.5*sin(2*pi*t)')
        set(handles.ParameterName3,'TooltipString',' disturbance')
        set(handles.ParameterEdit3,'TooltipString',' disturbance')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','x_d')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterName4,'TooltipString','Ideal Position Signal')
        set(handles.ParameterEdit4,'TooltipString','Desired Trajectory')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','C_T')
        set(handles.ParameterEdit5,'String','[15 1]')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','q')
        set(handles.ParameterEdit6,'String','0.80')
        set(handles.ParameterName6,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','g')
        set(handles.ParameterEdit7,'String','1.5')
        set(handles.ParameterName7,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','m')
        set(handles.ParameterEdit8,'String','0.01')
        set(handles.ParameterName8,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Positive Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','InitialStateVector')
        set(handles.ParameterEdit9,'String','[0.5;0]')
        set(handles.ParameterName9,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit9,'TooltipString','Initial State Vector')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','ts')
        set(handles.ParameterEdit10,'String','0.001' )
        set(handles.ParameterName10,'TooltipString','Sampling Time')
        set(handles.ParameterEdit10,'TooltipString','Unit: s')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking' ; 'Control Input' ; 'd,ed' ; 'e' ; 'de' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking' ; 'Control Input' ; 'd,ed' ; 'e' ; 'de' }) 
        handles.FunctionHandleParameterString='@(t)';
    case 'Based on Dynamic Switching Functions'
        handles.File = './chap5_1/chap5_1sim' ;
        addpath('./chap5_1')
        set(handles.ParameterName1,'String','x2dot')
        set(handles.ParameterEdit1,'String','-25*x2+133*u+3*sin(t)')
        set(handles.ParameterName1,'TooltipString','Second State Derivative')
        set(handles.ParameterEdit1,'TooltipString','Second State Equation')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','r')
        set(handles.ParameterEdit2,'String','sin(t)')
        set(handles.ParameterName2,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit2,'TooltipString','Desired Trajectory')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','on')
        set(handles.FakeEqual2,'Visible','on')
        %
        set(handles.ParameterName3,'String','Lambda')
        set(handles.ParameterEdit3,'String','15')
        set(handles.ParameterName3,'TooltipString','Design Parameter')
        set(handles.ParameterEdit3,'TooltipString','Design Parameter')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','D_0')
        set(handles.ParameterEdit4,'String','3')
        set(handles.ParameterName4,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit4,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','D')
        set(handles.ParameterEdit5,'String','3')
        set(handles.ParameterName5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','c')
        set(handles.ParameterEdit6,'String','15')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','InitialStateVector')
        set(handles.ParameterEdit7,'String','[0.5,0]')
        set(handles.ParameterName7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','[0.5;0]')
        set(handles.ParameterName8,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit8,'TooltipString','Initial State Vector')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','[0.5 0]')
        set(handles.ParameterName9,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit9,'TooltipString','Initial State Vector')
        set(handles.ParameterName9,'Visible','off')
        set(handles.ParameterEdit9,'Visible','off')
        set(handles.FakeEqual9,'Visible','off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','[0,0,0,0]' )
        set(handles.ParameterName10,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit10,'TooltipString','[Rolling angle,Rolling rate,vehicle_position,vehicle velocity]')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking' ; 'Derivative of Control Input' ; 'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking' ; 'Derivative of Control Input' ; 'Control Input' }) 
        handles.FunctionHandleParameterString='@(t,x2,u)';
    case 'for Mechanical Systems'
        handles.File = './chap6_1/chap6_1sim' ;
        addpath('./chap6_1')
        %
        set(handles.ParameterName1,'String','m')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Unknown Moment Inertia and a constant value')
        set(handles.ParameterEdit1,'TooltipString','Known Smoothing functions')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','delta_0')
        set(handles.ParameterEdit2,'String','0.5*tetadot+1.5*sign(tetadot)')
        set(handles.ParameterName2,'TooltipString','Uncertainty Including Matched and Unmatched Disturbances')
        set(handles.ParameterEdit2,'TooltipString','Uncertainty Including Matched and Unmatched Disturbances')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','y_d')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName3,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit3,'TooltipString','Desired Trajectory')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','teta_min')
        set(handles.ParameterEdit4,'String','0.5')
        set(handles.ParameterName4,'TooltipString','The lower bound of the Uncertain parameter')
        set(handles.ParameterEdit4,'TooltipString','The lower bound of the Uncertain parameter')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','teta_max')
        set(handles.ParameterEdit5,'String','1.5')
        set(handles.ParameterName5,'TooltipString','The lower bound of the uncertain parameter')
        set(handles.ParameterEdit5,'TooltipString','The lower bound of the uncertain parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','c')
        set(handles.ParameterEdit6,'String','15')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','K_s')
        set(handles.ParameterEdit7,'String','15')
        set(handles.ParameterName7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','gama')
        set(handles.ParameterEdit8,'String','500')
        set(handles.ParameterName8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','[0.5,0]')
        set(handles.ParameterName8,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit8,'TooltipString','Initial State Vector')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','[0.5,0]')
        set(handles.ParameterName9,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit9,'TooltipString','Initial State Vector')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','[0,0,0,0]' )
        set(handles.ParameterName10,'TooltipString','[teta,tata dot,x,x_dot]')
        set(handles.ParameterEdit10,'TooltipString','[Rolling angle,Rolling rate,vehicle_position,vehicle velocity]')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterName11,'TooltipString','Selector')
        set(handles.ParameterEdit11,'TooltipString','Selector')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterName12,'TooltipString','Design Parameter')
        set(handles.ParameterEdit12,'TooltipString','Design Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Position Tracking Error';'Control Input';'J and its estimate' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Position Tracking Error';'Control Input';'J and its estimate' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'for Inverted Pendulum'
        handles.File = './chap6_2/chap6_2sim' ;
        addpath('./chap6_2')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','0.5')
        set(handles.ParameterName1,'TooltipString','Cart Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m_p')
        set(handles.ParameterEdit2,'String','0.5')
        set(handles.ParameterName2,'TooltipString','Pendulum mass')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.3')
        set(handles.ParameterName3,'TooltipString',' half of pendulum length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','dt')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterName4,'TooltipString',' Outer Disturbance')
        set(handles.ParameterEdit4,'TooltipString','Outer Disturbance')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','teta_d')
        set(handles.ParameterEdit5,'String','0.1*sin(t)')
        set(handles.ParameterName5,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit5,'TooltipString','Desired Trajectory')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','c')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterName6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','delta_0')
        set(handles.ParameterEdit7,'String','15')
        set(handles.ParameterName7,'TooltipString','Uncertainty Including Matched and Unmatched Disturbances')
        set(handles.ParameterEdit7,'TooltipString','Uncertainty Including Matched and Unmatched Disturbances')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','gama_1')
        set(handles.ParameterEdit8,'String','150')
        set(handles.ParameterName8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','gama_2')
        set(handles.ParameterEdit9,'String','150')
        set(handles.ParameterName9,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','gama_3')
        set(handles.ParameterEdit10,'String','150')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')    
        %
        set(handles.ParameterName11,'String','initialstatesoftheplant')
        set(handles.ParameterEdit11,'String','[0.01,0]')
        set(handles.ParameterName11,'TooltipString','Initial States of the Plant')
        set(handles.ParameterEdit11,'TooltipString','Initial States of the Plant')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','InitialStatesOfPhi')
        set(handles.ParameterEdit12,'String','[0,0,0]')
        set(handles.ParameterName12,'TooltipString','Initial States Of Phi')
        set(handles.ParameterEdit12,'TooltipString','Initial States Of Phi')
        set(handles.ParameterName12,'Visible','On')
        set(handles.ParameterEdit12,'Visible','On')
        set(handles.FakeEqual12,'Visible','On')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Position Tracking Error';'Control Input';'Phi 1 estimation';'Phi 2 estimation';'Phi 3 estimation' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Position Tracking Error';'Control Input';'Phi 1 estimation';'Phi 2 estimation';'Phi 3 estimation' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Terminal'
        handles.File = './chap7_1/chap7_1sim' ;
        addpath('./chap7_1')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Mass of Vehicle')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m_p')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString','Pendulum mass')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.3')
        set(handles.ParameterName3,'TooltipString',' half of pendulum length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','dt')
        set(handles.ParameterEdit4,'String','3*sin(2*pi*t)')
        set(handles.ParameterName4,'TooltipString',' Outer Disturbance')
        set(handles.ParameterEdit4,'TooltipString','Outer Disturbance')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','x_d')
        set(handles.ParameterEdit5,'String','sin(t)')
        set(handles.ParameterName5,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit5,'TooltipString','Desired Trajectory')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','C')
        set(handles.ParameterEdit6,'String','[4,1]')
        set(handles.ParameterName6,'TooltipString','Designed Controller Vector')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','delta_0')
        set(handles.ParameterEdit7,'String','0.05')
        set(handles.ParameterName7,'TooltipString','Uncertainty Including Matched and Unmatched Disturbances')
        set(handles.ParameterEdit7,'TooltipString','Uncertainty Including Matched and Unmatched Disturbances')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','System_Initial_Condition')
        set(handles.ParameterEdit8,'String','[pi/60,0]')
        set(handles.ParameterName8,'TooltipString','System Initial Condition')
        set(handles.ParameterEdit8,'TooltipString','System Initial Condition')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
          %
        set(handles.ParameterName9,'String','T')
        set(handles.ParameterEdit9,'String','1')
        set(handles.ParameterName9,'TooltipString','Tracking Error Converges Time')
        set(handles.ParameterEdit9,'TooltipString','Tracking Error Converges Time')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','150')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')    
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','[0.01,0]')
        set(handles.ParameterName11,'TooltipString','Initial States of the Plant')
        set(handles.ParameterEdit11,'TooltipString','Initial States of the Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','[0,0,0]')
        set(handles.ParameterName12,'TooltipString','Initial States Of Phi')
        set(handles.ParameterEdit12,'TooltipString','Initial States Of Phi')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Position Tracking Error';'Control Input';'Speed Tracking';'Speed Tracking Error' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Position Tracking Error';'Control Input';'Speed Tracking';'Speed Tracking Error'}) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';     
    case 'Nonsingular Terminal'
        handles.File = './chap7_2/chap7_2sim' ;
        addpath('./chap7_2')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Mass of Vehicle')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString',' Mass of the Roll Pole')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString',' half of pendulum length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','dt')
        set(handles.ParameterEdit4,'String','3*sin(2*pi*t)')
        set(handles.ParameterName4,'TooltipString',' Outer Disturbance')
        set(handles.ParameterEdit4,'TooltipString','Outer Disturbance')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','p')
        set(handles.ParameterEdit5,'String','5')
        set(handles.ParameterName5,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit5,'TooltipString','Odd Numbers and More than q')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','q')
        set(handles.ParameterEdit6,'String','3')
        set(handles.ParameterName6,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit6,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','L')
        set(handles.ParameterEdit7,'String','5')
        set(handles.ParameterName7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','beta')
        set(handles.ParameterEdit8,'String','1.0')
        set(handles.ParameterName8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','etta')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterName9,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','M')
        set(handles.ParameterEdit10,'String','1')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')    
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','[0.01,0]')
        set(handles.ParameterName11,'TooltipString','Initial States of the Plant')
        set(handles.ParameterEdit11,'TooltipString','Initial States of the Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','[0,0,0]')
        set(handles.ParameterName12,'TooltipString','Initial States Of Phi')
        set(handles.ParameterEdit12,'TooltipString','Initial States Of Phi')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterName13,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit13,'TooltipString','Desired Trajectory')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'State Response';'Control Input';'x2';'x1' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'State Response';'Control Input';'x2';'x1' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Fast Terminal'
        handles.File = './chap7_3/chap7_3sim' ;
        addpath('./chap7_3')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Mass of Vehicle')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterName2,'TooltipString',' Mass of the Roll Pole')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString',' half of pendulum length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','dt')
        set(handles.ParameterEdit4,'String','0.3*sin(t)')
        set(handles.ParameterName4,'TooltipString','Disturbance')
        set(handles.ParameterEdit4,'TooltipString','Disturbance')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','x_d')
        set(handles.ParameterEdit5,'String','1.3*sin(t)')
        set(handles.ParameterName5,'TooltipString','Desired Position')
        set(handles.ParameterEdit5,'TooltipString','Desired Position')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','p')
        set(handles.ParameterEdit6,'String','3')
        set(handles.ParameterName6,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit6,'TooltipString','Odd Numbers and More than q')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','q')
        set(handles.ParameterEdit7,'String','1')
        set(handles.ParameterName7,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit7,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','p_0')
        set(handles.ParameterEdit8,'String','9')
        set(handles.ParameterName8,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit8,'TooltipString','Odd Numbers and More than q')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','q_0')
        set(handles.ParameterEdit9,'String','5')
        set(handles.ParameterName9,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','alpha_0')
        set(handles.ParameterEdit10,'String','2.0')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','beta_0')
        set(handles.ParameterEdit11,'String','1.0')
        set(handles.ParameterName11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','etta')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','On')
        set(handles.ParameterEdit12,'Visible','On')
        set(handles.FakeEqual12,'Visible','On')
        %
        set(handles.ParameterName13,'String','L')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','On')
        set(handles.ParameterEdit13,'Visible','On')
        set(handles.FakeEqual13,'Visible','On')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Control Input' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Control Input' }) 
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'High-Gain Observer'
        handles.File = './chap8_1/chap8_1sim' ;
        addpath('./chap8_1')
        %
        set(handles.ParameterName1,'String','dt')
        set(handles.ParameterEdit1,'String','sgn(x_2)')
        set(handles.ParameterName1,'TooltipString','Disturbance')
        set(handles.ParameterEdit1,'TooltipString','Disturbance')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','alpha_1')
        set(handles.ParameterEdit2,'String','6')
        set(handles.ParameterName2,'TooltipString','Constant')
        set(handles.ParameterEdit2,'TooltipString','Constant')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','alpha_2')
        set(handles.ParameterEdit3,'String','9')
        set(handles.ParameterName3,'TooltipString','Constant')
        set(handles.ParameterEdit3,'TooltipString','Constant')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','epsilon')
        set(handles.ParameterEdit4,'String','0.01')
        set(handles.ParameterName4,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit4,'TooltipString','Observer Parameter')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','Nothing')
        set(handles.ParameterEdit5,'String','1')
        set(handles.ParameterName5,'TooltipString','Mass of Vehicle')
        set(handles.ParameterEdit5,'TooltipString','kg')
        set(handles.ParameterName5,'Visible','Off')
        set(handles.ParameterEdit5,'Visible','Off')
        set(handles.FakeEqual5,'Visible','Off')
        %
        set(handles.ParameterName6,'String','Nothing')
        set(handles.ParameterEdit6,'String','0.1')
        set(handles.ParameterName6,'TooltipString',' Mass of the Roll Pole')
        set(handles.ParameterEdit6,'TooltipString','kg')
        set(handles.ParameterName6,'Visible','Off')
        set(handles.ParameterEdit6,'Visible','Off')
        set(handles.FakeEqual6,'Visible','Off')
        %
        set(handles.ParameterName7,'String','Nothing')
        set(handles.ParameterEdit7,'String','0.5')
        set(handles.ParameterName7,'TooltipString',' half of pendulum length')
        set(handles.ParameterEdit7,'TooltipString','m')
        set(handles.ParameterName7,'Visible','Off')
        set(handles.ParameterEdit7,'Visible','Off')
        set(handles.FakeEqual7,'Visible','Off')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','9')
        set(handles.ParameterName8,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit8,'TooltipString','Odd Numbers and More than q')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','5')
        set(handles.ParameterName9,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','2.0')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1.0')
        set(handles.ParameterName11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'x1 and its estimate';'x2 and its estimate' ; 'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'x1 and its estimate';'x2 and its estimate' })
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'High-Gain Observer SMC'
        handles.File = './chap8_2/chap8_2sim' ;
        addpath('./chap8_2')
        %
        set(handles.ParameterName1,'String','d')
        set(handles.ParameterEdit1,'String','5*sin(t)')
        set(handles.ParameterName1,'TooltipString','Total Ucertainties')
        set(handles.ParameterEdit1,'TooltipString','Total Ucertainties')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','J')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterName2,'TooltipString','Equivalent Inertia')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','teta_d')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName3,'TooltipString','Ideal Signal')
        set(handles.ParameterEdit3,'TooltipString','Ideal Signal')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','C')
        set(handles.ParameterEdit4,'String','50')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','k_1')
        set(handles.ParameterEdit5,'String','3')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','k_2')
        set(handles.ParameterEdit6,'String','2')
        set(handles.ParameterName6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','l')
        set(handles.ParameterEdit8,'String','1.5')
        set(handles.ParameterName8,'TooltipString',' Designed Control Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','5')
        set(handles.ParameterName9,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','2.0')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1.0')
        set(handles.ParameterName11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'x1 and x1 estimate';'x2 and x2 estimate';'Control Input' ;'Time' })
        set(handles.HorizontalAxis,'String',{ 'Time' ; 'x1 and x1 estimate';'x2 and x2 estimate';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'E 8_3'
        handles.File = './chap8_3/chap8_3sim' ;
        addpath('./chap8_3')
        %
        set(handles.ParameterName1,'String','d')
        set(handles.ParameterEdit1,'String','3*sin(t)')
        set(handles.ParameterName1,'TooltipString','Total Ucertainties')
        set(handles.ParameterEdit1,'TooltipString','Total Ucertainties')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','J')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterName2,'TooltipString','Equivalent Inertia')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','teta_d')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName3,'TooltipString','Ideal Signal')
        set(handles.ParameterEdit3,'TooltipString','Ideal Signal')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','alpha_1')
        set(handles.ParameterEdit4,'String','6')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','alpha_1')
        set(handles.ParameterEdit5,'String','11')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','alpha_3')
        set(handles.ParameterEdit6,'String','2')
        set(handles.ParameterName6,'TooltipString','Conventional Gain')
        set(handles.ParameterEdit6,'TooltipString','Conventional Gain')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','u')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterName8,'TooltipString','Input Signal')
        set(handles.ParameterEdit8,'TooltipString','Input Signal')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','5')
        set(handles.ParameterName9,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','2.0')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1.0')
        set(handles.ParameterName11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'R Change';'Epsilon Change';'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'R Change';'Epsilon Change'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Extended State Observer'
        handles.File = './chap8_4/chap8_4sim' ;
        addpath('./chap8_4')
        %
        set(handles.ParameterName1,'String','d')
        set(handles.ParameterEdit1,'String','3*sin(t)')
        set(handles.ParameterName1,'TooltipString','Total Ucertainties')
        set(handles.ParameterEdit1,'TooltipString','Total Ucertainties')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','J')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterName2,'TooltipString','Equivalent Inertia')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','teta_d')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName3,'TooltipString','Ideal Signal')
        set(handles.ParameterEdit3,'TooltipString','Ideal Signal')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','alpha_1')
        set(handles.ParameterEdit4,'String','6')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','alpha_1')
        set(handles.ParameterEdit5,'String','11')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','alpha_3')
        set(handles.ParameterEdit6,'String','2')
        set(handles.ParameterName6,'TooltipString','Conventional Gain')
        set(handles.ParameterEdit6,'TooltipString','Conventional Gain')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','u')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterName8,'TooltipString','Input Signal')
        set(handles.ParameterEdit8,'TooltipString','Input Signal')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','5')
        set(handles.ParameterName9,'TooltipString','Sliding Variable')
        set(handles.ParameterEdit9,'TooltipString','Designed Controller Vector')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','2.0')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','1.0')
        set(handles.ParameterName11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit11,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'x1 and x1 estimat';'x2 and x2 estimate';'x3 and x3 estimate';'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'x1 and x1 estimat';'x2 and x2 estimate';'x3 and x3 estimate'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Extended State Observer SMC'
        handles.File = './chap8_5/chap8_5sim' ;
        addpath('./chap8_5')
        %

        set(handles.ParameterName1,'String','d')
        set(handles.ParameterEdit1,'String','3*sin(t)')
        set(handles.ParameterName1,'TooltipString','Total Ucertainties')
        set(handles.ParameterEdit1,'TooltipString','Total Ucertainties')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','J')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterName2,'TooltipString','Equivalent Inertia')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','teta_d')
        set(handles.ParameterEdit3,'String','0.1*sin(t)')
        set(handles.ParameterName3,'TooltipString','Ideal Signal')
        set(handles.ParameterEdit3,'TooltipString','Ideal Signal')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','alpha_1')
        set(handles.ParameterEdit4,'String','6')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','alpha_2')
        set(handles.ParameterEdit5,'String','11')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','alpha_3')
        set(handles.ParameterEdit6,'String','6')
        set(handles.ParameterName6,'TooltipString','Conventional Gain')
        set(handles.ParameterEdit6,'TooltipString','Conventional Gain')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','u')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterName8,'TooltipString','Input Signal')
        set(handles.ParameterEdit8,'TooltipString','Input Signal')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','c')
        set(handles.ParameterEdit9,'String','10')
        set(handles.ParameterName9,'TooltipString','Positive Constant')
        set(handles.ParameterEdit9,'TooltipString','Positive Constant')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','l')
        set(handles.ParameterEdit10,'String','0.5')
        set(handles.ParameterName10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','f')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Speed Tracking';'Control Input';'Time' })
        set(handles.HorizontalAxis,'String',{  'Time' ; 'Position Tracking';'Speed Tracking';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Integral-Chain Differentiator'
        handles.File = './chap8_6/chap8_6sim' ;
        addpath('./chap8_6')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One half of the Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','alpha_1')
        set(handles.ParameterEdit4,'String','10')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','alpha_2')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','alpha_3')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterName6,'TooltipString','Conventional Gain')
        set(handles.ParameterEdit6,'TooltipString','Conventional Gain')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','u')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterName8,'TooltipString','Input Signal')
        set(handles.ParameterEdit8,'TooltipString','Input Signal')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','c')
        set(handles.ParameterEdit9,'String','10')
        set(handles.ParameterName9,'TooltipString','Positive Constant')
        set(handles.ParameterEdit9,'TooltipString','Positive Constant')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','InitialState')
        set(handles.ParameterEdit10,'String','[pi/60 0]')
        set(handles.ParameterName10,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit10,'TooltipString','Initial State Vector')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Estimated';'Speed Estimated';'Acceleration Estimated';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ; 'Position Estimated';'Speed Estimated';'Acceleration Estimated'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Integral-Chain Differentiator SMC'
        handles.File = './chap8_7/chap8_7sim' ;
        addpath('./chap8_7')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One half of the Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','alpha_1')
        set(handles.ParameterEdit4,'String','10')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','alpha_2')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','alpha_3')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterName6,'TooltipString','Conventional Gain')
        set(handles.ParameterEdit6,'TooltipString','Conventional Gain')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','y_d')
        set(handles.ParameterEdit8,'String','0.1*sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Desired Trajectory')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','k1')
        set(handles.ParameterEdit9,'String','20')
        set(handles.ParameterName9,'TooltipString','Positive Constant')
        set(handles.ParameterEdit9,'TooltipString','Positive Constant')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','k2')
        set(handles.ParameterEdit10,'String','20')
        set(handles.ParameterName10,'TooltipString','Positive Constant')
        set(handles.ParameterEdit10,'TooltipString','Positive Constant')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{'Position Tracking';'fx and its estimation';'Control Input';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ; 'Position Tracking';'fx and its estimation';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Slow Time-Varying Disturbance Observer'
        handles.File = './chap8_8/chap8_8sim' ;
        addpath('./chap8_8')
        %
        set(handles.ParameterName1,'String','a')
        set(handles.ParameterEdit1,'String','5')
        set(handles.ParameterName1,'TooltipString','Input Function of Plan')
        set(handles.ParameterEdit1,'TooltipString','Input Function of Plan')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','b')
        set(handles.ParameterEdit2,'String','0.15')
        set(handles.ParameterName2,'TooltipString','System Function of Plant')
        set(handles.ParameterEdit2,'TooltipString','System Function of Plant')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','d')
        set(handles.ParameterEdit3,'String','150*sin(0.1*t)')
        set(handles.ParameterName3,'TooltipString','Disturbance')
        set(handles.ParameterEdit3,'TooltipString','Disturbance')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','k_1')
        set(handles.ParameterEdit4,'String','500')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','k_2')
        set(handles.ParameterEdit5,'String','200')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','Nothing')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterName6,'TooltipString','Conventional Gain')
        set(handles.ParameterEdit6,'TooltipString','Conventional Gain')
        set(handles.ParameterName6,'Visible','Off')
        set(handles.ParameterEdit6,'Visible','Off')
        set(handles.FakeEqual6,'Visible','Off')
        %
        set(handles.ParameterName7,'String','Nothing')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterName7,'TooltipString','Observer Parameter')
        set(handles.ParameterEdit7,'TooltipString','Observer Parameter')
        set(handles.ParameterName7,'Visible','Off')
        set(handles.ParameterEdit7,'Visible','Off')
        set(handles.FakeEqual7,'Visible','Off')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.1*sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Desired Trajectory')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','20')
        set(handles.ParameterName9,'TooltipString','Positive Constant')
        set(handles.ParameterEdit9,'TooltipString','Positive Constant')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','20')
        set(handles.ParameterName10,'TooltipString','Positive Constant')
        set(handles.ParameterEdit10,'TooltipString','Positive Constant')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        % 
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'd and its estimate' ;'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'d and its estimate'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Disturbance Observer SMC'
        handles.File = './chap8_9/chap8_9sim' ;
        addpath('./chap8_9')
        %
        set(handles.ParameterName1,'String','a')
        set(handles.ParameterEdit1,'String','5')
        set(handles.ParameterName1,'TooltipString','Input Function of Plan')
        set(handles.ParameterEdit1,'TooltipString','Input Function of Plan')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','b')
        set(handles.ParameterEdit2,'String','0.15')
        set(handles.ParameterName2,'TooltipString','System Function of Plant')
        set(handles.ParameterEdit2,'TooltipString','System Function of Plant')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','d')
        set(handles.ParameterEdit3,'String','150*sin(0.5*t)')
        set(handles.ParameterName3,'TooltipString','Disturbance')
        set(handles.ParameterEdit3,'TooltipString','Disturbance')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','k_1')
        set(handles.ParameterEdit4,'String','500')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive Constat')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','k_2')
        set(handles.ParameterEdit5,'String','200')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','teta_d')
        set(handles.ParameterEdit6,'String','sin(t)')
        set(handles.ParameterName6,'TooltipString','Desired Position Trajectory')
        set(handles.ParameterEdit6,'TooltipString','Desired Position Trajectory')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','etta')
        set(handles.ParameterEdit7,'String','5.0')
        set(handles.ParameterName7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','c')
        set(handles.ParameterEdit8,'String','15')
        set(handles.ParameterName8,'TooltipString','Posetive Designed Controller Parameter')
        set(handles.ParameterEdit8,'TooltipString','Posetive Designed Controller Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','delta')
        set(handles.ParameterEdit9,'String','0.10')
        set(handles.ParameterName9,'TooltipString','Boundary Layer')
        set(handles.ParameterEdit9,'TooltipString','Boundary Layer')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','20')
        set(handles.ParameterName10,'TooltipString','Positive Constant')
        set(handles.ParameterEdit10,'TooltipString','Positive Constant')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Speed Tracking';'d and its estimate';'Error Between d and its estimate';'Control Input';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'Position Tracking';'Speed Tracking';'d and its estimate';'Error Between d and its estimate';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Delayed Output Observer'
        handles.File = './chap8_10/chap8_10sim' ;
        addpath('./chap8_10')
        %
        set(handles.ParameterName1,'String','A')
        set(handles.ParameterEdit1,'String','[0 1;-1 -10]')
        set(handles.ParameterName1,'TooltipString','State (or system) Matrix')
        set(handles.ParameterEdit1,'TooltipString','State (or system) Matrix')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','C')
        set(handles.ParameterEdit2,'String','[1 0]')
        set(handles.ParameterName2,'TooltipString','Output Matrix')
        set(handles.ParameterEdit2,'TooltipString','Output Matrix')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','u')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName3,'TooltipString','Input signal')
        set(handles.ParameterEdit3,'TooltipString','Input signal')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','delta')
        set(handles.ParameterEdit4,'String','3')
        set(handles.ParameterName4,'TooltipString','Posetive designed Controller Parameter')
        set(handles.ParameterEdit4,'TooltipString','Posetive designed Controller Parameter')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','K')
        set(handles.ParameterEdit5,'String','[10 -1]')
        set(handles.ParameterName5,'TooltipString','Designed Control Matrix make A-K*C Hurwitz')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Matrix make A-K*C Hurwitz')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','InitialStateVector')
        set(handles.ParameterEdit6,'String','[0.20 0]')
        set(handles.ParameterName6,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit6,'TooltipString','Initial State Vector')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','InitialObserverVector')
        set(handles.ParameterEdit7,'String','[0.0 0]')
        set(handles.ParameterName7,'TooltipString','Initial Observer Vector')
        set(handles.ParameterEdit7,'TooltipString','Initial Observer Vector')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.1*sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Desired Trajectory')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','20')
        set(handles.ParameterName9,'TooltipString','Positive Constant')
        set(handles.ParameterEdit9,'TooltipString','Positive Constant')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','20')
        set(handles.ParameterName10,'TooltipString','Positive Constant')
        set(handles.ParameterEdit10,'TooltipString','Positive Constant')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'x1 and its estimation';'x2 and its estimation';'Error of x1 and its estimation';'Error of x2 and its estimation';'x1 and delayed x1';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'x1 and its estimation';'x2 and its estimation';'Error of x1 and its estimation';'Error of x2 and its estimation';'x1 and delayed x1'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Delayed Output Observer SMC'
        handles.File = './chap8_11/chap8_11sim' ;
        addpath('./chap8_11')
        %
        set(handles.ParameterName1,'String','u')
        set(handles.ParameterEdit1,'String','sin(t)')
        set(handles.ParameterName1,'TooltipString','Input signal')
        set(handles.ParameterEdit1,'TooltipString','Input signal')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','delta')
        set(handles.ParameterEdit2,'String','3')
        set(handles.ParameterName2,'TooltipString','Posetive designed Controller Parameter')
        set(handles.ParameterEdit2,'TooltipString','Posetive designed Controller Parameter')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','a')
        set(handles.ParameterEdit3,'String','10')
        set(handles.ParameterName3,'TooltipString','Posetive designed Controller Parameter')
        set(handles.ParameterEdit3,'TooltipString','Posetive designed Controller Parameter')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','K')
        set(handles.ParameterEdit4,'String','[10 -1]')
        set(handles.ParameterName4,'TooltipString','Designed Control Matrix make A-K*C Hurwitz')
        set(handles.ParameterEdit4,'TooltipString','Designed Control Matrix make A-K*C Hurwitz')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','InitialStateVector')
        set(handles.ParameterEdit5,'String','[0.20 0]')
        set(handles.ParameterName5,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit5,'TooltipString','Initial State Vector')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','InitialObserverVector')
        set(handles.ParameterEdit6,'String','[0.0 0]')
        set(handles.ParameterName6,'TooltipString','Initial Observer Vector')
        set(handles.ParameterEdit6,'TooltipString','Initial Observer Vector')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','Nothing')
        set(handles.ParameterEdit7,'String','0.1*sin(pi*t)')
        set(handles.ParameterName7,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit7,'TooltipString','Desired Trajectory')
        set(handles.ParameterName7,'Visible','Off')
        set(handles.ParameterEdit7,'Visible','Off')
        set(handles.FakeEqual7,'Visible','Off')
        %
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.1*sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Desired Trajectory')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','20')
        set(handles.ParameterName9,'TooltipString','Positive Constant')
        set(handles.ParameterEdit9,'TooltipString','Positive Constant')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','20')
        set(handles.ParameterName10,'TooltipString','Positive Constant')
        set(handles.ParameterEdit10,'TooltipString','Positive Constant')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking signal';'Speed Tracking';'x1 and its estimation';'x1 and its delayed';'x2 and its estimation';'x2 and its delayed';'Control Input';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'Position Tracking signal';'Speed Tracking';'x1 and its estimation';'x1 and its delayed';'x2 and its estimation';'x2 and its delayed';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on Equivalent Control'
        handles.File = './chap9_1/chap9_1sim' ;
        addpath('./chap9_1')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One half of the Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','d')
        set(handles.ParameterEdit4,'String','5*exp((-(t-c_i)^2)/2*((b_i)^2))')
        set(handles.ParameterName4,'TooltipString','Gaussian Disturbance')
        set(handles.ParameterEdit4,'TooltipString','Gaussian Disturbance')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','b_i')
        set(handles.ParameterEdit5,'String','0.5')
        set(handles.ParameterName5,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterEdit5,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','c_i')
        set(handles.ParameterEdit6,'String','5')
        set(handles.ParameterName6,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterEdit6,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','etta')
        set(handles.ParameterEdit7,'String','0.15')
        set(handles.ParameterName7,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','x_d')
        set(handles.ParameterEdit8,'String','sin(pi*t)')
        set(handles.ParameterName8,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit8,'TooltipString','Desired Trajectory')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','c')
        set(handles.ParameterEdit9,'String','25')
        set(handles.ParameterName9,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit9,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','mu')
        set(handles.ParameterEdit10,'String','1')
        set(handles.ParameterName10,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        % 
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'Position Tracking Error';'Control Input';'Disturbance';'Membership function degree';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'Position Tracking';'Position Tracking Error';'Control Input';'Disturbance';'Membership function degree'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on Fuzzy Switch-Gain Regulation'
        handles.File = './chap9_2/chap9_2sim' ;
        addpath('./chap9_2')
        %
        set(handles.ParameterName1,'String','f')
        set(handles.ParameterEdit1,'String','25*tetadot')
        set(handles.ParameterName1,'TooltipString','System Function')
        set(handles.ParameterEdit1,'TooltipString','System Function')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','b')
        set(handles.ParameterEdit2,'String','133')
        set(handles.ParameterName2,'TooltipString','System input Function')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','E')
        set(handles.ParameterEdit3,'String','200*exp((-(t-c_i)^2)/2*((b_i)^2))')
        set(handles.ParameterName3,'TooltipString','Uncertainty')
        set(handles.ParameterEdit3,'TooltipString','Uncertainty')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','b_i')
        set(handles.ParameterEdit4,'String','0.5')
        set(handles.ParameterName4,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterEdit4,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','c_i')
        set(handles.ParameterEdit5,'String','5')
        set(handles.ParameterName5,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterEdit5,'TooltipString','Parameter Gaussian of Disturbance')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','etta')
        set(handles.ParameterEdit6,'String','0.15')
        set(handles.ParameterName6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','teta_d')
        set(handles.ParameterEdit7,'String','sin(2*pi*t)')
        set(handles.ParameterName7,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit7,'TooltipString','Desired Trajectory')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','c')
        set(handles.ParameterEdit8,'String','150')
        set(handles.ParameterName8,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.3*sin(t)')
        set(handles.ParameterName9,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit9,'TooltipString','Function of System Plant')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','1')
        set(handles.ParameterName10,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit10,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Function of System Plant')
        set(handles.ParameterEdit11,'TooltipString','Function of System Plant')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'E and estimated K';'Control Input';'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'Position Tracking';'E and estimated K';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on Fuzzy System Approximation'
        handles.File = './chap9_3/chap9_3sim' ;
        addpath('./chap9_3')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum')
        set(handles.ParameterEdit2,'TooltipString','N.ms^2/rad')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One half of the Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','teta_d')
        set(handles.ParameterEdit4,'String','0.1*sin(t)')
        set(handles.ParameterName4,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit4,'TooltipString','Desired Trajectory')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','k_1')
        set(handles.ParameterEdit5,'String','20')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','k_2')
        set(handles.ParameterEdit6,'String','5')
        set(handles.ParameterName6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','etta')
        set(handles.ParameterEdit7,'String','0.1')
        set(handles.ParameterName7,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','gama')
        set(handles.ParameterEdit8,'String','0.05')
        set(handles.ParameterName8,'TooltipString','Adaptive Control Parameter')
        set(handles.ParameterEdit8,'TooltipString','Adaptive Control Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','InitialState')
        set(handles.ParameterEdit9,'String','[pi/60 0]')
        set(handles.ParameterName9,'TooltipString','Initial State')
        set(handles.ParameterEdit9,'TooltipString','Initial State')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','teta_f')
        set(handles.ParameterEdit10,'String','0.1')
        set(handles.ParameterName10,'TooltipString','Target')
        set(handles.ParameterEdit10,'TooltipString','Target')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Target')
        set(handles.ParameterEdit11,'TooltipString','Target')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'fx and estiamted fx';'Control Input'; 'Time' })
        set(handles.HorizontalAxis,'String',{'Time' ;'Position Tracking';'fx and estiamted fx';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on Fuzzy Compensation for Manipulator'
        handles.File = './chap9_4/chap9_4sim' ;
        addpath('./chap9_4')
        %
        set(handles.ParameterName1,'String','m_1')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Mass of Link 1')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m_2')
        set(handles.ParameterEdit2,'String','1.5')
        set(handles.ParameterName2,'TooltipString','Mass of Link 2')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','r_1')
        set(handles.ParameterEdit3,'String','1')
        set(handles.ParameterName3,'TooltipString','Lengths of Link 1')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','r_2')
        set(handles.ParameterEdit4,'String','0.8')
        set(handles.ParameterName4,'TooltipString','Lengths of Link 2')
        set(handles.ParameterEdit4,'TooltipString','m')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','Lambda_1')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','Lambda_2')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterName6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','K_D')
        set(handles.ParameterEdit7,'String','20*[1 0;0 1]')
        set(handles.ParameterName7,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit7,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','gama_1')
        set(handles.ParameterEdit8,'String','0.0001')
        set(handles.ParameterName8,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit8,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','gama_2')
        set(handles.ParameterEdit9,'String','0.001')
        set(handles.ParameterName9,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit9,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','InitialState')
        set(handles.ParameterEdit10,'String','[0 0 0 0]')
        set(handles.ParameterName10,'TooltipString','Initial State')
        set(handles.ParameterEdit10,'TooltipString','Initial State')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','y_d1')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterName11,'TooltipString','Desired Trajectories of Link 1')
        set(handles.ParameterEdit11,'TooltipString','Desired Trajectories of Link 1')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','y_d2')
        set(handles.ParameterEdit12,'String','0.3*sin(t)')
        set(handles.ParameterName12,'TooltipString','Desired Trajectories of Link 2')
        set(handles.ParameterEdit12,'TooltipString','Desired Trajectories of Link 2')
        set(handles.ParameterName12,'Visible','On')
        set(handles.ParameterEdit12,'Visible','On')
        set(handles.FakeEqual12,'Visible','On')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking of link1';'Position Tracking of link2';'F and Fc of link1';'F and Fc of link2';'Control Input of Link1';'Control Input of Link2';'Time' })
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking of link1';'Position Tracking of link2';'F and Fc of link1';'F and Fc of link2';'Control Input of Link1';'Control Input of Link2'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on Switching Fuzzy'
        handles.File = './chap9_5/chap9_5sim' ;
        addpath('./chap9_5')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One half of the Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','x_d')
        set(handles.ParameterEdit4,'String','0.1*sin(t)')
        set(handles.ParameterName4,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit4,'TooltipString','Desired Trajectory')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','k_1')
        set(handles.ParameterEdit5,'String','30')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','InitialState')
        set(handles.ParameterEdit6,'String','[-pi/60 0]')
        set(handles.ParameterName6,'TooltipString','Initial State')
        set(handles.ParameterEdit6,'TooltipString','Initial State')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','d')
        set(handles.ParameterEdit7,'String','10*sin(t)')
        set(handles.ParameterName7,'TooltipString','Disturbance')
        set(handles.ParameterEdit7,'TooltipString','Disturbance')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        %
        set(handles.ParameterName8,'String','gama')
        set(handles.ParameterEdit8,'String','5')
        set(handles.ParameterName8,'TooltipString','Adaptive Parameter')
        set(handles.ParameterEdit8,'TooltipString','Adaptive Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','teta_h')
        set(handles.ParameterEdit9,'String','[0.1 0.1 0.1]')
        set(handles.ParameterName9,'TooltipString','Optimization Vector(Parameter) ')
        set(handles.ParameterEdit9,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterName10,'TooltipString','Adaptive Control Parameter')
        set(handles.ParameterEdit10,'TooltipString','Adaptive Control Parameter')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Target')
        set(handles.ParameterEdit11,'TooltipString','Target')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'h and estiamted h';'Control Input'; 'Time'})
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking';'h and estiamted h';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Based on RBF Neural Network Approximation'
        handles.File = './chap10_1/chap10_1sim' ;
        addpath('./chap10_1')
        %
        set(handles.ParameterName1,'String','m_c')
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterName1,'TooltipString','Vehicle Mass')
        set(handles.ParameterEdit1,'TooltipString','kg')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','m')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterName2,'TooltipString','Mass of Pendulum')
        set(handles.ParameterEdit2,'TooltipString','kg')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','l')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterName3,'TooltipString','One half of the Pendulum Length')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','teta_d')
        set(handles.ParameterEdit4,'String','0.1*sin(t)')
        set(handles.ParameterName4,'TooltipString','Desired Trajectory')
        set(handles.ParameterEdit4,'TooltipString','Desired Trajectory')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','c')
        set(handles.ParameterEdit5,'String','15')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','etta')
        set(handles.ParameterEdit6,'String','0.1')
        set(handles.ParameterName6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','InitialState')
        set(handles.ParameterEdit7,'String','[pi/60 0]')
        set(handles.ParameterName7,'TooltipString','Initial State')
        set(handles.ParameterEdit7,'TooltipString','Initial State')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        % 
        set(handles.ParameterName8,'String','gama')
        set(handles.ParameterEdit8,'String','0.55')
        set(handles.ParameterName8,'TooltipString','Adaptive Parameter')
        set(handles.ParameterEdit8,'TooltipString','Adaptive Parameter')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','c_ij')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterName9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName9,'Visible','On')
        set(handles.ParameterEdit9,'Visible','On')
        set(handles.FakeEqual9,'Visible','On')
        %
        set(handles.ParameterName10,'String','b_ij')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterName10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName10,'Visible','On')
        set(handles.ParameterEdit10,'Visible','On')
        set(handles.FakeEqual10,'Visible','On')
        %
        set(handles.ParameterName11,'String','initialWeight')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Initial value of RBF weight ')
        set(handles.ParameterEdit11,'TooltipString','Initial value of RBF weigh')
        set(handles.ParameterName11,'Visible','On')
        set(handles.ParameterEdit11,'Visible','On')
        set(handles.FakeEqual11,'Visible','On')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking';'fx and estiamted fx';'Control Input'; 'Time'})
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking';'fx and estiamted fx';'Control Input'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'RBF Network Adaptive SMC for Manipulator'
        handles.File = './chap10_2/chap10_2sim' ;
        addpath('./chap10_2')
        %
        set(handles.ParameterName1,'String','InitialState')
        set(handles.ParameterEdit1,'String','[0.09 0 -0.09 0]')
        set(handles.ParameterName1,'TooltipString','Initial State')
        set(handles.ParameterEdit1,'TooltipString','Initial State')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','q_1d')
        set(handles.ParameterEdit2,'String','0.1*sin(t)')
        set(handles.ParameterName2,'TooltipString','Desired position of the first joints')
        set(handles.ParameterEdit2,'TooltipString','Desired position of the first joints')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','q_2d')
        set(handles.ParameterEdit3,'String','0.1*sin(t)')
        set(handles.ParameterName3,'TooltipString','Desired position of the second joints')
        set(handles.ParameterEdit3,'TooltipString','m')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','K_v')
        set(handles.ParameterEdit4,'String','[20,0;0,20]')
        set(handles.ParameterName4,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit4,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','f_w')
        set(handles.ParameterEdit5,'String','[15,0;0,15]')
        set(handles.ParameterName5,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit5,'TooltipString','Positive Matrix')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','alpha')
        set(handles.ParameterEdit6,'String','[5,0;0,5]')
        set(handles.ParameterName6,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','epsilon_n')
        set(handles.ParameterEdit7,'String','0.20')
        set(handles.ParameterName7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName7,'Visible','On')
        set(handles.ParameterEdit7,'Visible','On')
        set(handles.FakeEqual7,'Visible','On')
        % 
        set(handles.ParameterName8,'String','b_d')
        set(handles.ParameterEdit8,'String','0.10')
        set(handles.ParameterName8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName8,'Visible','On')
        set(handles.ParameterEdit8,'Visible','On')
        set(handles.FakeEqual8,'Visible','On')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterName9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterName10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Initial value of RBF weight ')
        set(handles.ParameterEdit11,'TooltipString','Initial value of RBF weigh')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking of link1';'Position Tracking of link2';'Speed Tracking of link1';'Speed Tracking of link2';'Control Input of Link1';'Control Input of Link2';'f and fn'; 'Time'})
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking of link1';'Position Tracking of link2';'Speed Tracking of link1';'Speed Tracking of link2';'Control Input of Link1';'Control Input of Link2';'f and fn'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Sliding Mode Control Based on Input-Output Stability'
        handles.File = './chap11_1/chap11_1sim' ;
        addpath('./chap11_1')
        %
        set(handles.ParameterName1,'String','q_1d')
        set(handles.ParameterEdit1,'String','sin(2*pi*t)')
        set(handles.ParameterName1,'TooltipString','Desired position of the first joints')
        set(handles.ParameterEdit1,'TooltipString','Desired position of the first joints')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','q_2d')
        set(handles.ParameterEdit2,'String','sin(2*pi*t)')
        set(handles.ParameterName2,'TooltipString','Desired position of the second joints')
        set(handles.ParameterEdit2,'TooltipString','Desired position of the second joints')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','Lambda')
        set(handles.ParameterEdit3,'String','[5,0;0,5]')
        set(handles.ParameterName3,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit3,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','delta')
        set(handles.ParameterEdit4,'String','0.05')
        set(handles.ParameterName4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit4,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','Nothing')
        set(handles.ParameterEdit5,'String','[15,0;0,15]')
        set(handles.ParameterName5,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit5,'TooltipString','Positive Matrix')
        set(handles.ParameterName5,'Visible','Off')
        set(handles.ParameterEdit5,'Visible','Off')
        set(handles.FakeEqual5,'Visible','Off')
        %
        set(handles.ParameterName6,'String','Nothing')
        set(handles.ParameterEdit6,'String','[5,0;0,5]')
        set(handles.ParameterName6,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName6,'Visible','Off')
        set(handles.ParameterEdit6,'Visible','Off')
        set(handles.FakeEqual6,'Visible','Off')
        %
        set(handles.ParameterName7,'String','Nothing')
        set(handles.ParameterEdit7,'String','0.20')
        set(handles.ParameterName7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName7,'Visible','Off')
        set(handles.ParameterEdit7,'Visible','Off')
        set(handles.FakeEqual7,'Visible','Off')
        % 
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.10')
        set(handles.ParameterName8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterName9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterName10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Initial value of RBF weight ')
        set(handles.ParameterEdit11,'TooltipString','Initial value of RBF weigh')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{'Position Tracking of link1';'Position Tracking of link2';'Speed Tracking of link1';'Speed Tracking of link2';'Control Input of Link1';'Control Input of Link2'; 'Time'})
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking of link1';'Position Tracking of link2';'Speed Tracking of link1';'Speed Tracking of link2';'Control Input of Link1';'Control Input of Link2'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Sliding Mode Control Based on Computed Torque Method'
        handles.File = './chap11_2/chap11_2sim' ;
        addpath('./chap11_2')
        %
        set(handles.ParameterName1,'String','q_1d')
        set(handles.ParameterEdit1,'String','sin(t)')
        set(handles.ParameterName1,'TooltipString','Desired position of the first joints')
        set(handles.ParameterEdit1,'TooltipString','Desired position of the first joints')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','q_2d')
        set(handles.ParameterEdit2,'String','sin(t)')
        set(handles.ParameterName2,'TooltipString','Desired position of the second joints')
        set(handles.ParameterEdit2,'TooltipString','Desired position of the second joints')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','Lambda')
        set(handles.ParameterEdit3,'String','[25,0;0,25]')
        set(handles.ParameterName3,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit3,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','InitialState')
        set(handles.ParameterEdit4,'String','[0 0 0 0]')
        set(handles.ParameterName4,'TooltipString','Initial State')
        set(handles.ParameterEdit4,'TooltipString','Initial State')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','etta')
        set(handles.ParameterEdit5,'String','0.1')
        set(handles.ParameterName5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit5,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName5,'Visible','On')
        set(handles.ParameterEdit5,'Visible','On')
        set(handles.FakeEqual5,'Visible','On')
        %
        set(handles.ParameterName6,'String','d_hat')
        set(handles.ParameterEdit6,'String','30')
        set(handles.ParameterName6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Parameter')
        set(handles.ParameterName6,'Visible','On')
        set(handles.ParameterEdit6,'Visible','On')
        set(handles.FakeEqual6,'Visible','On')
        %
        set(handles.ParameterName7,'String','Nothing')
        set(handles.ParameterEdit7,'String','0.20')
        set(handles.ParameterName7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName7,'Visible','Off')
        set(handles.ParameterEdit7,'Visible','Off')
        set(handles.FakeEqual7,'Visible','Off')
        % 
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.10')
        set(handles.ParameterName8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterName9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterName10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Initial value of RBF weight ')
        set(handles.ParameterEdit11,'TooltipString','Initial value of RBF weigh')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        % 
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking of joint 1';'Position Tracking of joint 2';'Control Input 1';'Control Input 2'; 'Time'})
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking of joint 1';'Position Tracking of joint 2';'Control Input 1';'Control Input 2'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)';
    case 'Adaptive Sliding Mode Control for Manipulator'
        handles.File = './chap11_3/chap11_3sim' ;
        addpath('./chap11_3')
        %
        set(handles.ParameterName1,'String','q_1d')
        set(handles.ParameterEdit1,'String','sin(2*pi*t)')
        set(handles.ParameterName1,'TooltipString','Desired position of the first joints')
        set(handles.ParameterEdit1,'TooltipString','Desired position of the first joints')
        set(handles.ParameterName1,'Visible','On')
        set(handles.ParameterEdit1,'Visible','On')
        set(handles.FakeEqual1,'Visible','On')
        %
        set(handles.ParameterName2,'String','q_2d')
        set(handles.ParameterEdit2,'String','sin(2*pi*t)')
        set(handles.ParameterName2,'TooltipString','Desired position of the second joints')
        set(handles.ParameterEdit2,'TooltipString','Desired position of the second joints')
        set(handles.ParameterName2,'Visible','On')
        set(handles.ParameterEdit2,'Visible','On')
        set(handles.FakeEqual2,'Visible','On')
        %
        set(handles.ParameterName3,'String','Lambda')
        set(handles.ParameterEdit3,'String','[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1]')
        set(handles.ParameterName3,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit3,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName3,'Visible','On')
        set(handles.ParameterEdit3,'Visible','On')
        set(handles.FakeEqual3,'Visible','On')
        %
        set(handles.ParameterName4,'String','K_d')
        set(handles.ParameterEdit4,'String','[100,0;0,100]')
        set(handles.ParameterName4,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit4,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName4,'Visible','On')
        set(handles.ParameterEdit4,'Visible','On')
        set(handles.FakeEqual4,'Visible','On')
        %
        set(handles.ParameterName5,'String','Nothing')
        set(handles.ParameterEdit5,'String','[15,0;0,15]')
        set(handles.ParameterName5,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit5,'TooltipString','Positive Matrix')
        set(handles.ParameterName5,'Visible','Off')
        set(handles.ParameterEdit5,'Visible','Off')
        set(handles.FakeEqual5,'Visible','Off')
        %
        set(handles.ParameterName6,'String','Nothing')
        set(handles.ParameterEdit6,'String','[5,0;0,5]')
        set(handles.ParameterName6,'TooltipString','Designed Control Matrix')
        set(handles.ParameterEdit6,'TooltipString','Designed Control Matrix')
        set(handles.ParameterName6,'Visible','Off')
        set(handles.ParameterEdit6,'Visible','Off')
        set(handles.FakeEqual6,'Visible','Off')
        %
        set(handles.ParameterName7,'String','Nothing')
        set(handles.ParameterEdit7,'String','0.20')
        set(handles.ParameterName7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit7,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName7,'Visible','Off')
        set(handles.ParameterEdit7,'Visible','Off')
        set(handles.FakeEqual7,'Visible','Off')
        % 
        set(handles.ParameterName8,'String','Nothing')
        set(handles.ParameterEdit8,'String','0.10')
        set(handles.ParameterName8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterEdit8,'TooltipString','Sliding Robust Element')
        set(handles.ParameterName8,'Visible','Off')
        set(handles.ParameterEdit8,'Visible','Off')
        set(handles.FakeEqual8,'Visible','Off')
        %
        set(handles.ParameterName9,'String','Nothing')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterName9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit9,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName9,'Visible','Off')
        set(handles.ParameterEdit9,'Visible','Off')
        set(handles.FakeEqual9,'Visible','Off')
        %
        set(handles.ParameterName10,'String','Nothing')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterName10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterEdit10,'TooltipString','Structure Parameter of RBF')
        set(handles.ParameterName10,'Visible','Off')
        set(handles.ParameterEdit10,'Visible','Off')
        set(handles.FakeEqual10,'Visible','Off')
        %
        set(handles.ParameterName11,'String','Nothing')
        set(handles.ParameterEdit11,'String','0.1')
        set(handles.ParameterName11,'TooltipString','Initial value of RBF weight ')
        set(handles.ParameterEdit11,'TooltipString','Initial value of RBF weigh')
        set(handles.ParameterName11,'Visible','Off')
        set(handles.ParameterEdit11,'Visible','Off')
        set(handles.FakeEqual11,'Visible','Off')
        %
        set(handles.ParameterName12,'String','Nothing')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterName12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit12,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName12,'Visible','Off')
        set(handles.ParameterEdit12,'Visible','Off')
        set(handles.FakeEqual12,'Visible','Off')
        %
        set(handles.ParameterName13,'String','Nothing')
        set(handles.ParameterEdit13,'String','0.3')
        set(handles.ParameterName13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterEdit13,'TooltipString','Designed Controller Parameter')
        set(handles.ParameterName13,'Visible','Off')
        set(handles.ParameterEdit13,'Visible','Off')
        set(handles.FakeEqual13,'Visible','Off')
        %
        set(handles.ParameterName14,'String','Nothing')
        set(handles.ParameterEdit14,'String','[0.5 0]')
        set(handles.ParameterName14,'TooltipString','Initial State Vector')
        set(handles.ParameterEdit14,'TooltipString','Initial State Vector')
        set(handles.ParameterName14,'Visible','Off')
        set(handles.ParameterEdit14,'Visible','Off')
        set(handles.FakeEqual14,'Visible','Off')
        %
        set(handles.ParameterName15,'String','Nothing')
        set(handles.ParameterEdit15,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'TooltipString','B')
        set(handles.ParameterEdit15,'TooltipString','10+3*sin(2*pi*t)')
        set(handles.ParameterName15,'Visible','Off')
        set(handles.ParameterEdit15,'Visible','Off')
        set(handles.FakeEqual15,'Visible','Off')
        %
        set(handles.VerticalAxis,'String',{ 'Position Tracking of link1';'Position Tracking of link2';'Speed Tracking of link1';'Speed Tracking of link2';'alfa estimation';'beta estimation';'epc estimation';'eta estimation'; 'Time'})
        set(handles.HorizontalAxis,'String',{'Time';'Position Tracking of link1';'Position Tracking of link2';'Speed Tracking of link1';'Speed Tracking of link2';'alfa estimation';'beta estimation';'epc estimation';'eta estimation'})
        handles.FunctionHandleParameterString='@(t,x1,x2,x3,x4,x5,e,de,dde,ddde,yd,dyd,ddyd,dddyd,res1,res2,res3,res4,res5)'; 
end
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns SolutionSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SolutionSelector

% --- Executes during object creation, after setting all properties.
function SolutionSelector_CreateFcn(hObject, eventdata, handles)
handles.File = './chap2_1/chap2_1sim' ;
addpath('./chap2_1')
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.FunctionHandleParameterString='@(t)';
global SetParameterFlag
SetParameterFlag = 0 ;
guidata(hObject, handles);

function SetParameter_Callback(hObject, eventdata, handles)
clc;
assignin('base','RunTime',str2double(get(handles.RunTimeEdit,'String')));
for i = 1 : 15
    if get(handles.(['ParameterEdit' num2str(i)]),'Visible')
        if isempty(str2num(get(handles.(['ParameterEdit' num2str(i)]),'string')))
            FunctionHandleValueString = [ handles.FunctionHandleParameterString get(handles.(['ParameterEdit' num2str(i)]),'string')] ;
            ParameterValue = str2func( FunctionHandleValueString ) ;
        else
            FunctionHandleValueString = get(handles.(['ParameterEdit' num2str(i)]),'string') ;
            ParameterValue = str2num( FunctionHandleValueString ) ;
        end
        ParameterName = get(handles.(['ParameterName' num2str(i)]),'String') ;
        if ~strcmp( ParameterName , 'Nothing' )
            eval(['global ',ParameterName]);
            eval([ParameterName,'=',FunctionHandleValueString]);
            assignin('base', ParameterName , ParameterValue );
        end
    end
end
global SetParameterFlag
SetParameterFlag = 1 ;
set(handles.StatusLine,'String','Your entered parameters have been successfully set please "Start"!')

% --- Executes on button press in DefaultParameters.
function DefaultParameters_Callback(hObject, eventdata, handles)
% hObject    handle to DefaultParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
contents = cellstr(get(handles.SolutionSelector,'String')) ;
switch contents{get(handles.SolutionSelector,'Value')}
    case 'Nominal Model'
        set(handles.ParameterEdit1,'String','10+3*sin(2*pi*t)')
        set(handles.ParameterEdit2,'String','3+0.5*sin(2*pi*t)')
        set(handles.ParameterEdit3,'String','10*sin(t)')
        set(handles.ParameterEdit4,'String','10')
        set(handles.ParameterEdit5,'String','3')
        set(handles.ParameterEdit6,'String','7')
        set(handles.ParameterEdit7,'String','13')
        set(handles.ParameterEdit8,'String','2.5')
        set(handles.ParameterEdit9,'String','3.5')
        set(handles.ParameterEdit10,'String','10')
        set(handles.ParameterEdit11,'String','3.0')
        set(handles.ParameterEdit12,'String','10')
        set(handles.ParameterEdit13,'String','sin(t)')
        set(handles.ParameterEdit14,'String','[0.5 0]')
    case 'for an Uncertain System'
        set(handles.ParameterEdit1,'String','1.0+0.2*sin(t)')
        set(handles.ParameterEdit2,'String','0.1*sin(2*pi*t)')
        set(handles.ParameterEdit3,'String','0.80')
        set(handles.ParameterEdit4,'String','1.2')
        set(handles.ParameterEdit5,'String','0.10')
        set(handles.ParameterEdit6,'String','sin(t)')
        set(handles.ParameterEdit7,'String','10')
        set(handles.ParameterEdit8,'String','2')
        set(handles.ParameterEdit9,'String','0.05')
        set(handles.ParameterEdit10,'String','[pi/6 0]')
    case 'Linearization Feedback'
        set(handles.ParameterEdit1,'String','1.0')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','9.8')
        set(handles.ParameterEdit5,'String','5')
        set(handles.ParameterEdit6,'String','5')
        set(handles.ParameterEdit7,'String','0.1*sin(pi*t)')
        set(handles.ParameterEdit8,'String','[pi/60 0]')
    case 'Linearization Feedback SMC'
        set(handles.ParameterEdit1,'String','1.0')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','9.8')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterEdit6,'String','0.03')
        set(handles.ParameterEdit7,'String','5')
        set(handles.ParameterEdit8,'String','0.10*sin(pi*t)')
        set(handles.ParameterEdit9,'String','[-pi/60 0]')
        set(handles.ParameterEdit10,'String','10*sin(t)' )
        set(handles.ParameterEdit11,'String','1')
        set(handles.ParameterEdit12,'String','10')
    case 'Input-Output Feedback Linearization'
        set(handles.ParameterEdit1,'String','sin(x2)+(x2+1)*x3')
        set(handles.ParameterEdit2,'String','x1^5+x3')
        set(handles.ParameterEdit3,'String','x1^2+ut')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterEdit5,'String','[0.15 0 0]')
        set(handles.ParameterEdit6,'String','(x1^5+x3)*(x3+cos(x2))+(x2+1)*x1^2')
        set(handles.ParameterEdit7,'String','ddyd+k1*e+k2*de')
        set(handles.ParameterEdit8,'String','10')
        set(handles.ParameterEdit9,'String','10')
        set(handles.ParameterEdit10,'String','1.0/(x2+1)*(v-f)' )
    case 'Input-Output Feedback Linearization SMC'
        set(handles.ParameterEdit1,'String','sin(t)')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterEdit3,'String','3.0')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterEdit5,'String','sin(t)')
        set(handles.ParameterEdit6,'String','sin(t)')
        set(handles.ParameterEdit7,'String','[0.15 0 0]')
        %
    case 'Based on Low Pass Filter'
        set(handles.ParameterName1,'String','J')
        set(handles.ParameterEdit1,'String','10')
        set(handles.ParameterName2,'String','d_t')
        set(handles.ParameterEdit2,'String','3.0*sin(t)')
        set(handles.ParameterName3,'String','r')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterName4,'String','Lambda')
        set(handles.ParameterEdit4,'String','25')
        set(handles.ParameterName5,'String','Lambda_1')
        set(handles.ParameterEdit5,'String','30')
        set(handles.ParameterName6,'String','Lambda_2')
        set(handles.ParameterEdit6,'String','30')
        set(handles.ParameterName7,'String','InitialStateVector')
        set(handles.ParameterEdit7,'String','[0.5;0]')
        set(handles.ParameterName8,'String','etta')
        set(handles.ParameterEdit8,'String','80')
        %
    case 'Linear Matrix Inequality for Inverted Pendulum'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','20')
        set(handles.ParameterEdit5,'String','0.3')
        set(handles.ParameterEdit6,'String','0.15')
        set(handles.ParameterEdit7,'String','0.05')
        set(handles.ParameterEdit8,'String','[-pi/3 0 5 0]')
        set(handles.ParameterEdit9,'String','sin(t)')
        set(handles.ParameterEdit10,'String','[7.4496 1.2493 1.0782 1.1384; 1.2493 0.3952 0.2108 0.3252; 1.0782 0.2108 0.3854 0.2280; 1.1384 0.3252 0.2280 0.4286]')
        
    case 'E 3_2'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','20')
        set(handles.ParameterEdit5,'String','0.3')
        set(handles.ParameterEdit6,'String','0.15')
        set(handles.ParameterEdit7,'String','0.5')
        set(handles.ParameterEdit8,'String','[-pi/6 0 5 0]')
        set(handles.ParameterEdit9,'String','sin(t)')
        set(handles.ParameterEdit10,'String','[0 0 0 0]')
    case 'Backstepping SMC for Inverted Pendulum'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','0.1*sin(pi*t)')
        set(handles.ParameterEdit5,'String','35')
        set(handles.ParameterEdit6,'String','15')
        set(handles.ParameterEdit7,'String','[-pi/60 0]')

    case 'Discrete'
        set(handles.ParameterEdit1,'String','[1,0.001;0,0.9753]')
        set(handles.ParameterEdit2,'String','[0.0001;0.1314]')
        set(handles.ParameterEdit3,'String','1.5*sin(t)')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterEdit5,'String','[15 1]')
        set(handles.ParameterEdit6,'String','0.80')
        set(handles.ParameterEdit7,'String','1.5')
        set(handles.ParameterEdit8,'String','[0.15;0]')
        set(handles.ParameterEdit9,'String','0.001')
        
    case 'Based on Disturbance Observer'
        set(handles.ParameterEdit1,'String','[1,0.001;0,0.9753]')
        set(handles.ParameterEdit2,'String','[0.0001;0.1314]')
        set(handles.ParameterEdit3,'String','1.5*sin(2*pi*t)')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterEdit5,'String','[15 1]')
        set(handles.ParameterEdit6,'String','0.80')
        set(handles.ParameterEdit7,'String','1.5')
        set(handles.ParameterEdit8,'String','0.01')
        set(handles.ParameterEdit9,'String','[0.5;0]')
        set(handles.ParameterEdit9,'String','0.001')
        
    case 'Based on Dynamic Switching Functions'
        set(handles.ParameterEdit1,'String','-25*x2+133*u+3*sin(t)')
        set(handles.ParameterEdit2,'String','15')
        set(handles.ParameterEdit3,'String','3')
        set(handles.ParameterEdit4,'String','3')
        set(handles.ParameterEdit5,'String','15')
        set(handles.ParameterEdit6,'String','[0.5,0]')
                
    case 'for Mechanical Systems'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.5*tetadot+1.5*sign(tetadot)')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterEdit4,'String','0.5')
        set(handles.ParameterEdit5,'String','1.5')
        set(handles.ParameterEdit6,'String','15')
        set(handles.ParameterEdit7,'String','15')
        
    case 'for Inverted Pendulum'
        set(handles.ParameterEdit1,'String','0.5')
        set(handles.ParameterEdit2,'String','0.5')
        set(handles.ParameterEdit3,'String','0.3')
        set(handles.ParameterEdit4,'String','sin(t)')
        set(handles.ParameterEdit5,'String','0.1*sin(t)')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterEdit7,'String','15')
        set(handles.ParameterEdit8,'String','150')
        set(handles.ParameterEdit9,'String','150')
        set(handles.ParameterEdit10,'String','150')
        set(handles.ParameterEdit11,'String','[0.01,0]')
        set(handles.ParameterEdit12,'String','[0,0,0]')
        
    case 'Terminal'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.3')
        set(handles.ParameterEdit4,'String','3*sin(2*pi*t)')
        set(handles.ParameterEdit5,'String','sin(t)')
        set(handles.ParameterEdit6,'String','[4,1]')
        set(handles.ParameterEdit7,'String','0.05')
        set(handles.ParameterEdit8,'String','[pi/60,0]')
        set(handles.ParameterEdit9,'String','1')
        
    case 'Nonsingular Terminal'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','3*sin(2*pi*t)')
        set(handles.ParameterEdit5,'String','5')
        set(handles.ParameterEdit6,'String','3')
        set(handles.ParameterEdit7,'String','5')
        set(handles.ParameterEdit8,'String','1.0')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterEdit10,'String','1')
    case 'Fast Terminal'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','0.3*sin(t)')
        set(handles.ParameterEdit5,'String','1.3*sin(t)')
        set(handles.ParameterEdit6,'String','3')
        set(handles.ParameterEdit7,'String','1')
        set(handles.ParameterEdit8,'String','9')
        set(handles.ParameterEdit9,'String','5')
        set(handles.ParameterEdit10,'String','2.0')
        set(handles.ParameterEdit11,'String','1.0')
        set(handles.ParameterEdit12,'String','0.10')
        set(handles.ParameterEdit13,'String','0.3')
        
    case 'High-Gain Observer'
        set(handles.ParameterEdit1,'String','sgn(x_2)')
        set(handles.ParameterEdit2,'String','6')
        set(handles.ParameterEdit3,'String','9')
        set(handles.ParameterEdit4,'String','0.01')
        
    case 'High-Gain Observer SMC'
        set(handles.ParameterEdit1,'String','5*sin(t)')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterEdit4,'String','50')
        set(handles.ParameterEdit5,'String','3')
        set(handles.ParameterEdit6,'String','2')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterEdit8,'String','1.5')
        
    case 'E 8_3'
        set(handles.ParameterEdit1,'String','3*sin(t)')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterEdit4,'String','6')
        set(handles.ParameterEdit5,'String','11')
        set(handles.ParameterEdit6,'String','2')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
    case 'Extended State Observer'
        set(handles.ParameterEdit1,'String','3*sin(t)')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterEdit4,'String','6')
        set(handles.ParameterEdit5,'String','11')
        set(handles.ParameterEdit6,'String','2')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        
    case 'Extended State Observer SMC'
        set(handles.ParameterEdit1,'String','3*sin(t)')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterEdit3,'String','0.1*sin(t)')
        set(handles.ParameterEdit4,'String','6')
        set(handles.ParameterEdit5,'String','11')
        set(handles.ParameterEdit6,'String','6')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterEdit9,'String','10')
        set(handles.ParameterEdit10,'String','0.5')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        
    case 'Integral-Chain Differentiator'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','10')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterEdit9,'String','10')
        set(handles.ParameterEdit10,'String','10')
        set(handles.ParameterEdit11,'String','[pi/60,0]')
        
    case 'Integral-Chain Differentiator SMC'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','10')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterEdit7,'String','0.01')
        set(handles.ParameterEdit8,'String','0.1*sin(t)')
        set(handles.ParameterEdit9,'String','20')
        set(handles.ParameterEdit10,'String','20')
        
    case 'Slow Time-Varying Disturbance Observer'
        set(handles.ParameterEdit1,'String','5')
        set(handles.ParameterEdit2,'String','0.15')
        set(handles.ParameterEdit3,'String','150*sin(0.1*t)')
        set(handles.ParameterEdit4,'String','500')
        set(handles.ParameterEdit5,'String','200')
        
    case 'Disturbance Observer SMC'
        set(handles.ParameterEdit1,'String','5')
        set(handles.ParameterEdit2,'String','0.15')
        set(handles.ParameterEdit3,'String','150*sin(0.5*t)')
        set(handles.ParameterEdit4,'String','500')
        set(handles.ParameterEdit5,'String','200')
        set(handles.ParameterEdit6,'String','sin(t)')
        set(handles.ParameterEdit7,'String','5.0')
        set(handles.ParameterEdit8,'String','15')
        set(handles.ParameterEdit9,'String','0.10')
        
    case 'Delayed Output Observer'
        set(handles.ParameterEdit1,'String','[0 1;-1 -10]')
        set(handles.ParameterEdit2,'String','[1 0]')
        set(handles.ParameterEdit3,'String','sin(t)')
        set(handles.ParameterEdit4,'String','3')
        set(handles.ParameterEdit5,'String','[10 -1]')
        set(handles.ParameterEdit6,'String','[0.20 0]')
        set(handles.ParameterEdit7,'String','[0 0]')



    case 'Delayed Output Observer SMC'
        set(handles.ParameterEdit1,'String','sin(t)')
        set(handles.ParameterEdit2,'String','3')
        set(handles.ParameterEdit2,'String','10')
        set(handles.ParameterEdit3,'String','[10 -1]')
        set(handles.ParameterEdit4,'String','[0.20 0]')
        set(handles.ParameterEdit5,'String','[0.0 0.0]')

    case 'Based on Equivalent Control'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','5*exp((-(t-c_i)^2)/2*((b_i)^2))')
        set(handles.ParameterEdit5,'String','0.5')
        set(handles.ParameterEdit6,'String','5')
        set(handles.ParameterEdit7,'String','0.15')
        set(handles.ParameterEdit8,'String','sin(pi*t)')
        set(handles.ParameterEdit9,'String','25')
        set(handles.ParameterEdit9,'String','1')
        
    case 'Based on Fuzzy Switch-Gain Regulation'
        set(handles.ParameterEdit1,'String','25*tetadot')
        set(handles.ParameterEdit2,'String','133')
        set(handles.ParameterEdit3,'String','200*exp((-(t-c_i)^2)/2*((b_i)^2))')
        set(handles.ParameterEdit4,'String','0.5')
        set(handles.ParameterEdit5,'String','5')
        set(handles.ParameterEdit6,'String','0.15')
        set(handles.ParameterEdit7,'String','sin(pi*t)')
        set(handles.ParameterEdit8,'String','150')
     
    case 'Based on Fuzzy System Approximation'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.10')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','0.1*sin(t)')
        set(handles.ParameterEdit5,'String','20')
        set(handles.ParameterEdit6,'String','5')
        set(handles.ParameterEdit7,'String','0.1')
        set(handles.ParameterEdit8,'String','0.05')
        set(handles.ParameterEdit9,'String','[pi/60 0]')
        set(handles.ParameterEdit10,'String','0.1')
        
    case 'Based on Fuzzy Compensation for Manipulator'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','1.5')
        set(handles.ParameterEdit3,'String','1')
        set(handles.ParameterEdit4,'String','0.8')
        set(handles.ParameterEdit5,'String','10')
        set(handles.ParameterEdit6,'String','10')
        set(handles.ParameterEdit7,'String','20*[1 0;0 1]')
        set(handles.ParameterEdit8,'String','0.0001')
        set(handles.ParameterEdit9,'String','0.001')
        set(handles.ParameterEdit10,'String','[0 0 0 0]')
        set(handles.ParameterEdit11,'String','0.3*sin(t)')
        set(handles.ParameterEdit12,'String','0.3*sin(t)')
        
    case 'Based on Switching Fuzzy'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','0.1*sin(t)')
        set(handles.ParameterEdit5,'String','30')
        set(handles.ParameterEdit6,'String','[-pi/60 0]')
        set(handles.ParameterEdit7,'String','10*sin(t)')
        set(handles.ParameterEdit8,'String','5')
        set(handles.ParameterEdit9,'String','[0.1 0.1 0.1]')
        
    case 'Based on RBF Neural Network Approximation'
        set(handles.ParameterEdit1,'String','1')
        set(handles.ParameterEdit2,'String','0.1')
        set(handles.ParameterEdit3,'String','0.5')
        set(handles.ParameterEdit4,'String','0.1*sin(t)')
        set(handles.ParameterEdit5,'String','15')
        set(handles.ParameterEdit6,'String','0.1')
        set(handles.ParameterEdit7,'String','[-pi/60 0]')
        set(handles.ParameterEdit8,'String','0.55')
        set(handles.ParameterEdit9,'String','0.20')
        set(handles.ParameterEdit10,'String','0.05')
        set(handles.ParameterEdit11,'String','0.1')
        
    case 'RBF Network Adaptive SMC for Manipulator'
        set(handles.ParameterEdit1,'String','[0.09 0 -0.09 0]')
        set(handles.ParameterEdit2,'String','0.1*sin(t)')
        set(handles.ParameterEdit3,'String','0.1*sin(t)')
        set(handles.ParameterEdit4,'String','[20,0;0,20]')
        set(handles.ParameterEdit5,'String','[15,0;0,15]')
        set(handles.ParameterEdit6,'String','[5,0;0,5]')
        set(handles.ParameterEdit7,'String','0.20')
        set(handles.ParameterEdit8,'String','0.10')

    case 'Sliding Mode Control Based on Input-Output Stability'
        set(handles.ParameterEdit1,'String','sin(2*pi*t)')
        set(handles.ParameterEdit2,'String','sin(2*pi*t)')
        set(handles.ParameterEdit3,'String','[5,0;0,5]')
        set(handles.ParameterEdit4,'String','0.05')

    case 'Sliding Mode Control Based on Computed Torque Method'
        set(handles.ParameterEdit1,'String','sin(t)')
        set(handles.ParameterEdit2,'String','sin(t)')
        set(handles.ParameterEdit3,'String','[25,0;0,25]')
        set(handles.ParameterEdit4,'String','[0 0 0 0]')
        set(handles.ParameterEdit5,'String','0.1')
        set(handles.ParameterEdit6,'String','30')
        
    case 'Adaptive Sliding Mode Control for Manipulator'
        set(handles.ParameterEdit1,'String','sin(2*pi*t)')
        set(handles.ParameterEdit2,'String','sin(2*pi*t)')
        set(handles.ParameterEdit3,'String','[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1]')
        set(handles.ParameterEdit4,'String','[100,0;0,100]')

               
end
assignin('base','RunTime',str2double(get(handles.RunTimeEdit,'String')));
for i = 1 : 15
    if get(handles.(['ParameterEdit' num2str(i)]),'Visible')
        if isempty(str2num(get(handles.(['ParameterEdit' num2str(i)]),'string')))
            FunctionHandleValueString = [ handles.FunctionHandleParameterString get(handles.(['ParameterEdit' num2str(i)]),'string') ] ;
            ParameterValue = str2func( FunctionHandleValueString ) ;
        else
            FunctionHandleValueString = get(handles.(['ParameterEdit' num2str(i)]),'string') ;
            ParameterValue = str2num( FunctionHandleValueString ) ;
        end
        ParameterName = get(handles.(['ParameterName' num2str(i)]),'String') ;
        if ~strcmp( ParameterName , 'Nothing' )
            eval(['global ',ParameterName]);
            eval([ParameterName,'=',FunctionHandleValueString]);
            assignin('base', ParameterName , ParameterValue );
        end
    end
end
global SetParameterFlag
SetParameterFlag = 1 ;
set(handles.StatusLine,'String','Default parameters have been successfully set please "Start"!')



% --- Executes on button press in StartButton.
function StartButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%

global SetParameterFlag InitialStateVector B_n J_n A B C_T q D ts d_k x_d m g p 
if ~SetParameterFlag
    h = msgbox('Please set the parameter then start!','Error');
    set(handles.StatusLine,'String','Please set the parameter then start!')
else
    set(handles.StatusLine,'String','Please Wait...')
    ContentsApprochSelector = cellstr(get(handles.SolutionSelector,'String')) ;
    switch ContentsApprochSelector{get(handles.SolutionSelector,'Value')}
        case 'Nominal Model'
            addpath('./chap2_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap2_1')
        case 'for an Uncertain System'
            addpath('./chap2_2');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','u','s')
            end
            handles.t=t;
            handles.u=u;
            handles.y=y;
            handles.s=s;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap2_2')
        case 'Linearization Feedback'
            handles.File
            addpath('./chap2_3');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Trackig' ;
            rmpath('./chap2_3')
        case 'Linearization Feedback SMC'
            addpath('./chap2_4');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap2_4')
        case 'Input-Output Feedback Linearization'
            addpath('./chap2_5');sim(handles.File);
            tol = y(:,1)-y(:,2) ;
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut','tol')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            handles.tol=tol;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap2_5')
        case 'Input-Output Feedback Linearization SMC'
            addpath('./chap2_6');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap2_6')
        case 'Based on Low Pass Filter'
            addpath('./chap2_7');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','u','tol')
            end
            handles.t=t;
            handles.u=u;
            handles.y=y;
            handles.tol=tol;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap2_7')
        case 'Linear Matrix Inequality for Inverted Pendulum'
            addpath('./chap3_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','x','ut','s')
            end
            handles.t=t;
            handles.ut=ut;
            handles.x=x;
            handles.s=s;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [];
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.x(:,1) ;
            handles.HoldOnVertical = [] ;
            handles.VerticalName = 'Angle Response' ;
            rmpath('./chap3_1')
        case 'E 3_2'
            addpath('./chap3_2');sim(handles.File);
           if get(handles.ExportResults,'Value')
                save('Results.mat','time','x1','x2','x3','x4','u')
            end
            handles.time=time;
            handles.u=u;
            handles.x1=x1;
            handles.x2=x2;
            handles.x3=x3;
            handles.x4=x4;
            %
            handles.Horizontal = handles.time ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.x1 ;
            handles.HoldOnVertical = [] ;
            handles.VerticalName = 'Angle' ;
            rmpath('./chap3_2')
        case 'Backstepping SMC for Inverted Pendulum'
            addpath('./chap3_3');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap3_3')
        case 'Discrete'
            addpath('./chap4_1')
            RunTime = str2double(get(handles.RunTimeEdit,'String'));
            [ Time , r , x1 , u , e , de ] = chap4_1( A, B, C_T, q, D, InitialStateVector, ts, d_k, x_d, RunTime );
            if get(handles.ExportResults,'Value')
                save('Results.mat','Time','r' , 'x1','u','e','de' , 'C_T' )
            end
            handles.Time=Time;
            handles.u=u;
            handles.r=r;
            handles.x1=x1;
            handles.e=e;
            handles.de=de;
            handles.C_T=C_T;
            %
            handles.Horizontal = handles.Time ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.r ;
            handles.HoldOnVertical = handles.x1 ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap4_1')
        case 'Based on Disturbance Observer'
            addpath('./chap4_2')
            RunTime = str2double(get(handles.RunTimeEdit,'String'));
            [ Time , xd , x1 , u , d , ed , e , de ] = chap4_2( A, B, C_T, m, g, q, InitialStateVector, ts, d_k, x_d, RunTime );
            if get(handles.ExportResults,'Value')
                save('Results.mat','Time','xd','u','x1','d','ed','e','de' , 'C_T' )
            end
            handles.Time=Time;
            handles.u=u;
            handles.xd=xd;
            handles.x1=x1;
            handles.d=d;
            handles.ed=ed;
            handles.de=de;
            handles.e=e;
            handles.C_T=C_T;
            %
            handles.Horizontal = handles.Time ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.xd ;
            handles.HoldOnVertical =  handles.x1 ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap4_2')
        case 'Based on Dynamic Switching Functions'
            addpath('./chap5_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','u','du')
            end
            handles.t=t;
            handles.u=u;
            handles.y=y;
            handles.du=du;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap5_1')
        case 'for Mechanical Systems'
            addpath('./chap6_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut','p')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            handles.p=p;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap6_1')
        case 'for Inverted Pendulum'
            addpath('./chap6_2');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut','fai')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            handles.fai=fai;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap6_2')
        case 'Terminal'
            addpath('./chap7_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
           %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap7_1')
        case 'Nonsingular Terminal'
            addpath('./chap7_2');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','x','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.x=x;
            handles.q=q;
            handles.p=p;

            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.x(:,1) ;
            handles.HoldOnVertical = handles.x(:,2) ;
            handles.VerticalName = 'State Response' ;
            rmpath('./chap7_2')
        case 'Fast Terminal'
            addpath('./chap7_3');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap7_3')
        case 'High-Gain Observer'
            addpath('./chap8_1');sim(handles.File); 
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','x')
            end
            handles.t=t;
            handles.x=x;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.x(:,1) ;
            handles.HoldOnVertical = handles.x(:,3) ;
            handles.VerticalName = 'x1 and its estimate' ;
            rmpath('./chap8_1')
        case 'High-Gain Observer SMC'
            addpath('./chap8_2');sim(handles.File); 
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,3) ;
            handles.VerticalName = 'x1 and x1 estimate' ;
            rmpath('./chap8_2')
       case 'E 8_3'
           addpath('./chap8_3');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y')
            end
            handles.t=t;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = [] ;
            handles.VerticalName = 'R Change' ;
            %
            rmpath('./chap8_3')
      case 'Extended State Observer'
            addpath('./chap8_4');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','x')
            end
            handles.t=t;
            handles.x=x;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.x(:,1) ;
            handles.HoldOnVertical = handles.x(:,4) ;
            handles.VerticalName = 'x1 and x1 estimate' ;
            rmpath('./chap8_4')
       case 'Extended State Observer SMC'
            addpath('./chap8_5');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','ut','y')
            end
            handles.t=t;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,3) ;
            handles.VerticalName = 'x1 and x1 estimate' ;
            rmpath('./chap8_5')
       case 'Integral-Chain Differentiator'
           addpath('./chap8_6');sim(handles.File); 
           if get(handles.ExportResults,'Value')
                save('Results.mat','t','x')
            end
            handles.t=t;
            handles.x=x;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.x(:,1) ;
            handles.HoldOnVertical = handles.x(:,3) ;
            handles.VerticalName = 'Speed Estimated' ;
            rmpath('./chap8_6')
       case 'Integral-Chain Differentiator SMC'
            addpath('./chap8_7');sim(handles.File);
           if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','ut','fx')
            end
            handles.t=t;
            handles.fx=fx;
            handles.y=y;
            handles.ut=ut;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap8_7')
       case 'Slow Time-Varying Disturbance Observer'
           addpath('./chap8_8');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','p')
            end
            handles.t=t;
            handles.p=p;

            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.p(:,3) ;
            handles.HoldOnVertical = handles.p(:,4) ;
            handles.VerticalName = 'd and its estimate' ;
            rmpath('./chap8_8')
       case 'Disturbance Observer SMC'
           addpath('./chap8_9');sim(handles.File); 
           if get(handles.ExportResults,'Value')
                save('Results.mat','t','p','y','ut')
            end
            handles.t=t;
            handles.p=p;
            handles.ut=ut;
            handles.y=y;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap8_9')
       case 'Delayed Output Observer'
            addpath('./chap8_10');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','p','p1')
            end
            handles.t=t;
            handles.p=p;
            handles.p1=p1;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.p(:,1) ;
            handles.HoldOnVertical = handles.p(:,3) ;
            handles.VerticalName = 'x1 and its estimation' ;
            rmpath('./chap8_10')
       case 'Delayed Output Observer SMC'
            addpath('./chap8_11');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','y1','ut')
            end
            handles.t=t;
            handles.y=y;
            handles.y1=y1;
            handles.ut=ut;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'thd and y' ;
            rmpath('./chap8_11')
       case 'Based on Equivalent Control'
           addpath('./chap9_1');sim(handles.File); 
           if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','d','ut','miu')
            end
            handles.t=t;
            handles.y=y;
            handles.d=d;
            handles.ut=ut;
            handles.miu=miu;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap9_1')
       case 'Based on Fuzzy Switch-Gain Regulation'
            addpath('./chap9_2');sim(handles.File);
                if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','E','ut')
            end
            handles.t=t;
            handles.y=y;
            handles.E=E;
            handles.ut=ut;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap9_2')
       case 'Based on Fuzzy System Approximation'
            addpath('./chap9_3');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','fx','u')
            end
            handles.t=t;
            handles.y=y;
            handles.fx=fx;
            handles.u=u;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap9_3')
       case 'Based on Fuzzy Compensation for Manipulator'
            addpath('./chap9_4');sim(handles.File);
           if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','yd1','u','yd2')
            end
            handles.t=t;
            handles.y=y;
            handles.yd1=yd1;
            handles.u=u;
            handles.yd2=yd2;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.yd1(:,1) ;
            handles.HoldOnVertical = handles.y(:,1) ;
            handles.VerticalName = 'Position Tracking of Link1' ;
            rmpath('./chap9_4')
    case 'Based on Switching Fuzzy'
            addpath('./chap9_5');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','h','ut')
            end
            handles.t=t;
            handles.y=y;
            handles.h=h;
            handles.ut=ut;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap9_5')
      case 'Based on RBF Neural Network Approximation'
            addpath('./chap10_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','u','fx')
            end
            handles.t=t;
            handles.y=y;
            handles.fx=fx;
            handles.u=u;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,2) ;
            handles.VerticalName = 'Position Tracking' ;
            rmpath('./chap10_1')
        case 'RBF Network Adaptive SMC for Manipulator'
            addpath('./chap10_2');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y','tol1','tol2')
            end
            handles.t=t;
            handles.y=y;
            handles.tol1=tol1;
            handles.tol2=tol2;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y(:,1) ;
            handles.HoldOnVertical = handles.y(:,7) ;
            handles.VerticalName = 'Position Tracking of Link 1' ;
            rmpath('./chap10_2')
        case 'Sliding Mode Control Based on Input-Output Stability'
            addpath('./chap11_1');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','qd','q','ut')
            end
            handles.t=t;
            handles.q=q;
            handles.qd=qd;
            handles.ut=ut;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.qd(:,1) ;
            handles.HoldOnVertical = handles.q(:,1) ;
            handles.VerticalName = 'Position Tracking of Link 1' ;
            rmpath('./chap11_1')
       case 'Sliding Mode Control Based on Computed Torque Method'
            addpath('./chap11_2');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','y1','y2','tol')
            end
            handles.t=t;
            handles.y1=y1;
            handles.y2=y2;
            handles.tol=tol;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.y1(:,1) ;
            handles.HoldOnVertical = handles.y1(:,2) ;
            handles.VerticalName = 'Position Tracking of Joint 1' ;
            rmpath('./chap11_2')
       case 'Adaptive Sliding Mode Control for Manipulator'
            addpath('./chap11_3');sim(handles.File);
            if get(handles.ExportResults,'Value')
                save('Results.mat','t','qd','q','p')
            end
            handles.t=t;
            handles.qd=qd;
            handles.q=q;
            handles.p=p;
            %
            handles.Horizontal = handles.t ;
            handles.HoldOnHorizontal = [] ;
            handles.HorizontalName = 'Time' ;
            %
            handles.Vertical = handles.qd(:,1) ;
            handles.HoldOnVertical = handles.q(:,1) ;
            handles.VerticalName = 'Position Tracking of Link 1' ;
            rmpath('./chap11_3')
    end
    evalin('base','global HandlesVertical');
    evalin('base','global HandlesHoldOnVertical');
    evalin('base','global HandlesHorizontal');
    evalin('base','global HandlesHoldOnHorizontal');
    assignin('base','HandlesVertical',handles.Vertical);
    assignin('base','HandlesHoldOnVertical',handles.HoldOnVertical);
    assignin('base','HandlesHorizontal',handles.Horizontal)
    assignin('base','HandlesHoldOnHorizontal', handles.HoldOnHorizontal);
    set(handles.VerticalAxis,'Value',1);%Resetting The Vertical Selector to the first value
    set(handles.HorizontalAxis,'Value',1);%Resetting The Horizontal Selector to the first value

    if ~isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
        plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.HoldOnVertical,'r:','linewidth',2);
        xlabel(handles.HorizontalName);ylabel(handles.VerticalName);            
        if ~get(handles.LegendStatus,'Value')
            legend('Ideal signal','tracking signal');
        end
        if get(handles.GridStatus,'Value')
            grid on
        end
    elseif ~isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
        plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.Vertical,'r:','linewidth',2);
        xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
        if ~get(handles.LegendStatus,'Value')
            legend('Ideal signal','tracking signal');
        end
        if get(handles.GridStatus,'Value')
            grid on
        end
    elseif isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
        plot(handles.Horizontal ,handles.Vertical,'k',handles.Horizontal ,handles.HoldOnVertical,'r:','linewidth',2);
        xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
        if ~get(handles.LegendStatus,'Value')
            legend('Ideal signal','tracking signal');
        end
        if get(handles.GridStatus,'Value')
            grid on
        end
    elseif isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
        plot(handles.Horizontal ,handles.Vertical,'linewidth',2);
        xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
        if get(handles.GridStatus,'Value')
            grid on
        end
    end
    %     plot(handles.Horizontal,handles.HoldOnVertical,'k',handles.Horizontal,handles.Vertical,'r:','linewidth',2);
%     xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
%     legend('Ideal signal','tracking signal');
    %
    set(handles.VerticalAxis,'Enable','on')
    set(handles.HorizontalAxis,'Enable','on')
    set(handles.GridStatus,'Enable','on')
    set(handles.LegendStatus,'Enable','on')
    set(handles.SubplotAll,'Enable','on')
    set(handles.ExternalFigureCheckBox,'Enable','on')
    %
    set(handles.StatusLine,'String','Done!')
end
guidata(hObject, handles);


% --- Executes on selection change in GridStatus.
function GridStatus_Callback(hObject, eventdata, handles)
% hObject    handle to GridStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(hObject,'Value')
    case 1'
        grid on;
    case 0
        grid off;
end
% Hints: contents = cellstr(get(hObject,'String')) returns GridStatus contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GridStatus


% --- Executes during object creation, after setting all properties.
function GridStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GridStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ExternalFigureCheckBox.
function ExternalFigureCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to ExternalFigureCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('./chap2_1')
switch get(hObject,'Value')
    case 1
        handles.ExternalFigure=figure(1);
        if ~isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
            plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.HoldOnVertical,'r:','linewidth',2);
            xlabel(handles.HorizontalName);ylabel(handles.VerticalName);            
            if ~get(handles.LegendStatus,'Value')
                legend('Ideal signal','tracking signal');
            end
            if get(handles.GridStatus,'Value')
                grid on
            end
        elseif ~isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
            plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.Vertical,'r:','linewidth',2);
            xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
            if ~get(handles.LegendStatus,'Value')
                legend('Ideal signal','tracking signal');
            end
            if get(handles.GridStatus,'Value')
                grid on
            end
        elseif isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
            plot(handles.Horizontal ,handles.Vertical,'k',handles.Horizontal ,handles.HoldOnVertical,'r:','linewidth',2);
            xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
            if ~get(handles.LegendStatus,'Value')
                legend('Ideal signal','tracking signal');
            end
            if get(handles.GridStatus,'Value')
                grid on
            end
        elseif isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
            plot(handles.Horizontal ,handles.Vertical,'linewidth',2);
            xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
            if get(handles.GridStatus,'Value')
                grid on
            end
        end
    case 0
        if isvalid(handles.ExternalFigure)
            close( 1 )
        end
end
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns ExternalFigureCheckBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ExternalFigureCheckBox


% --- Executes during object creation, after setting all properties.
function ExternalFigureCheckBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExternalFigureCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function ParameterEdit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10+3*sin(2*pi*t)')
set(hObject,'TooltipString','Damping Coefficient')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterEdit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','3+0.5*sin(2*pi*t)')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Moment of Inertia')

% --- Executes during object creation, after setting all properties.
function ParameterEdit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10*sin(t)')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Disturbance')

% --- Executes during object creation, after setting all properties.
function ParameterEdit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Nominal Damping Coefficient')
    
% --- Executes during object creation, after setting all properties.
function ParameterEdit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','3')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Nominal Moment of Inertia')

% --- Executes during object creation, after setting all properties.
function ParameterEdit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','7')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Minimum of Damping Coefficient')

% --- Executes during object creation, after setting all properties.
function ParameterEdit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','13')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Maximum of Damping Coefficient')

% --- Executes during object creation, after setting all properties.
function ParameterEdit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','2.5')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Minimum of Moment of Inertia')

% --- Executes during object creation, after setting all properties.
function ParameterEdit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','3.5')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Maximum of Moment of Inertia')

% --- Executes during object creation, after setting all properties.
function ParameterEdit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Maximum of Disturbance')

% --- Executes during object creation, after setting all properties.
function ParameterEdit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','3.0')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Design Parameter')

% --- Executes during object creation, after setting all properties.
function ParameterEdit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Design Parameter')

% --- Executes during object creation, after setting all properties.
function ParameterEdit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','sin(t)')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Desired Trajectory')

% --- Executes during object creation, after setting all properties.
function ParameterEdit14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','[0.5 0]')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Initial State Vector')

% --- Executes during object creation, after setting all properties.
function ParameterEdit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10+3*sin(2*pi*t)')
set(hObject,'Visible','Off')
set(hObject,'TooltipString','10+3*sin(2*pi*t)')

% --- Executes on selection change in VerticalAxis.
function VerticalAxis_Callback(hObject, eventdata, handles)
% hObject    handle to VerticalAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global HandlesVertical HandlesHoldOnVertical HandlesHorizontal HandlesHoldOnHorizontal
if ~isempty(HandlesHorizontal)
    handles.Horizontal = HandlesHorizontal;
    handles.HoldOnHorizontal = HandlesHoldOnHorizontal;
end

contents = cellstr(get(hObject,'String'));
handles.VerticalName = contents{get(hObject,'Value')} ;
ContentsApprochSelector = cellstr(get(handles.SolutionSelector,'String')) ;
switch ContentsApprochSelector{get(handles.SolutionSelector,'Value')}
case 'Nominal Model'
        switch handles.VerticalName
            case 'Position Tracking'                                        %2_1
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Speed Tracking'
                handles.Vertical = handles.y(:,4) ;
                handles.HoldOnVertical = handles.y(:,3) ;
            case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'for an Uncertain System'              %2_2
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Control Input'
                handles.Vertical = handles.u(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Switch Function'
                handles.Vertical = handles.s(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Linearization Feedback'                                   %2_3
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,2) ;
                handles.HoldOnVertical = handles.y(:,1) ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
        
    case 'Linearization Feedback SMC'    %2_4
        switch handles.VerticalName
            case 'Position Trcking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Input-Output Feedback Linearization'%2_5
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.tol ;
                handles.HoldOnVertical = [] ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Input-Output Feedback Linearization SMC'%2_6
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.y(:,1)-handles.y(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
        
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Low Pass Filter'%%2_7
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Initial Control Input'
                handles.Vertical = handles.u ;
                handles.HoldOnVertical = [] ;
            case 'Practical Control Input'
                handles.Vertical = handles.tol ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Linear Matrix Inequality for Inverted Pendulum'
        switch handles.VerticalName
            case 'Angle Response'
                handles.Vertical = handles.x(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Angle Speed Response'
                handles.Vertical = handles.x(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Cart Position Response'
                handles.Vertical = handles.x(:,3) ;
                handles.HoldOnVertical = [] ;
           case 'Cart Speed Response'
                handles.Vertical = handles.x(:,4) ;
                handles.HoldOnVertical = [] ;
           case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Sliding Mode'
                handles.Vertical = handles.s(:,1) ;
                handles.HoldOnVertical = [] ; 
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'E 3_2'
        switch handles.VerticalName
            case 'Angle response'
                handles.Vertical = handles.x1 ;
                handles.HoldOnVertical = [] ;
            case 'Angle rate'
                handles.Vertical = handles.x2 ;
                handles.HoldOnVertical = [] ;
            case 'Cart position response'
                handles.Vertical = handles.x3 ;
                handles.HoldOnVertical = [] ;
            case 'Cart speed response'
                handles.Vertical = handles.x4 ;
                handles.HoldOnVertical = [] ;
            case 'Control Input'
                handles.Vertical = handles.u ;
                handles.HoldOnVertical = [] ;        
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Backstepping SMC for Inverted Pendulum'
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.y(:,1)-handles.y(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;        
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Discrete'
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.r ;
                handles.HoldOnVertical = handles.x1 ;
            case 'Control Input'
                handles.Vertical = handles.u;
                handles.HoldOnVertical = [] ;
            case 'e'
                handles.Vertical = handles.e ;
                handles.HoldOnVertical = [] ; 
           case 'de'
                handles.Vertical = handles.de ;
                handles.HoldOnVertical = -handles.C_T(1)*handles.e ;        
            case 'Time'
                handles.Vertical = handles.Time ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Disturbance Observer'
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.xd ;
                handles.HoldOnVertical = handles.x1 ;
            case 'd,ed'
                handles.Vertical = handles.d;
                handles.HoldOnVertical =handles.ed ;
           case 'Control Input'
                handles.Vertical = handles.u ;
                handles.HoldOnVertical = [] ; 
            case 'de'
                handles.Vertical = handles.de ;
                handles.HoldOnVertical =-handles.C_T(1)*handles.e ;
             case 'e'
                handles.Vertical = handles.e ;
                handles.HoldOnVertical =[] ;   
            case 'Time'
                handles.Vertical = handles.Time ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Dynamic Switching Functions'
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Derivative of Control Input'
                handles.Vertical = handles.du(:,1);
                handles.HoldOnVertical =[] ;
           case 'Control Input'
                handles.Vertical = handles.u ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'for Mechanical Systems'
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.y(:,1)-handles.y(:,2);
                handles.HoldOnVertical =[] ;
           case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
           case 'J and its estimate'
                handles.Vertical = handles.y(:,3) ;
                handles.HoldOnVertical = handles.p(:,1) ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
       case 'for Inverted Pendulum'      %%6_2     
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.y(:,1)-handles.y(:,2);
                handles.HoldOnVertical =[] ;
           case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
           case 'Phi 1 estimation'
                handles.Vertical = handles.fai(:,1) ;
                handles.HoldOnVertical = handles.fai(:,4) ;
          case 'Phi 2 estimation'
                handles.Vertical = handles.fai(:,2) ;
                handles.HoldOnVertical = handles.fai(:,5) ;
          case 'Phi 3 estimation'
                handles.Vertical = handles.fai(:,3) ;
                handles.HoldOnVertical = handles.fai(:,6) ;
          case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
        
        case 'Terminal'   %7_1  cos problem
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.y(:,1)-handles.y(:,2);
                handles.HoldOnVertical =[] ;
           case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
           case 'Speed Tracking'
                handles.Vertical = cos(handles.t) ;
                handles.HoldOnVertical = handles.y(:,3) ;
          case 'Speed Tracking Error'
                handles.Vertical = handles.y(:,3)-cos(handles.t) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
        
            case 'Nonsingular Terminal'               %7_2     Have Problem in x1 and x2
        switch handles.VerticalName
            case 'State Response'
                handles.Vertical = handles.x(:,1) ;
                handles.HoldOnVertical = handles.x(:,2) ;
           case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
           case 'x2'
                handles.Vertical =handles.x(:,2) ;
                handles.HoldOnVertical =(-(abs(handles.x(:,1))).^(handles.q/handles.p).*sign(handles.x(:,1)));
          case 'x1'
                handles.Vertical = handles.x(:,1) ;
                handles.HoldOnVertical = [] ; 
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
        case 'Fast Terminal'                     %7_3
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
           case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
      case 'High-Gain Observer'                                       %8_1
        switch handles.VerticalName
            case 'x1 and its estimate'
                handles.Vertical = handles.x(:,1) ;
                handles.HoldOnVertical = handles.x(:,3) ;
           case 'x2 and its estimate'
                handles.Vertical = handles.x(:,2) ;
                handles.HoldOnVertical = handles.x(:,4) ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'High-Gain Observer SMC'                %8_2  Big Change
        switch handles.VerticalName
            case 'x1 and x1 estimate'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,3) ;
            case 'x2 and x2 estimate'
                handles.Vertical = handles.y(:,2) ;
                handles.HoldOnVertical = handles.y(:,4) ;
            case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'E 8_3'                                                           %8_3          
        switch handles.VerticalName
            case 'R Change'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = [] ;
           case 'Epsilon Change'
                handles.Vertical = handles.y(:,2) ;
                handles.HoldOnVertical = [] ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
        case 'Extended State Observer'                                     %8_4
        switch handles.VerticalName
            case 'x1 and x1 estimat'
                handles.Vertical = handles.x(:,1) ;
                handles.HoldOnVertical = handles.x(:,4) ;
           case 'x2 and x2 estimate'
                handles.Vertical = handles.x(:,2) ;
                handles.HoldOnVertical = handles.x(:,5) ;
           case 'x3 and x3 estimate'
                handles.Vertical = handles.x(:,3) ;
                handles.HoldOnVertical = handles.x(:,6) ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
           case 'Extended State Observer SMC'    %8_5   Unstability problem
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,3) ;
           case 'Speed Tracking'
                handles.Vertical = handles.y(:,2) ;
                handles.HoldOnVertical = handles.y(:,4) ;
           case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
            case 'Integral-Chain Differentiator'    %8_6
        switch handles.VerticalName
            case 'Position Estimated'
                handles.Vertical = handles.x(:,1) ;
                handles.HoldOnVertical = handles.x(:,3) ;
           case 'Speed Estimated'
                handles.Vertical = handles.x(:,2) ;
                handles.HoldOnVertical = handles.x(:,4) ;
           case 'Acceleration Estimated'
                handles.Vertical = handles.x(:,5) ;
                handles.HoldOnVertical = [] ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
        case 'Integral-Chain Differentiator SMC' % 8_7
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
           case 'fx and its estimation'
                handles.Vertical = handles.fx(:,1) ;
                handles.HoldOnVertical = handles.fx(:,2) ;
           case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
           case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Slow Time-Varying Disturbance Observer'                          %8_8
        switch handles.VerticalName
            case 'd and its estimate'
                handles.Vertical = handles.p(:,3) ;
                handles.HoldOnVertical = handles.p(:,4) ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Disturbance Observer SMC'              %8_9  cos problem 
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Speed Tracking'
                handles.Vertical = handles.cos(handles.t) ;
                handles.HoldOnVertical = handles.y(:,3) ;
            case 'd and its estimate'
                handles.Vertical = handles.p(:,3) ;
                handles.HoldOnVertical = handles.p(:,4) ;
            case 'Error Between d and its estimate'
                handles.Vertical = handles.p(:,3)-handles.p(:,4) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Delayed Output Observer'                                         %8_10    Attention!
        switch handles.VerticalName
            case 'x1 and its estimation'
                handles.Vertical = handles.p(:,1) ;
                handles.HoldOnVertical = handles.p(:,3) ;
            case 'x2 and its estimation'
                handles.Vertical = handles.p(:,2) ;
                handles.HoldOnVertical = handles.p(:,4) ;
            case 'Error of x1 and its estimation'
                handles.Vertical =  handles.p(:,1)-handles.p(:,3) ;
                handles.HoldOnVertical = [] ;
            case 'Error of x2 and its estimation'
                handles.Vertical = handles.p(:,2)-handles.p(:,4) ;
                handles.HoldOnVertical = [] ;
            case 'x1 and delayed x1'
                handles.Vertical = handles.p1(:,1) ;
                handles.HoldOnVertical = handles.p1(:,2) ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Delayed Output Observer SMC'                     %8_11  cos problem
        switch handles.VerticalName
            case 'Position Tracking signal'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Speed Tracking'
                handles.Vertical = cos(handles.t) ;
                handles.HoldOnVertical = handles.y(:,3) ;
            case 'x1 and its estimation'
                handles.Vertical =  handles.y1(:,1) ;
                handles.HoldOnVertical = handles.y1(:,3) ;
            case 'x1 and its delayed'
                handles.Vertical =  handles.y1(:,1) ;
                handles.HoldOnVertical = handles.y1(:,5) ;              
            case 'x2 and its estimation'
                handles.Vertical = handles.y1(:,2) ;
                handles.HoldOnVertical = handles.y1(:,4) ;
            case 'x2 and its delayed'
                handles.Vertical = handles.y1(:,2) ;
                handles.HoldOnVertical = handles.y1(:,6) ;                             
            case 'Control Input'                                           
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Equivalent Control'          %9_1
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Vertical = handles.y(:,1)-handles.y(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input'
                handles.Vertical = handles.ut ;
                handles.HoldOnVertical = [] ;
            case 'Disturbance'
                handles.Vertical = handles.d(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Membership function degree'
                handles.Vertical = handles.miu(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Fuzzy Switch-Gain Regulation'      %9_2
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'E and estimated K'
                handles.Vertical = handles.E(:,1) ;
                handles.HoldOnVertical = handles.E(:,2) ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Fuzzy System Approximation'  %9_3
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'fx and estiamted fx'
                handles.Vertical = handles.fx(:,1) ;
                handles.HoldOnVertical = handles.fx(:,2) ;
            case 'Control Input'
                handles.Vertical = handles.u(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Fuzzy Compensation for Manipulator'  %9_4
        switch handles.VerticalName
            case 'Position Tracking of link1'
                handles.Vertical = handles.yd1(:,1) ;
                handles.HoldOnVertical = handles.y(:,1) ;
            case 'Position Tracking of link2'
                handles.Vertical = handles.yd2(:,1) ;
                handles.HoldOnVertical = handles.y(:,3) ;
            case 'F and Fc of link1'
                handles.Vertical = handles.y(:,5) ;
                handles.HoldOnVertical = handles.u(:,3) ;
            case 'F and Fc of link2'
                handles.Vertical = handles.y(:,6) ;
                handles.HoldOnVertical = handles.u(:,4) ;
            case 'Control Input of Link1'
                handles.Vertical = handles.u(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input of Link2'
                handles.Vertical = handles.u(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on Switching Fuzzy'          %9_5
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'h and estiamted h'
                handles.Vertical = handles.h(:,1) ;
                handles.HoldOnVertical = handles.h(:,2) ;
            case 'Control Input'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Based on RBF Neural Network Approximation'  %10_1
        switch handles.VerticalName
            case 'Position Tracking'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,2) ;
            case 'fx and estiamted fx'
                handles.Vertical = handles.fx(:,1) ;
                handles.HoldOnVertical = handles.fx(:,2) ;
            case 'Control Input'
                handles.Vertical = handles.u(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'RBF Network Adaptive SMC for Manipulator'      %10_2
        switch handles.VerticalName
            case 'Position Tracking of link1'
                handles.Vertical = handles.y(:,1) ;
                handles.HoldOnVertical = handles.y(:,7) ;
            case 'Position Tracking of link2'
                handles.Vertical = handles.y(:,4) ;
                handles.HoldOnVertical = handles.y(:,9) ;
            case 'Speed Tracking of link1'
                handles.Vertical = handles.y(:,2) ;
                handles.HoldOnVertical = handles.y(:,8) ;
            case 'Speed Tracking of link2'
                handles.Vertical = handles.y(:,5) ;
                handles.HoldOnVertical = handles.y(:,10) ;
            case 'Control Input of Link1'
                handles.Vertical = handles.tol1(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input of Link2'
                handles.Vertical = handles.tol2(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'f and fn'
                handles.Vertical = handles.y(:,11) ;
                handles.HoldOnVertical = handles.y(:,12) ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Sliding Mode Control Based on Input-Output Stability'            %11_1
        switch handles.VerticalName
            case 'Position Tracking of link1'
                handles.Vertical = handles.qd(:,1) ;
                handles.HoldOnVertical = handles.q(:,1) ;
            case 'Position Tracking of link2'
                handles.Vertical = handles.qd(:,4) ;
                handles.HoldOnVertical = handles.q(:,3) ;
            case 'Speed Tracking of link1'
                handles.Vertical = handles.qd(:,2) ;
                handles.HoldOnVertical = handles.q(:,2) ;
            case 'Speed Tracking of link2'
                handles.Vertical = handles.qd(:,5) ;
                handles.HoldOnVertical = handles.q(:,4) ;
            case 'Control Input of Link1'
                handles.Vertical = handles.ut(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input of Link2'
                handles.Vertical = handles.ut(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Sliding Mode Control Based on Computed Torque Method'            %11_2
        switch handles.VerticalName
            case 'Position Tracking of joint 1'
                handles.Vertical = handles.y1(:,1) ;
                handles.HoldOnVertical = handles.y1(:,2) ;
            case 'Position Tracking of joint 2'
                handles.Vertical = handles.y2(:,1) ;
                handles.HoldOnVertical = handles.y2(:,2) ;
            case 'Control Input 1'
                handles.Vertical = handles.tol(:,1) ;
                handles.HoldOnVertical = [] ;
            case 'Control Input 2'
                handles.Vertical = handles.tol(:,2) ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
    case 'Adaptive Sliding Mode Control for Manipulator'                   %11_3
        switch handles.VerticalName
            case 'Position Tracking of link1'
                handles.Vertical = handles.qd(:,1) ;
                handles.HoldOnVertical = handles.q(:,1) ;
            case 'Position Tracking of link2'
                handles.Vertical = handles.qd(:,4) ;
                handles.HoldOnVertical = handles.q(:,3) ;
            case 'Speed Tracking of link1'
                handles.Vertical = handles.qd(:,2) ;
                handles.HoldOnVertical = handles.q(:,2) ;
            case 'Speed Tracking of link2'
                handles.Vertical = handles.qd(:,5) ;
                handles.HoldOnVertical = handles.q(:,4) ;
            case 'alfa estimation'
                handles.Vertical = handles.p(:,1)/6.7 ;
                handles.HoldOnVertical = [] ;
            case 'beta estimation'
                handles.Vertical = handles.p(:,2)/3.4 ;
                handles.HoldOnVertical = [] ;
            case 'epc estimation'
                handles.Vertical = handles.p(:,3)/3.0 ;
                handles.HoldOnVertical = [] ;
            case 'eta estimation'
                handles.Vertical = handles.p(:,4)/3 ;
                handles.HoldOnVertical = [] ;
            case 'Time'
                handles.Vertical = handles.t ;
                handles.HoldOnVertical = [] ;
        end
end
assignin('base','HandlesVertical',handles.Vertical); assignin('base','HandlesHoldOnVertical',handles.HoldOnVertical);
if ~isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.HoldOnVertical,'r:','linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);            
    if ~get(handles.LegendStatus,'Value')
        legend('Ideal signal','tracking signal');
    end
    if get(handles.GridStatus,'Value')
        grid on
    end
elseif ~isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.Vertical,'r:','linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
    if ~get(handles.LegendStatus,'Value')
        legend('Ideal signal','tracking signal');
    end
    if get(handles.GridStatus,'Value')
        grid on
    end
elseif isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'k',handles.Horizontal ,handles.HoldOnVertical,'r:','linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
    if ~get(handles.LegendStatus,'Value')
        legend('Ideal signal','tracking signal');
    end
    if get(handles.GridStatus,'Value')
        grid on
    end
elseif isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
    if get(handles.GridStatus,'Value')
        grid on
    end
end
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns VerticalAxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from VerticalAxis

% --- Executes during object creation, after setting all properties.
function VerticalAxis_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'TooltipString','Vertical Axis')
set(hObject,'String',{ 'Position Tracking' ;'Speed Tracking';'Control Input' ; 'Time' })

% --- Executes during object creation, after setting all properties.
function HorizontalAxis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HorizontalAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'TooltipString','Horizontal Axis')
set(hObject,'String',{ 'Time' ; 'Position Tracking' ;'Speed Tracking';'Control Input' })

% --- Executes on selection change in HorizontalAxis.
function HorizontalAxis_Callback(hObject, eventdata, handles)
% hObject    handle to HorizontalAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global HandlesVertical HandlesHoldOnVertical HandlesHorizontal HandlesHoldOnHorizontal
if ~isempty(HandlesVertical)
    handles.Vertical = HandlesVertical;
    handles.HoldOnVertical = HandlesHoldOnVertical;
end
contents = cellstr(get(hObject,'String'));
handles.HorizontalName = contents{get(hObject,'Value')} ;
ContentsApprochSelector = cellstr(get(handles.SolutionSelector,'String')) ;
switch ContentsApprochSelector{get(handles.SolutionSelector,'Value')}
    case 'Nominal Model'
        switch handles.HorizontalName
            case 'Position Tracking'                                        %2_1
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Speed Tracking'
                handles.Horizontal = handles.y(:,4) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
            case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'for an Uncertain System'              %2_2
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Control Input'
                handles.Horizontal = handles.u(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Switch Function'
                handles.Horizontal = handles.s(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Linearization Feedback'                                   %2_3
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,2) ;
                handles.HoldOnHorizontal = handles.y(:,1) ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        
    case 'Linearization Feedback SMC'    %2_4
        switch handles.HorizontalName
            case 'Position Trcking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Input-Output Feedback Linearization'%2_5
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.tol ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Input-Output Feedback Linearization SMC'%2_6
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.y(:,1)-handles.y(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
        
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Low Pass Filter'%%2_7
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Initial Control Input'
                handles.Horizontal = handles.u ;
                handles.HoldOnHorizontal = [] ;
            case 'Practical Control Input'
                handles.Horizontal = handles.tol ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        
    case 'Linear Matrix Inequality for Inverted Pendulum'
        switch handles.HorizontalName
            case 'Angle Response'
                handles.Horizontal = handles.x(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Angle Speed Response'
                handles.Horizontal = handles.x(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Cart Position Response'
                handles.Horizontal = handles.x(:,3) ;
                handles.HoldOnHorizontal = [] ;
            case 'Cart Speed Response'
                handles.Horizontal = handles.x(:,4) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;      
            case 'Sliding Mode'
                handles.Horizontal = handles.s(:,1) ;
                handles.HoldOnHorizontal = [] ; 
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'E 3_2'
        switch handles.HorizontalName
            case 'Angle response'
                handles.Horizontal = handles.x1 ;
                handles.HoldOnHorizontal = [] ;
            case 'Angle rate'
                handles.Horizontal = handles.x2 ;
                handles.HoldOnHorizontal = [] ;
            case 'Cart position response'
                handles.Horizontal = handles.x3 ;
                handles.HoldOnHorizontal = [] ;
            case 'Cart speed response'
                handles.Horizontal = handles.x4 ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.u ;
                handles.HoldOnHorizontal = [] ;        
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Backstepping SMC for Inverted Pendulum'
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.y(:,1)-handles.y(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;        
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Discrete'
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.r ;
                handles.HoldOnHorizontal = handles.x1 ;
            case 'Control Input'
                handles.Horizontal = handles.u;
                handles.HoldOnHorizontal = [] ;
           case 'e'
                handles.Horizontal = handles.e ;
                handles.HoldOnHorizontal = [] ;   
            case 'de'
                handles.Horizontal = handles.de ;
                handles.HoldOnHorizontal = -handles.C_T(1)*handles.e ; 
            case 'Time'
                handles.Horizontal = handles.Time ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Disturbance Observer'
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.xd ;
                handles.HoldOnHorizontal = handles.x1 ;
            case 'd,ed'
                handles.Horizontal = handles.d;
                handles.HoldOnHorizontal =handles.ed ;
           case 'Control Input'
                handles.Horizontal = handles.u ;
                handles.HoldOnHorizontal = [] ; 
            case 'de'
                handles.Horizontal = handles.de ;
                handles.HoldOnHorizontal =-handles.C_T(1)*handles.e ;
             case 'e'
                handles.Horizontal = handles.e ;
                handles.HoldOnHorizontal =[] ;   
            case 'Time'
                handles.Horizontal = handles.Time ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Dynamic Switching Functions'
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Derivative of Control Input'
                handles.Horizontal = handles.du(:,1);
                handles.HoldOnHorizontal =[] ;
           case 'Control Input'
                handles.Horizontal = handles.u ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'for Mechanical Systems'
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.y(:,1)-handles.y(:,2);
                handles.HoldOnHorizontal =[] ;
           case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
           case 'J and its estimate'
                handles.Horizontal = handles.y(:,3) ;
                handles.HoldOnHorizontal = handles.p(:,1) ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
       case 'for Inverted Pendulum'      %%6_2     
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.y(:,1)-handles.y(:,2);
                handles.HoldOnHorizontal =[] ;
           case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
           case 'Phi 1 estimation'
                handles.Horizontal = handles.fai(:,1) ;
                handles.HoldOnHorizontal = handles.fai(:,4) ;
          case 'Phi 2 estimation'
                handles.Horizontal = handles.fai(:,2) ;
                handles.HoldOnHorizontal = handles.fai(:,5) ;
          case 'Phi 3 estimation'
                handles.Horizontal = handles.fai(:,3) ;
                handles.HoldOnHorizontal = handles.fai(:,6) ;
          case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        
        case 'Terminal'   %7_1  cos problem
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.y(:,1)-handles.y(:,2);
                handles.HoldOnHorizontal =[] ;
           case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
           case 'Speed Tracking'
                handles.Horizontal = cos(handles.t) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
          case 'Speed Tracking Error'
                handles.Horizontal = handles.y(:,3)-cos(handles.t) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        
            case 'Nonsingular Terminal'               %7_2     Have Problem in x1 and x2
        switch handles.HorizontalName
            case 'State Response'
                handles.Horizontal = handles.x(:,1) ;
                handles.HoldOnHorizontal = handles.x(:,2) ;
           case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
           case 'x2'
                handles.Horizontal =handles.x(:,2) ;
                handles.HoldOnHorizontal =(-(abs(handles.x(:,1))).^(handles.q/handles.p).*sign(handles.x(:,1)));
          case 'x1'
                handles.Horizontal = handles.x(:,1) ;
                handles.HoldOnHorizontal = [] ; 
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        case 'Fast Terminal'                     %7_3
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
           case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
      case 'High-Gain Observer'                                       %8_1
        switch handles.HorizontalName
            case 'x1 and its estimate'
                handles.Horizontal = handles.x(:,1) ;
                handles.HoldOnHorizontal = handles.x(:,3) ;
           case 'x2 and its estimate'
                handles.Horizontal = handles.x(:,2) ;
                handles.HoldOnHorizontal = handles.x(:,4) ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'High-Gain Observer SMC'                %8_2  Big Change
        switch handles.HorizontalName
            case 'x1 and x1 estimate'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
            case 'x2 and x2 estimate'
                handles.Horizontal = handles.y(:,2) ;
                handles.HoldOnHorizontal = handles.y(:,4) ;
            case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'E 8_3'                                                           %8_3          
        switch handles.HorizontalName
            case 'R Change'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = [] ;
           case 'Epsilon Change'
                handles.Horizontal = handles.y(:,2) ;
                handles.HoldOnHorizontal = [] ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        case 'Extended State Observer'                                     %8_4
        switch handles.HorizontalName
            case 'x1 and x1 estimat'
                handles.Horizontal = handles.x(:,1) ;
                handles.HoldOnHorizontal = handles.x(:,4) ;
           case 'x2 and x2 estimate'
                handles.Horizontal = handles.x(:,2) ;
                handles.HoldOnHorizontal = handles.x(:,5) ;
           case 'x3 and x3 estimate'
                handles.Horizontal = handles.x(:,3) ;
                handles.HoldOnHorizontal = handles.x(:,6) ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
           case 'Extended State Observer SMC'    %8_5   Unstability problem
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
           case 'Speed Tracking'
                handles.Horizontal = handles.y(:,2) ;
                handles.HoldOnHorizontal = handles.y(:,4) ;
           case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
            case 'Integral-Chain Differentiator'    %8_6
        switch handles.HorizontalName
            case 'Position Estimated'
                handles.Horizontal = handles.x(:,1) ;
                handles.HoldOnHorizontal = handles.x(:,3) ;
           case 'Speed Estimated'
                handles.Horizontal = handles.x(:,2) ;
                handles.HoldOnHorizontal = handles.x(:,4) ;
           case 'Acceleration Estimated'
                handles.Horizontal = handles.x(:,5) ;
                handles.HoldOnHorizontal = [] ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
        case 'Integral-Chain Differentiator SMC' % 8_7
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
           case 'fx and its estimation'
                handles.Horizontal = handles.fx(:,1) ;
                handles.HoldOnHorizontal = handles.fx(:,2) ;
           case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
           case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Slow Time-Varying Disturbance Observer'                          %8_8
        switch handles.HorizontalName
            case 'd and its estimate'
                handles.Horizontal = handles.p(:,3) ;
                handles.HoldOnHorizontal = handles.p(:,4) ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Disturbance Observer SMC'              %8_9  cos problem 
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Speed Tracking'
                handles.Horizontal = handles.cos(handles.t) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
            case 'd and its estimate'
                handles.Horizontal = handles.p(:,3) ;
                handles.HoldOnHorizontal = handles.p(:,4) ;
            case 'Error Between d and its estimate'
                handles.Horizontal = handles.p(:,3)-handles.p(:,4) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Delayed Output Observer'                                         %8_10    Attention!
        switch handles.HorizontalName
            case 'x1 and its estimation'
                handles.Horizontal = handles.p(:,1) ;
                handles.HoldOnHorizontal = handles.p(:,3) ;
            case 'x2 and its estimation'
                handles.Horizontal = handles.p(:,2) ;
                handles.HoldOnHorizontal = handles.p(:,4) ;
            case 'Error of x1 and its estimation'
                handles.Horizontal =  handles.p(:,1)-handles.p(:,3) ;
                handles.HoldOnHorizontal = [] ;
            case 'Error of x2 and its estimation'
                handles.Horizontal = handles.p(:,2)-handles.p(:,4) ;
                handles.HoldOnHorizontal = [] ;
            case 'x1 and delayed x1'
                handles.Horizontal = handles.p1(:,1) ;
                handles.HoldOnHorizontal = handles.p1(:,2) ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Delayed Output Observer SMC'                     %8_11  cos problem
        switch handles.HorizontalName
            case 'Position Tracking signal'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Speed Tracking'
                handles.Horizontal = cos(handles.t) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
            case 'x1 and its estimation'
                handles.Horizontal =  handles.y1(:,1) ;
                handles.HoldOnHorizontal = handles.y1(:,3) ;
            case 'x1 and its delayed'
                handles.Horizontal =  handles.y1(:,1) ;
                handles.HoldOnHorizontal = handles.y1(:,5) ;              
            case 'x2 and its estimation'
                handles.Horizontal = handles.y1(:,2) ;
                handles.HoldOnHorizontal = handles.y1(:,4) ;
            case 'x2 and its delayed'
                handles.Horizontal = handles.y1(:,2) ;
                handles.HoldOnHorizontal = handles.y1(:,6) ;                             
            case 'Control Input'                                           
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Equivalent Control'          %9_1
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'Position Tracking Error'
                handles.Horizontal = handles.y(:,1)-handles.y(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input'
                handles.Horizontal = handles.ut ;
                handles.HoldOnHorizontal = [] ;
            case 'Disturbance'
                handles.Horizontal = handles.d(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Membership function degree'
                handles.Horizontal = handles.miu(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Fuzzy Switch-Gain Regulation'      %9_2
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'E and estimated K'
                handles.Horizontal = handles.E(:,1) ;
                handles.HoldOnHorizontal = handles.E(:,2) ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Fuzzy System Approximation'  %9_3
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'fx and estiamted fx'
                handles.Horizontal = handles.fx(:,1) ;
                handles.HoldOnHorizontal = handles.fx(:,2) ;
            case 'Control Input'
                handles.Horizontal = handles.u(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Fuzzy Compensation for Manipulator'  %9_4
        switch handles.HorizontalName
            case 'Position Tracking of link1'
                handles.Horizontal = handles.yd1(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,1) ;
            case 'Position Tracking of link2'
                handles.Horizontal = handles.yd2(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,3) ;
            case 'F and Fc of link1'
                handles.Horizontal = handles.y(:,5) ;
                handles.HoldOnHorizontal = handles.u(:,3) ;
            case 'F and Fc of link2'
                handles.Horizontal = handles.y(:,6) ;
                handles.HoldOnHorizontal = handles.u(:,4) ;
            case 'Control Input of Link1'
                handles.Horizontal = handles.u(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input of Link2'
                handles.Horizontal = handles.u(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on Switching Fuzzy'          %9_5
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'h and estiamted h'
                handles.Horizontal = handles.h(:,1) ;
                handles.HoldOnHorizontal = handles.h(:,2) ;
            case 'Control Input'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Based on RBF Neural Network Approximation'  %10_1
        switch handles.HorizontalName
            case 'Position Tracking'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,2) ;
            case 'fx and estiamted fx'
                handles.Horizontal = handles.fx(:,1) ;
                handles.HoldOnHorizontal = handles.fx(:,2) ;
            case 'Control Input'
                handles.Horizontal = handles.u(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'RBF Network Adaptive SMC for Manipulator'      %10_2
        switch handles.HorizontalName
            case 'Position Tracking of link1'
                handles.Horizontal = handles.y(:,1) ;
                handles.HoldOnHorizontal = handles.y(:,7) ;
            case 'Position Tracking of link2'
                handles.Horizontal = handles.y(:,4) ;
                handles.HoldOnHorizontal = handles.y(:,9) ;
            case 'Speed Tracking of link1'
                handles.Horizontal = handles.y(:,2) ;
                handles.HoldOnHorizontal = handles.y(:,8) ;
            case 'Speed Tracking of link2'
                handles.Horizontal = handles.y(:,5) ;
                handles.HoldOnHorizontal = handles.y(:,10) ;
            case 'Control Input of Link1'
                handles.Horizontal = handles.tol1(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input of Link2'
                handles.Horizontal = handles.tol2(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'f and fn'
                handles.Horizontal = handles.y(:,11) ;
                handles.HoldOnHorizontal = handles.y(:,12) ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Sliding Mode Control Based on Input-Output Stability'            %11_1
        switch handles.HorizontalName
            case 'Position Tracking of link1'
                handles.Horizontal = handles.qd(:,1) ;
                handles.HoldOnHorizontal = handles.q(:,1) ;
            case 'Position Tracking of link2'
                handles.Horizontal = handles.qd(:,4) ;
                handles.HoldOnHorizontal = handles.q(:,3) ;
            case 'Speed Tracking of link1'
                handles.Horizontal = handles.qd(:,2) ;
                handles.HoldOnHorizontal = handles.q(:,2) ;
            case 'Speed Tracking of link2'
                handles.Horizontal = handles.qd(:,5) ;
                handles.HoldOnHorizontal = handles.q(:,4) ;
            case 'Control Input of Link1'
                handles.Horizontal = handles.ut(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input of Link2'
                handles.Horizontal = handles.ut(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Sliding Mode Control Based on Computed Torque Method'            %11_2
        switch handles.HorizontalName
            case 'Position Tracking of joint 1'
                handles.Horizontal = handles.y1(:,1) ;
                handles.HoldOnHorizontal = handles.y1(:,2) ;
            case 'Position Tracking of joint 2'
                handles.Horizontal = handles.y2(:,1) ;
                handles.HoldOnHorizontal = handles.y2(:,2) ;
            case 'Control Input 1'
                handles.Horizontal = handles.tol(:,1) ;
                handles.HoldOnHorizontal = [] ;
            case 'Control Input 2'
                handles.Horizontal = handles.tol(:,2) ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
    case 'Adaptive Sliding Mode Control for Manipulator'         %11_3
        switch handles.HorizontalName
            case 'Position Tracking of link1'
                handles.Horizontal = handles.qd(:,1) ;
                handles.HoldOnHorizontal = handles.q(:,1) ;
            case 'Position Tracking of link2'
                handles.Horizontal = handles.qd(:,4) ;
                handles.HoldOnHorizontal = handles.q(:,3) ;
            case 'Speed Tracking of link1'
                handles.Horizontal = handles.qd(:,2) ;
                handles.HoldOnHorizontal = handles.q(:,2) ;
            case 'Speed Tracking of link2'
                handles.Horizontal = handles.qd(:,5) ;
                handles.HoldOnHorizontal = handles.q(:,4) ;
            case 'alfa estimation'
                handles.Horizontal = handles.p(:,1)/6.7 ;
                handles.HoldOnHorizontal = [] ;
            case 'beta estimation'
                handles.Horizontal = handles.p(:,2)/3.4 ;
                handles.HoldOnHorizontal = [] ;
            case 'epc estimation'
                handles.Horizontal = handles.p(:,3)/3.0 ;
                handles.HoldOnHorizontal = [] ;
            case 'eta estimation'
                handles.Horizontal = handles.p(:,4)/3 ;
                handles.HoldOnHorizontal = [] ;
            case 'Time'
                handles.Horizontal = handles.t ;
                handles.HoldOnHorizontal = [] ;
        end
end
assignin('base','HandlesHorizontal',handles.Horizontal); assignin('base','HandlesHoldOnHorizontal',handles.HoldOnHorizontal);
if ~isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.HoldOnVertical,'r:','linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);            
    if ~get(handles.LegendStatus,'Value')
        legend('Ideal signal','tracking signal');
    end
    if get(handles.GridStatus,'Value')
        grid on
    end
elseif ~isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'k',handles.HoldOnHorizontal ,handles.Vertical,'r:','linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
    if ~get(handles.LegendStatus,'Value')
        legend('Ideal signal','tracking signal');
    end
    if get(handles.GridStatus,'Value')
        grid on
    end
elseif isempty( handles.HoldOnHorizontal ) && ~isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'k',handles.Horizontal ,handles.HoldOnVertical,'r:','linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
    if ~get(handles.LegendStatus,'Value')
        legend('Ideal signal','tracking signal');
    end
    if get(handles.GridStatus,'Value')
        grid on
    end
elseif isempty( handles.HoldOnHorizontal ) && isempty( handles.HoldOnVertical )
    plot(handles.Horizontal ,handles.Vertical,'linewidth',2);
    xlabel(handles.HorizontalName);ylabel(handles.VerticalName);
    if get(handles.GridStatus,'Value')
        grid on
    end
end
    
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns HorizontalAxis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HorizontalAxis

% --- Executes on button press in LegendStatus.
function LegendStatus_Callback(hObject, eventdata, handles)
% hObject    handle to LegendStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isempty( handles.HoldOnHorizontal ) || ~isempty( handles.HoldOnVertical )
    switch get(hObject,'Value')
        case 0'
            legend('Ideal signal','tracking signal');
        case 1
            legend off;
    end
end
% Hint: get(hObject,'Value') returns toggle state of LegendStatus


% --- Executes on button press in ExportResults.
function ExportResults_Callback(hObject, eventdata, handles)
% hObject    handle to ExportResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ExportResults


% --- Executes during object creation, after setting all properties.
function ParameterName1_CreateFcn(hObject, eventdata, handles)
set(hObject,'String','B')
set(hObject,'Visible','On')
set(hObject,'TooltipString','Damping Coefficient')
    
% --- Executes during object creation, after setting all properties.
function ParameterName2_CreateFcn(hObject, eventdata, handles)
set(hObject,'Visible','On')
set(hObject,'TooltipString','Moment of Inertia')
set(hObject,'String','J')

% --- Executes during object creation, after setting all properties.
function ParameterName3_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Disturbance')
set(hObject,'String','d')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName4_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Nominal Damping Coefficient')
set(hObject,'String','B_n')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName5_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Nominal Moment of Inertia')    
set(hObject,'String','J_n')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName6_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Minimum of Damping Coefficient')
set(hObject,'String','B_m')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName7_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Maximum of Damping Coefficient')
set(hObject,'String','B_M')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName8_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Minimum of Moment of Inertia')
set(hObject,'String','J_m')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName9_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Maximum of Moment of Inertia')
set(hObject,'String','J_M')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName10_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Maximum of Disturbance')
set(hObject,'String','d_M')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName11_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Design Parameter')
set(hObject,'String','k')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName12_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Design Parameter')
set(hObject,'String','K')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName13_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Desired Trajectory')
set(hObject,'String','Theta_d')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName14_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','Initial State Vector')
set(hObject,'String','InitialStateVector')
set(hObject,'Visible','On')

% --- Executes during object creation, after setting all properties.
function ParameterName15_CreateFcn(hObject, eventdata, handles)
set(hObject,'TooltipString','B')
set(hObject,'String','Nothing')
set(hObject,'Visible','Off')


function RunTimeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to RunTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RunTimeEdit as text
%        str2double(get(hObject,'String')) returns contents of RunTimeEdit as a double


% --- Executes during object creation, after setting all properties.
function RunTimeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RunTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SubplotAll.
function SubplotAll_Callback(hObject, eventdata, handles)
global HandlesVertical HandlesHoldOnVertical HandlesHorizontal HandlesHoldOnHorizontal
switch get(hObject,'Value')
    case 1
        CellVertical=get(handles.VerticalAxis,'String');
        n=size( CellVertical , 1 );
        if strcmp(CellVertical(end),'Time')
            n=n-1;
        end
        CellHorizontal=get(handles.HorizontalAxis,'String');
        m = size( CellHorizontal , 1 ) ;
        Counter=1;
        handles.ExternalFigure=figure(1);
        for i = 1:n
            set(handles.VerticalAxis,'Value',i)
            subplot(n,m-1,Counter);VerticalAxis_Callback(handles.VerticalAxis, eventdata, handles)
            legend off
            for j = 1:m
                set(handles.HorizontalAxis,'Value',j)
                if ~strcmp( CellVertical(i) , CellHorizontal(j) )
                    subplot(n,m-1,Counter);HorizontalAxis_Callback(handles.HorizontalAxis, eventdata, handles)
                    ylabel(CellVertical(i))
                    Counter=Counter+1;
                    legend off
                end
            end
        end
    case 0
        if isvalid(handles.ExternalFigure)
            close( 1 )
        end
end
        

% --- Executes on key press with focus on ParameterEdit1 and none of its controls.
function ParameterEdit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit2 and none of its controls.
function ParameterEdit2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit3 and none of its controls.
function ParameterEdit3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit4 and none of its controls.
function ParameterEdit4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit5 and none of its controls.
function ParameterEdit5_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit5 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit6 and none of its controls.
function ParameterEdit6_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit6 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit7 and none of its controls.
function ParameterEdit7_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit7 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit8 and none of its controls.
function ParameterEdit8_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit8 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit9 and none of its controls.
function ParameterEdit9_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit9 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit10 and none of its controls.
function ParameterEdit10_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit10 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit11 and none of its controls.
function ParameterEdit11_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit11 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit12 and none of its controls.
function ParameterEdit12_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit12 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit13 and none of its controls.
function ParameterEdit13_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit13 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit14 and none of its controls.
function ParameterEdit14_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit14 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --- Executes on key press with focus on ParameterEdit15 and none of its controls.
function ParameterEdit15_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ParameterEdit15 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')




% --- Executes on key press with focus on RunTimeEdit and none of its controls.
function RunTimeEdit_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to RunTimeEdit (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global SetParameterFlag
SetParameterFlag = 0 ;
set(handles.StatusLine,'String','Please press "Set Parameters" then press "Start"!')


% --------------------------------------------------------------------
function FileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EditMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to EditMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ViewMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to ViewMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function HelpMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to HelpMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NewFileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to NewFileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenFileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to OpenFileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CloseFileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to CloseFileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SaveFileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to SaveFileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SaveAsFileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to SaveAsFileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ExportFileMenuBar_Callback(hObject, eventdata, handles)
% hObject    handle to ExportFileMenuBar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in SMCMethodSelector.
function SMCMethodSelector_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String')) ;
switch contents{get(hObject,'Value')}
    case 'Normal'
        set(handles.SolutionSelector,'String',...
            {'Nominal Model'
            'for an Uncertain System'
            'Linearization Feedback'
            'Linearization Feedback SMC'
            'Input-Output Feedback Linearization'
            'Input-Output Feedback Linearization SMC'
            'Based on Low Pass Filter'})
    case 'Advanced'
        set(handles.SolutionSelector,'String',...
            {'Linear Matrix Inequality for Inverted Pendulum'
            'Backstepping SMC for Inverted Pendulum'})
    case 'Discrete'
        set(handles.SolutionSelector,'String',...
            {'Discrete'
            'Based on Disturbance Observer'})
    case 'Dynamic'
        set(handles.SolutionSelector,'String',...
            {'Based on Dynamic Switching Functions'})
    case 'Adaptive'
        set(handles.SolutionSelector,'String',...
            {'for Mechanical Systems'
            'for Inverted Pendulum'})
    case 'Terminal'
        set(handles.SolutionSelector,'String',...
            {'Terminal'
            'Nonsingular Terminal'
            'Fast Terminal'})
    case 'Based on Observer'
        set(handles.SolutionSelector,'String',...
            {'High-Gain Observer'
            'High-Gain Observer SMC'
            'Extended State Observer'
            'Extended State Observer SMC'
            'Integral-Chain Differentiator'
            'Integral-Chain Differentiator SMC'
            'Slow Time-Varying Disturbance Observer'
            'Disturbance Observer SMC'
            'Delayed Output Observer'
            'Delayed Output Observer SMC'})
    case 'Fuzzy'
        set(handles.SolutionSelector,'String',...
            {'Based on Equivalent Control'
            'Based on Fuzzy Switch-Gain Regulation'
            'Based on Fuzzy System Approximation'
            'Based on Fuzzy Compensation for Manipulator'
            'Based on Switching Fuzzy'})
    case 'Neural Network'
        set(handles.SolutionSelector,'String',...
            {'Based on RBF Neural Network Approximation'
            'RBF Network Adaptive SMC for Manipulator'})
end
SolutionSelector_Callback(handles.SolutionSelector, eventdata, handles)        
% hObject    handle to SMCMethodSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SMCMethodSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SMCMethodSelector


% --- Executes during object creation, after setting all properties.
function SMCMethodSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SMCMethodSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
