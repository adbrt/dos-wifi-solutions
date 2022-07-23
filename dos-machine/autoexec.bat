REM these lines should be added to the AUTOEXEC.BAT file of the DOS machine

@ECHO OFF
REM path to mTCP installation directory is set
SET PATH=C:\DOS;C:\NET\MTCP

REM packet driver is loaded
C:\NET\3COM\3C5X9PD.COM 0x60

REM mTCP configuration file path is set
SET MTCPCFG=C:\NET\MTCP\MTCP.CFG

REM DHCP gets the IP address
DHCP
