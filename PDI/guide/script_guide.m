function varargout = script_guide(varargin)
% SCRIPT_GUIDE MATLAB code for script_guide.fig
%      SCRIPT_GUIDE, by itself, creates a new SCRIPT_GUIDE or raises the existing
%      singleton*.
%
%      H = SCRIPT_GUIDE returns the handle to a new SCRIPT_GUIDE or the handle to
%      the existing singleton*.
%
%      SCRIPT_GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCRIPT_GUIDE.M with the given input arguments.
%
%      SCRIPT_GUIDE('Property','Value',...) creates a new SCRIPT_GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before script_guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to script_guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help script_guide

% Last Modified by GUIDE v2.5 09-Mar-2019 11:47:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @script_guide_OpeningFcn, ...
                   'gui_OutputFcn',  @script_guide_OutputFcn, ...
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


% --- Executes just before script_guide is made visible.
function script_guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to script_guide (see VARARGIN)

% Choose default command line output for script_guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes script_guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = script_guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)

global n;

[nome diretorio] = uigetfile('*.*', 'Abrir');
local = fullfile(diretorio, nome);
n = imread(local);

axes(handles.axes1);
imshow(n); title('Imagem de entrada')


% --- Executes on button press in fechar.
function fechar_Callback(hObject, eventdata, handles)
close all;


% --- Executes on button press in converter_hsv.
function converter_hsv_Callback(hObject, eventdata, handles)

global n;

img = rgb2hsv(n);
figure; imshow(img);

img_H = img(:,:,1);
axes(handles.axes2);
imshow(img_H);

img_S = img(:,:,2);
axes(handles.axes3);
imshow(img_S);

img_V = img(:,:,3);
axes(handles.axes4);
imshow(img_V);

