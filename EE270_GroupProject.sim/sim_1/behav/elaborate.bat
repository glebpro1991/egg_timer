@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 760e99cffac2473391d01a474c2ba5b7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot egg_timerTB_behav xil_defaultlib.egg_timerTB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
