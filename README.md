# Signal-Wave-Generator

This MATLAB App is a signal generator that can produce a variety of signals, including sine, cosine, square, and sawtooth waves. This app is equipped with a range of user interface components such as numeric edit fields, drop-down menus, and a graphical object named UIAxes, which displays data.

Once the user clicks on the "Simulate" button, the app's single callback function "SimulateButtonPushed" executes. This function extracts the values entered by the user for amplitude, frequency, and time from the corresponding numeric edit fields. Using the linspace function, a time vector "t" is generated to represent a time period from 0 to the input time, incremented by 0.01 seconds.

The app uses a switch statement to determine the type of signal to generate based on the user's selection in the "WaveTypeDropDown" drop-down menu. Depending on the selected signal type, a signal array is produced using the appropriate signal formula and then plotted on the UIAxes.

There is an option to choose the type of line to display for the plotted signal using the "LineTypeDropDown" drop-down menu. If the line type is set to "Default," the signal is displayed as a continuous line using the plot function. If the line type is set to "Stem," the signal is shown using the stem plot.

Regardless of the chosen line type, the signal is plotted incrementally for each time period "t" using a for loop. The hold on command is used to retain the current plot, and the pause command adds a delay of 0.1 seconds between each increment in the for loop. After a delay of 4 seconds, the plotted signal is cleared from the UIAxes using the delete command to make room for the next signal to be displayed.
