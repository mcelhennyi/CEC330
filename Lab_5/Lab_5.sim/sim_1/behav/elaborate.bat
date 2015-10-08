@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto b600baf3cfc04a939118781ce72580bc -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Memory_tb_behav xil_defaultlib.Memory_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
