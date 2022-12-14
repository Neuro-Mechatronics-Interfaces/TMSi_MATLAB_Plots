classdef Snippet__Base_Chart < matlab.graphics.chartcontainer.ChartContainer
    % c = Snippet__Base_Chart('XData', X, 'YData', Y, 'Name', Value,...)
    % Plots one time-series snippet for every column of matrix Y. 
    % Locations of each column of Y correspond to TMSi- 1-indexed channel
    % ordering schema, which depends on the electrode array Montage that is
    % used in the EMG recording. Subclasses determine the Montage and plot
    % the snippet signals according to the relative channel locations (mm);
    % the length of the snippet is always scaled to fit within a box
    % defined by the extents of the 'Scale' property.
    % You can also specify the additonal name-value arguments.
    %
    % NOTE: Only update 'YData' with data for channels with the
    % corresponding 'Enable' property element set to true. If a channel is
    % not enabled, then do not update 'YData' for that channel.
    
    properties(Access = public)
        Channel (1,64) double = 1:64
        Color_By_RMS (1,1) logical = false
        Enable (1,64) logical = true(1,64)
        XData (:,1) double = NaN
        YData (:,:) double = NaN
		LineWidth (1,1) double = 2
        Fc double = [] % Cutoff frequencies
        Fs (1,1) double = 4000 % Sample rate
        RMS_Range double = [0, 1]; % Expected RMS range for use with Color_By_RMS method of coloration
        Show_Labels logical = true;
    end
    properties(Transient,NonCopyable,SetAccess = protected,GetAccess = public)
        EMG (:,1) matlab.graphics.chart.primitive.Line
    end
    properties(SetAccess = protected, GetAccess = public)
        Scale (1, 2) double = nan(1,2) % Scaling to constrain line object "spatial" bounds (mm)
        XGrid (:, 8) double = nan(8,8) % X-coordinate centers (mm)
        YGrid (:, 8) double = nan(8,8) % Y-coordinate centers (mm)
        Montage (1,1) string % Can be: "L88" "S88" "L48" "L84"
    end 
    properties(Access = protected)
        CData_
    end
	methods
        function obj = Snippet__Base_Chart(varargin)
            if numel(varargin) == 0
                fig = uifigure('Color', 'w', 'HandleVisibility', 'on');
                figure(fig);
            else
                if isa(varargin{1}, 'matlab.ui.Figure')
                    fig = varargin{1};
                    set(fig, 'HandleVisibility', 'on', 'Color', 'w');
                    figure(fig);
                    varargin(1) = [];
                elseif isa(varargin{1}, 'matlab.graphics.axis.Axes')
                    g = varargin{1};
                    while ~isa(g, 'matlab.ui.Figure')
                        g = g.Parent;
                    end
                    set(g, 'HandleVisibility', 'on', 'Color', 'w');
                    figure(g);
                    varargin(1) = [];
                end

                if numel(varargin) > 0
                    if isnumeric(varargin{1})
                        varargin = ['CData', varargin];
                    end
                end
            end
            obj@matlab.graphics.chartcontainer.ChartContainer(varargin{:});
            for iV = 1:2:numel(varargin)
                obj.(varargin{iV}) = varargin{iV+1};
            end
        end
		function title(obj, varargin)
			ax = getAxes(obj);
			title(ax, varargin{:});
        end
        function xlabel(obj, varargin)
            ax = getAxes(obj);
            xlabel(ax, varargin{:});
        end
        function ylabel(obj, varargin)
            ax = getAxes(obj);
            ylabel(ax, varargin{:});
        end
        function setRMS_Range(obj, rms_range, c_rms)
            if nargin < 3
                c_rms = cm.map('rosette');
            end
            obj.RMS_Range = rms_range;
            obj.CData_ = cm.cmap(rms_range, c_rms);
            obj.update();
        end
    end
    methods(Access = protected)
        function setup(obj)
            ax = getAxes(obj);
            c = [winter(32); summer(32)];
            c_rms = cm.map('rosette');
            obj.CData_ = cm.cmap(obj.RMS_Range, c_rms);
            set(ax, 'NextPlot', 'add', ...
                'ColorOrder', c, ...
                'FontName', 'Tahoma');
            set(gcf, 'Color', 'w');
            if obj.Show_Labels
                xlabel(ax, 'X-Grid (mm)', 'FontName', 'Tahoma', 'Color', 'k');
                ylabel(ax, 'Y-Grid (mm)', 'FontName', 'Tahoma', 'Color', 'k');
            end
        end
        function setMontage(obj, montage)
            obj.Montage = montage;
        end
        function update(obj)
            % Get the axes
            ax = getAxes(obj);
            
            % Create extra lines as needed
            p = obj.EMG;
            nPlotLinesNeeded = size(obj.YData, 2);
            nPlotLinesHave = numel(p);
            for n = (nPlotLinesHave+1):nPlotLinesNeeded
                p(n) = matlab.graphics.chart.primitive.Line(...
                    'Parent', ax, ...
                    'SeriesIndex', n, ...
                    'LineWidth', obj.LineWidth);
            end
            
            % Determine x-coordinates for electrodes
            if any(isnan(obj.XData))
                xdata = linspace(obj.Scale(1), obj.Scale(2), size(obj.YData,1));
            else
                xdata = linspace(obj.Scale(1), obj.Scale(2), numel(obj.XData));
            end
%             tmp = zscore(obj.YData, 0, 1);
            tmp = obj.YData - mean(obj.YData, 1);
            if numel(obj.Fc) == 2
                [b,a] = butter(4,(obj.Fc)./(obj.Fs / 2),'bandpass');
                ydata = filtfilt(b,a,tmp);
            elseif isempty(obj.Fc)
                ydata = tmp;
            else
                [b,a] = butter(2,(obj.Fc)./(obj.Fs / 2), 'high');
                ydata = filter(b,a,tmp);
            end
            

            ch = obj.Channel(obj.Enable);
            % Update the lines
            if obj.Color_By_RMS
                for n = 1:nPlotLinesNeeded
                    p(n).XData = xdata + obj.XGrid(ch(n));
                    p(n).YData = ydata(:,n) + obj.YGrid(ch(n));
                    p(n).Color = double(obj.CData_(rms(ydata(:,n))))./255.0;
                end
            else
                for n = 1:nPlotLinesNeeded
                    p(n).XData = xdata + obj.XGrid(ch(n));
                    p(n).YData = ydata(:,n) + obj.YGrid(ch(n));
                end
            end
            % Delete unneeded lines
            delete(p((nPlotLinesNeeded+1):numel(p)))
            obj.EMG = p(1:nPlotLinesNeeded);
            
        end
    end
end