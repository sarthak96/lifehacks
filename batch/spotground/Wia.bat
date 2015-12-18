@if (@X)==(@Y) @end /* JScript comment
	@echo off
	
	rem :: the first argument is the script name as it will be used for proper help message
	cscript //E:JScript //nologo "%~f0" %*

	exit /b %errorlevel%
	
@if (@X)==(@Y) @end JScript comment */

FSOObj = new ActiveXObject("Scripting.FileSystemObject");
var ARGS = WScript.Arguments;
if (ARGS.Length < 1 ) {
 WScript.Echo("No file passed");
 WScript.Echo("Usage:");
 WScript.Echo(" Image");
 WScript.Quit(1);
}
var filename=ARGS.Item(0);

if (!FSOObj.FileExists(filename)){
	WScript.Echo("File "+filename+" does not exists");
	WScript.Quit(2);
}
try {
	var img=new ActiveXObject("WIA.ImageFile");
}catch(err){
	WScript.Echo("Probably "+ filename + " is not an image");
	WScript.Echo(err.message);
	WScript.Quit(3);
	
}
img.LoadFile(filename);
WScript.Echo(img.Width.toString()+img.Height);
