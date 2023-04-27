classdef SWG_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        TimeEditField             matlab.ui.control.NumericEditField
        TimeEditFieldLabel        matlab.ui.control.Label
        LineTypeDropDown          matlab.ui.control.DropDown
        PlotTypeLabel             matlab.ui.control.Label
        SignalWaveGeneratorLabel  matlab.ui.control.Label
        SimulateButton            matlab.ui.control.Button
        FrequencyEditField        matlab.ui.control.NumericEditField
        FrequencyEditFieldLabel   matlab.ui.control.Label
        AmplitudeEditField        matlab.ui.control.NumericEditField
        WaveTypeDropDown          matlab.ui.control.DropDown
        WaveTypeDropDownLabel     matlab.ui.control.Label
        AmplitudeEditFieldLabel   matlab.ui.control.Label
        UIAxes                    matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SimulateButton
        function SimulateButtonPushed(app, event)
        

        
       A = app.AmplitudeEditField.Value; % Input Amplitude
       F = app.FrequencyEditField.Value; % Input Frequency
       temp = app.TimeEditField.Value;   % Input Time
       t = 0:0.01:temp;                  % Time periods
       
switch app.WaveTypeDropDown.Value
    
    
    %Sin Statements 
    case 'Sine Wave'  
                                
        y1 = A*sin(2*pi*F*t);  % Sin formula 
               
            if strcmpi(app.LineTypeDropDown.Value , 'Default')

                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = plot(app.UIAxes,t(1:k),y1(1:k), ...
                        'LineWidth',2.0,"Color",'g');
                    pause(0.1);  
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot
               
            else
                  
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = stem(app.UIAxes,t(1:k),y1(1:k), ...
                        'LineWidth',2.0,"Color",'g');
                    pause(0.1);  
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot      
            end

    %Cosine Statements            
    case 'Cosine Wave'
                
        y2 = A*cos(2*pi*F*t);  % Cosine formula 
                
            if strcmpi(app.LineTypeDropDown.Value , 'Default') 
                   
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = plot(app.UIAxes,t(1:k),y2(1:k), ...
                        'LineWidth',2.0,"Color",'b');
                    pause(0.1);
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot     
            else 
                   
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = stem(app.UIAxes,t(1:k),y2(1:k), ...
                        'LineWidth',2.0,"Color",'b');
                    pause(0.1); 
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot 
            end
                   
               

    %Sqaure Statements           
    case 'Square Wave'
                
        y3 = A*sign(sin(2*pi*F*t));  % Returns an array the same size
              
            if strcmpi(app.LineTypeDropDown.Value , 'Default') 
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = plot(app.UIAxes,t(1:k),y3(1:k), ...
                        'LineWidth',2.0,"Color",'r');
                    pause(0.1);
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot   
            else
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = stem(app.UIAxes,t(1:k),y3(1:k), ...
                        'LineWidth',2.0,"Color",'r');
                    pause(0.1);
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot   
            end
    %Sawtooth Statements             
    otherwise
                
        T = 1/F;                % Formula using modulus and interp1
        Tx = [0 T/2 T];
        Ay = [0 1 A];
                                % Interp1 command interpolates between data points
        y4 = interp1(Tx, Ay, mod(t, T)); 
               
            if strcmpi(app.LineTypeDropDown.Value , 'Default')
                   
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = plot(app.UIAxes,t(1:k),y4(1:k), ...
                        'LineWidth',2.0,"Color",'magenta');
                    pause(0.1);
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot    
            else
                   
                for k = 1:length(t)
                    hold on % Retains the current plot
                    hPlotData = stem(app.UIAxes,t(1:k),y4(1:k), ...
                        'LineWidth',2.0,"Color",'magenta');
                    pause(0.1);
                end
             pause(4);           % Wait 4 seconds   
             delete(hPlotData);  % Clear Plot       
            end   
           
end

    
        end

        % Callback function
        function ExitButtonPushed(app, event)
 
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.6824 0.8392 0.8196];
            app.UIFigure.Position = [100 100 660 634];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Wave')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [28 167 606 380];

            % Create AmplitudeEditFieldLabel
            app.AmplitudeEditFieldLabel = uilabel(app.UIFigure);
            app.AmplitudeEditFieldLabel.HorizontalAlignment = 'right';
            app.AmplitudeEditFieldLabel.FontName = 'Trebuchet MS';
            app.AmplitudeEditFieldLabel.FontSize = 13;
            app.AmplitudeEditFieldLabel.FontWeight = 'bold';
            app.AmplitudeEditFieldLabel.Position = [409 117 68 22];
            app.AmplitudeEditFieldLabel.Text = 'Amplitude';

            % Create WaveTypeDropDownLabel
            app.WaveTypeDropDownLabel = uilabel(app.UIFigure);
            app.WaveTypeDropDownLabel.HorizontalAlignment = 'right';
            app.WaveTypeDropDownLabel.FontName = 'Trebuchet MS';
            app.WaveTypeDropDownLabel.FontSize = 13;
            app.WaveTypeDropDownLabel.FontWeight = 'bold';
            app.WaveTypeDropDownLabel.Position = [40 96 72 22];
            app.WaveTypeDropDownLabel.Text = 'Wave Type';

            % Create WaveTypeDropDown
            app.WaveTypeDropDown = uidropdown(app.UIFigure);
            app.WaveTypeDropDown.Items = {'Sine Wave', 'Cosine Wave', 'Square Wave', 'Sawtooth Wave'};
            app.WaveTypeDropDown.FontName = 'Trebuchet MS';
            app.WaveTypeDropDown.FontSize = 13;
            app.WaveTypeDropDown.FontWeight = 'bold';
            app.WaveTypeDropDown.Position = [127 96 123 22];
            app.WaveTypeDropDown.Value = 'Sine Wave';

            % Create AmplitudeEditField
            app.AmplitudeEditField = uieditfield(app.UIFigure, 'numeric');
            app.AmplitudeEditField.FontName = 'Trebuchet MS';
            app.AmplitudeEditField.FontSize = 13;
            app.AmplitudeEditField.FontWeight = 'bold';
            app.AmplitudeEditField.Position = [492 117 100 22];

            % Create FrequencyEditFieldLabel
            app.FrequencyEditFieldLabel = uilabel(app.UIFigure);
            app.FrequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.FrequencyEditFieldLabel.FontName = 'Trebuchet MS';
            app.FrequencyEditFieldLabel.FontSize = 13;
            app.FrequencyEditFieldLabel.FontWeight = 'bold';
            app.FrequencyEditFieldLabel.Position = [410 85 70 22];
            app.FrequencyEditFieldLabel.Text = 'Frequency';

            % Create FrequencyEditField
            app.FrequencyEditField = uieditfield(app.UIFigure, 'numeric');
            app.FrequencyEditField.FontName = 'Trebuchet MS';
            app.FrequencyEditField.FontSize = 13;
            app.FrequencyEditField.FontWeight = 'bold';
            app.FrequencyEditField.Position = [494 85 98 22];

            % Create SimulateButton
            app.SimulateButton = uibutton(app.UIFigure, 'push');
            app.SimulateButton.ButtonPushedFcn = createCallbackFcn(app, @SimulateButtonPushed, true);
            app.SimulateButton.BackgroundColor = [1 1 1];
            app.SimulateButton.FontName = 'Trebuchet MS';
            app.SimulateButton.FontWeight = 'bold';
            app.SimulateButton.FontAngle = 'italic';
            app.SimulateButton.Position = [282 10 101 36];
            app.SimulateButton.Text = 'Simulate';

            % Create SignalWaveGeneratorLabel
            app.SignalWaveGeneratorLabel = uilabel(app.UIFigure);
            app.SignalWaveGeneratorLabel.HorizontalAlignment = 'center';
            app.SignalWaveGeneratorLabel.FontName = 'Trebuchet MS';
            app.SignalWaveGeneratorLabel.FontSize = 24;
            app.SignalWaveGeneratorLabel.FontWeight = 'bold';
            app.SignalWaveGeneratorLabel.Position = [201 573 263 31];
            app.SignalWaveGeneratorLabel.Text = 'Signal Wave Generator';

            % Create PlotTypeLabel
            app.PlotTypeLabel = uilabel(app.UIFigure);
            app.PlotTypeLabel.HorizontalAlignment = 'right';
            app.PlotTypeLabel.FontName = 'Trebuchet MS';
            app.PlotTypeLabel.FontSize = 13;
            app.PlotTypeLabel.FontWeight = 'bold';
            app.PlotTypeLabel.Position = [48 64 63 22];
            app.PlotTypeLabel.Text = 'Plot Type';

            % Create LineTypeDropDown
            app.LineTypeDropDown = uidropdown(app.UIFigure);
            app.LineTypeDropDown.Items = {'Default', 'Stem'};
            app.LineTypeDropDown.FontName = 'Trebuchet MS';
            app.LineTypeDropDown.FontSize = 13;
            app.LineTypeDropDown.FontWeight = 'bold';
            app.LineTypeDropDown.Position = [126 64 124 22];
            app.LineTypeDropDown.Value = 'Default';

            % Create TimeEditFieldLabel
            app.TimeEditFieldLabel = uilabel(app.UIFigure);
            app.TimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TimeEditFieldLabel.FontName = 'Trebuchet MS';
            app.TimeEditFieldLabel.FontSize = 13;
            app.TimeEditFieldLabel.FontWeight = 'bold';
            app.TimeEditFieldLabel.Position = [442 53 36 22];
            app.TimeEditFieldLabel.Text = 'Time';

            % Create TimeEditField
            app.TimeEditField = uieditfield(app.UIFigure, 'numeric');
            app.TimeEditField.FontName = 'Trebuchet MS';
            app.TimeEditField.FontSize = 13;
            app.TimeEditField.FontWeight = 'bold';
            app.TimeEditField.Position = [493 53 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = SWG_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end