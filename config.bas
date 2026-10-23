Type=StaticCode
Version=7.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Process_Globals
	Public PackegName,sid2,name2,token As String
	Public AllsmsId As Int
	Public Version,UrlGet,UrlGetOnly,AppActive,ShareLink As String
	Public Cache,Color,ColorInstall,Gets As String
	Public Refreshs As Boolean=False
	Private ht As Float
	Private StrUtil As StringUtils
	Private Sound As MediaPlayer
	Public Serial,Model As String
	Public font As Typeface
End Sub
Sub Initialize
	Version=Application.VersionCode'ورژن
	Color=Colors.RGB(70,82,158)'رنگ
	ColorInstall=Color
	UrlGetOnly="http://www.touka-co.ir"
	UrlGet="http://www.touka-co.ir/tourist"&Application.VersionCode&".php"

	PackegName=Application.PackageName
	If PackegName<>"ir.farsroom.tourism" Then ExitApplication

	font=Typeface.LoadFromAssets("font.ttf")
	Cache=DateTime.GetYear(DateTime.Now) & DateTime.GetMonth(DateTime.Now) & DateTime.GetDayOfWeek(DateTime.Now) & "_"'کش کردن اطلاعات

	Initializes
End Sub
Sub Initializes()
	File.MakeDir(File.DirRootExternal,"Android")
	File.MakeDir(File.DirRootExternal,"Android/data")
	File.MakeDir(File.DirRootExternal,"Android/data/" & PackegName)
	File.MakeDir(File.DirInternal,"Android")
	File.MakeDir(File.DirInternal,"Android/data")
	File.MakeDir(File.DirInternal,"Android/data/" & PackegName)

	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/serial")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/serial","")
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/model")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/model","")

	If File.ReadString(File.DirInternal,"Android/data/" & PackegName & "/serial")="" Or File.ReadString(File.DirInternal,"Android/data/" & PackegName & "/model")="" Then
		Try
			' سریال گوشی
			Dim phon1 As PhoneId
			Serial=phon1.GetDeviceId
			'بدست آوردن مدل گوشی
			Dim model2 As Phone
			Model=model2.Model
			
			File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/serial",Serial)
			File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/model",Model)
		Catch
			Msgbox("سریال یا مدل گوشی قابل خواندن نیست.","")
			ExitApplication
			Return
		End Try
		If Serial="" Or Serial="unknown" Or Model="" Or Model="unknown" Then
			Msgbox("سریال یا مدل گوشی قابل خواندن نیست.","")
			ExitApplication
			Return
		End If
	End If

	Serial	=File.ReadString(File.DirInternal,"Android/data/" & PackegName & "/serial")
	Model	=File.ReadString(File.DirInternal,"Android/data/" & PackegName & "/model")
	Version	=Version & "," & Serial & "," & Model

	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/Color")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/Color",ColorInstall)'رنگ
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/Timeout")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/Timeout",120000)
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/name")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/name","کاربر میهمان")
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/email")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/email","")
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/pasword")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/pasword","")
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/sid")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/sid","582")'شماره کاربر میهمان در دیتابیسه
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/admin")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/admin","")
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/admin2")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/admin2","")
	'=============================================قیمتها=======================================================
	If File.Exists(File.DirInternal,"Android/data/" & PackegName & "/")=False Then File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/","")
End Sub
Public Sub Get(Str As String) As String
	Return File.ReadString(File.DirInternal,"Android/data/" & PackegName & "/" & Str)
End Sub
Public Sub Set(Str As String,Var As String)
	File.WriteString(File.DirInternal,"Android/data/" & PackegName & "/" & Str,Var)
End Sub
Public Sub Exists(Str As String) As Boolean
	Return File.Exists(File.DirInternal,"Android/data/" & PackegName & "/" & Str)
End Sub
Public Sub En_Fr(tttt As String) As String

	tttt=tttt.Replace("1","۱")
	tttt=tttt.Replace("2","۲")
	tttt=tttt.Replace("3","۳")
	tttt=tttt.Replace("4","۴")
	tttt=tttt.Replace("5","۵")
	tttt=tttt.Replace("6","۶")
	tttt=tttt.Replace("7","۷")
	tttt=tttt.Replace("8","۸")
	tttt=tttt.Replace("9","۹")
	tttt=tttt.Replace("0","۰")

	Return tttt
End Sub
Public Sub Fr_En(tttt As String) As String

	tttt=tttt.Replace("۱","1")
	tttt=tttt.Replace("۲","2")
	tttt=tttt.Replace("۳","3")
	tttt=tttt.Replace("۴","4")
	tttt=tttt.Replace("۵","5")
	tttt=tttt.Replace("۶","6")
	tttt=tttt.Replace("۷","7")
	tttt=tttt.Replace("۸","8")
	tttt=tttt.Replace("۹","9")
	tttt=tttt.Replace("۰","0")
	
	Return tttt
End Sub
Public Sub art(txts As String,leb As Label,fonts As Typeface,size As Int) As Float
	Dim before,after As Float
	Dim Obj1 As Reflector
	
	leb.text=txts
	leb.TextSize=size
	leb.Gravity=Gravity.RIGHT
	leb.Left=leb.Left
	leb.Typeface=fonts
	ht = StrUtil.MeasureMultilineTextHeight(leb,txts)

    Obj1.Target = leb  
    before = Obj1.RunMethod("getLineHeight")    'Get the height of line BEFORE you change it
    Obj1.Target = leb 
    Obj1.RunMethod3("setLineSpacing", .10, "java.lang.float", 1.5, "java.lang.float")  'Change the space between lines
    Obj1.Target = leb 
    after = Obj1.RunMethod("getLineHeight")    'Get the height of line AFTER  you change it
    ht = ((after * ht)/before)
	leb.Height = ht

	Return  ht
End Sub
Public Sub Sounds
	Sound.Initialize()
	Sound.Load(File.DirAssets,"click.ogg")
	Sound.play
End Sub