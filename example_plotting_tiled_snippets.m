%EXAMPLE_PLOTTING_TILED_SNIPPETS  Example showing how to plot tiled snippet files.
clear; clc;

% Forrest 2022-11-08 NHP stim procedure:
tiled_snippet_arrays("Forrest", 2022, 11, 8, ...
    'T', [10 30], ... % Looking at snippets from 10-30 ms after each stim onset
    'Type', @(varargin)Snippet_Array_8_8_L_Chart(varargin{:}), ... % We used the 8x8 large grids
    'Input_Root', 'R:/NMLShare/generated_data/primate/DARPA_N3/N3_Patch', ... % Saved on raptor
    'Output_Figure_Root', 'C:/Users/Max/Box/N3_SharpFocus/Phase 3 experiments/generated_data/Forrest/Forrest_2022_11_08/figures/Interleaved'); % And export to Box

tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'T', [10 30], ... % Looking at snippets from 10-30 ms after each stim onset
    'Type', @(varargin)Snippet_Array_8_8_L_Chart(varargin{:}), ... % We used the 8x8 large grids
    'Input_Root', 'R:/NMLShare/generated_data/primate/DARPA_N3/N3_Patch', ... % Saved on raptor
    'Output_Figure_Root', 'C:/Users/Max/Box/N3_SharpFocus/Phase 3 experiments/generated_data/Forrest/Forrest_2022_11_08/figures/Interleaved'); % And export to Box

% % Put the tiled_mean_arrays in a different format for the J_5 / J_10
% "cross" sweeps % %

%% J_5
fig = figure(...
        'Name', 'J_5 Cross Sweep (Run24 A)', ...
        'Color', 'w',...
        'Position',[350 150 875 650]);
L = tiledlayout(fig,3,3);
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 5, ... % This is the center of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 4, ... % This is the lateral part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_x-2mm_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 6, ... % This is the medial part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_x2mm_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 2, ... % This is the anterior part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_y-2mm_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 8, ... % This is the posterior part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_y2mm_-13EMU_Biphasic-Anodal");
ax = nexttile(L, 7);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Lateral | Posterior", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
ax = nexttile(L, 3);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Anterior | Medial", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
title(L, "J_5 ||Averages|| (N = 29) | 2-mm Cross", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-A | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_J_5_Cross_A");

fig = figure(...
        'Name', 'J_5 Cross Sweep (Run24 B)', ...
        'Color', 'w',...
        'Position',[350 150 875 650]);
L = tiledlayout(fig,3,3);
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 5, ... % This is the center of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 4, ... % This is the lateral part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_x-2mm_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 6, ... % This is the medial part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_x2mm_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 2, ... % This is the anterior part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_y-2mm_-13EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 8, ... % This is the posterior part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Tag', "Run24_J_5_y2mm_-13EMU_Biphasic-Anodal");
ax = nexttile(L, 7);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Lateral | Posterior", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
ax = nexttile(L, 3);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Anterior | Medial", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
title(L, "J_5 ||Averages|| (N = 29) | 2-mm Cross", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-B | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_J_5_Cross_B");

%% J_10
fig = figure(...
        'Name', 'J_10 Cross Sweep (Run24 A)', ...
        'Color', 'w',...
        'Position',[350 150 875 650]);
L = tiledlayout(fig,3,3);
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 5, ... % This is the center of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 4, ... % This is the lateral part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_x-2mm_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 6, ... % This is the medial part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_x2mm_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 2, ... % This is the anterior part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_y-2mm_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 8, ... % This is the posterior part of the cross
    'Array', "A", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_y2mm_-26EMU_Biphasic-Anodal");
ax = nexttile(L, 7);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Lateral | Posterior", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
ax = nexttile(L, 3);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Anterior | Medial", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
title(L, "J_{10} ||Averages|| (N = 29) | 2-mm Cross", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-A | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_J_10_Cross_A");

fig = figure(...
        'Name', 'J_10 Cross Sweep (Run24 B)', ...
        'Color', 'w',...
        'Position',[350 150 875 650]);
L = tiledlayout(fig,3,3);
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 5, ... % This is the center of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 4, ... % This is the lateral part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_x-2mm_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 6, ... % This is the medial part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_x2mm_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 2, ... % This is the anterior part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_y-2mm_-26EMU_Biphasic-Anodal");
tiled_mean_arrays("Forrest", 2022, 11, 8, ...
    'Tiled_Layout', L, ...
    'Tiled_Location', 8, ... % This is the posterior part of the cross
    'Array', "B", ...
    'Auto_Keep_Figure', true, ...
    'Use_CAR', true, ...
    'Tag', "Run24_J_10_y2mm_-26EMU_Biphasic-Anodal");
ax = nexttile(L, 7);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Lateral | Posterior", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
ax = nexttile(L, 3);
set(ax, 'NextPlot', 'add', 'XColor', 'none', 'YColor', 'none');
text(ax, 0.5, 0.5, "Anterior | Medial", 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
title(L, "J_{10} ||Averages|| (N = 29) | 2-mm Cross", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-B | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_J_10_Cross_B");

%% Jsafety sweeps
sweep_data = readtable('Jsafety_Sweeps.xlsx');
sweep_data.Tag = string(sweep_data.Tag);
T = sweep_data(strcmpi(sweep_data.Sweep, 'Jsafety_10'), :);
fig = figure(...
        'Name', 'Jsafety_10 Strip Sweep (Run40 A)', ...
        'Color', 'w',...
        'Position',[92         545        1563         312]);
L = tiledlayout(fig,max(T.row),max(T.col), 'Padding', 'tight', 'TileSpacing', 'tight');
for iT = 1:size(T,1)
    tiled_mean_arrays("Forrest", 2022, 11, 8, ...
        'Tiled_Layout', L, ...
        'Tiled_Location', {T.index(iT)-(rem(T.index(iT)+1,2)), [1, 2]}, ... % First one is "where does it go"; second is [rows, cols] for size of panel.
        'Array', "A", ...
        'Auto_Keep_Figure', true, ...
        'Use_CAR', true, ...
        'Tag', T.Tag(iT));
end
for ii = 1:numel(L.Children)
    xlabel(L.Children(ii), '', 'Color', 'none');
    ylabel(L.Children(ii), '', 'Color', 'none');
    setRMS_Range(L.Children(ii), [0 3.5]);
end
title(L, "Jsafety_{10} ||Averages|| (N = 24) ", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-A | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_Jsafety_10_Strip_A");

fig = figure(...
        'Name', 'Jsafety_10 Strip Sweep (Run40 B)', ...
        'Color', 'w',...
        'Position',[92         545        1563         312]);
L = tiledlayout(fig,max(T.row),max(T.col), 'Padding', 'tight', 'TileSpacing', 'tight');
for iT = 1:size(T,1)
    tiled_mean_arrays("Forrest", 2022, 11, 8, ...
        'Tiled_Layout', L, ...
        'Tiled_Location', {T.index(iT)-(rem(T.index(iT)+1,2)), [1, 2]}, ... % First one is "where does it go"; second is [rows, cols] for size of panel.
        'Array', "B", ...
        'Auto_Keep_Figure', true, ...
        'Use_CAR', true, ...
        'Tag', T.Tag(iT));
end
for ii = 1:numel(L.Children)
    xlabel(L.Children(ii), '', 'Color', 'none');
    ylabel(L.Children(ii), '', 'Color', 'none');
    setRMS_Range(L.Children(ii), [0 3.5]);
end
title(L, "Jsafety_{10} ||Averages|| (N = 24) ", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-B | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_Jsafety_10_Strip_B");


T = sweep_data(strcmpi(sweep_data.Sweep, 'Jsafety_20'), :);
fig = figure(...
        'Name', 'Jsafety_20 Strip Sweep (Run40 A)', ...
        'Color', 'w',...
        'Position',[92         545        1563         312]);
L = tiledlayout(fig,max(T.row),max(T.col), 'Padding', 'tight', 'TileSpacing', 'tight');
for iT = 1:size(T,1)
    tiled_mean_arrays("Forrest", 2022, 11, 8, ...
        'Tiled_Layout', L, ...
        'Tiled_Location', {T.index(iT)-(rem(T.index(iT)+1,2)), [1, 2]}, ... % First one is "where does it go"; second is [rows, cols] for size of panel.
        'Array', "A", ...
        'Auto_Keep_Figure', true, ...
        'Use_CAR', true, ...
        'Tag', T.Tag(iT));
end
for ii = 1:numel(L.Children)
    xlabel(L.Children(ii), '', 'Color', 'none');
    ylabel(L.Children(ii), '', 'Color', 'none');
    setRMS_Range(L.Children(ii), [0 3.5]);
end
title(L, "Jsafety_{20} ||Averages|| (N = 24) ", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-A | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_Jsafety_20_Strip_A");

fig = figure(...
        'Name', 'Jsafety_20 Strip Sweep (Run40 B)', ...
        'Color', 'w',...
        'Position',[92         545        1563         312]);
L = tiledlayout(fig,max(T.row),max(T.col), 'Padding', 'tight', 'TileSpacing', 'tight');
for iT = 1:size(T,1)
    tiled_mean_arrays("Forrest", 2022, 11, 8, ...
        'Tiled_Layout', L, ...
        'Tiled_Location', {T.index(iT)-(rem(T.index(iT)+1,2)), [1, 2]}, ... % First one is "where does it go"; second is [rows, cols] for size of panel.
        'Array', "B", ...
        'Auto_Keep_Figure', true, ...
        'Use_CAR', true, ...
        'Tag', T.Tag(iT));
end
for ii = 1:numel(L.Children)
    xlabel(L.Children(ii), '', 'Color', 'none');
    ylabel(L.Children(ii), '', 'Color', 'none');
    setRMS_Range(L.Children(ii), [0 3.5]);
end
title(L, "Jsafety_{20} ||Averages|| (N = 24) ", 'FontName', 'Tahoma', 'Color', 'k');
subtitle(L, "(Array-B | 10.0-ms to 30.0-ms after stim onset)", 'FontName', 'Tahoma', 'Color', [0.65 0.65 0.65]);
default.savefig(fig, "C:\Users\Max\Box\N3_SharpFocus\Phase 3 experiments\generated_data\Forrest\Forrest_2022_11_08\figures\Sweeps\Run24_Jsafety_20_Strip_B");