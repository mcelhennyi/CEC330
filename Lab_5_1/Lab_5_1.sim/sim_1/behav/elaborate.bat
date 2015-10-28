@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto bbd60e712b114543a44961d514aca1ca -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Top_behav xil_defaultlib.Top -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
