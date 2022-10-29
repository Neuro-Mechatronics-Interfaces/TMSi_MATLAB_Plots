classdef Snippet_Cloth_4_8_L_Chart < Snippet__Base_Chart
    % c = Snippet_Cloth_4_8_L_Chart('YData',Y,Name,Value,...)
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

    methods
        function obj = Snippet_Cloth_4_8_L_Chart(varargin)
            obj@Snippet__Base_Chart(varargin{:});
        end
    end
    methods (Access = protected)
        function setup(obj)
            setup@Snippet__Base_Chart(obj);
            obj.Montage = "L48";
            cfg = io.yaml.loadFile('config.yaml', "ConvertToArray", true);
            set(obj, ...
                'Scale', cfg.(obj.Montage).Scale, ...
                'XGrid', reshape(cfg.(obj.Montage).XGrid, 8, 8), ...
                'YGrid', reshape(cfg.(obj.Montage).YGrid, 8, 8));
        end
    end
end