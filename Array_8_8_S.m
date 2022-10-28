classdef Array_8_8_S < SignalBaseChart
    % c = Array_8_8_L('YData',Y,Name,Value,...)
    % plots one line with markers at local extrema for every column of matrix Y. 
    % You can also specify the additonal name-value arguments.

    methods
        function obj = Array_8_8_S(varargin)
            obj@SignalBaseChart(varargin{:});
        end
    end
    methods (Access = protected)
        function setup(obj)
            setup@SignalBaseChart(obj);
            obj.Montage = "S88";
            cfg = io.yaml.loadFile('config.yaml', "ConvertToArray", true);
            set(obj, ...
                'Scale', cfg.(obj.Montage).Scale, ...
                'XGrid', reshape(cfg.(obj.Montage).XGrid, 8, 8), ...
                'YGrid', reshape(cfg.(obj.Montage).YGrid, 8, 8));
        end
    end
end