Type=Activity
Version=7.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region
Sub Process_Globals
	Private Timers As Timer
End Sub
Sub Globals
	Private hScroll As HorizontalScrollView
	Private vScroll As ScrollView
	Private spl(10),menu,img_menu,tops,title As ImageView
	Private Txt As Label
	Private i,ii As Int=0
	Private Caption(20),Sss As String
End Sub
Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmmain")

	tops.Height=50dip
	tops.Width=100%x
	tops.Bitmap=LoadBitmapSample(File.DirAssets,"tops.xml",tops.Width,tops.Height)
	title.Height=tops.Height-10dip
	title.Width=(169Dip*title.Height)/45dip
	title.Left=(100%x/2)-(title.Width/2)
	title.Bitmap=LoadBitmapSample(File.DirAssets,"title.xml",title.Width,title.Height)

	vScroll.Height=100%y-tops.Height+12dip
	vScroll.Width=100%x
	vScroll.Top=tops.Height-12dip

	hScroll.Initialize(100%x,"hScroll")
	vScroll.Panel.AddView(hScroll,0,0,100%x,100%y/3)

	Loads

	Timers.Initialize("timer",2000)
	Timers.Enabled=True

	Try
		Sss=config.Get(config.Cache)
	Catch
		Dim job As HttpJob
		job.Initialize("job", Me)
		job.PostString(config.UrlGet,config.Version & ",gets")
	End Try
End Sub
Sub Activity_Resume

End Sub
Sub Activity_Pause (UserClosed As Boolean)

End Sub
Sub Loads
	Dim l,t As Int=0

	Caption(1)="چای و نوشیدنی گرم"
	Caption(2)="غذاهای محلی شمال"
	Caption(3)="قلیان و دخانیات"
	Caption(4)="تصاویر استراحتگاه"
	Caption(5)="محل استراحتگاه از روی نقشه"
	Caption(6)="اینستاگرام ما"
	Caption(7)="کانال تلگرام ما"
	Caption(8)="ارتباط با ما"

	For i=1 To 7
		spl(i).Initialize("")
		hScroll.Panel.AddView(spl(i),l,0,hScroll.Width,hScroll.Height)
		spl(i).Gravity=Gravity.FILL
		spl(i).Bitmap=LoadBitmapSample(File.DirAssets,"spl/"&i&".xml",spl(i).Width,spl(i).Height)
		l=i*100%x
	Next
	hScroll.Panel.Width=l

	t=hScroll.Height+5dip
	For i=1 To 8
		menu.Initialize("menu")
		vScroll.Panel.AddView(menu,0,t,vScroll.Width,1dip)
		menu.Gravity=Gravity.FILL
		menu.Height=(83dip*menu.Width)/333dip
		menu.Left=(100%x/2)-(menu.Width/2)
		menu.Bitmap=LoadBitmapSample(File.DirAssets,"menu.xml",menu.Width,menu.Height)
		menu.Tag=i

		img_menu.Initialize("")
		vScroll.Panel.AddView(img_menu,0,menu.Top+5dip,menu.Height-10dip,menu.Height-10dip)
		img_menu.Gravity=Gravity.FILL
		img_menu.Left=100%x-img_menu.Width-10dip
		img_menu.Bitmap=LoadBitmapSample(File.DirAssets,"img_menu"&i&".xml",img_menu.Width,img_menu.Height)

		Txt.Initialize("")
		vScroll.Panel.AddView(Txt,0,menu.Top+5dip,menu.Width-menu.Height,menu.Height-10dip)
		Txt.Gravity=Gravity.CENTER
		Txt.Typeface=config.font
		Txt.TextSize=14
		Txt.TextColor=Colors.White
		Txt.Text=Caption(i)

		t=menu.top+menu.Height
	Next
	vScroll.Panel.Height=t

End Sub
Sub timer_Tick
	ii=ii+1
	If ii>6 Then ii=0
	hScroll.ScrollPosition=ii*100%x
End Sub
Sub menu_Click
	Dim S As String
	Dim m As ImageView
	m=Sender

	S=m.Tag
	Select S
		Case "6"
			Dim bazar As Intent
			Try
				bazar.initialize(bazar.action_view,"http://instagram.com/touka_tourist")
				StartActivity(bazar)
			Catch
				ToastMessageShow("اشکال در اتصال به اینستاگرام",False)
			End Try
			Return
		Case "7"
			Dim bazar As Intent
			Try
				bazar.initialize(bazar.action_view,"tg://resolve?domain=touka_tourist")
				StartActivity(bazar)
			Catch
				ToastMessageShow("اشکال در اتصال به تلگرام",False)
			End Try
			Return
		Case "8"
			Dim bazar As Intent
			Try
				bazar.initialize(bazar.action_view,"tg://resolve?domain=touka_Macan")
				StartActivity(bazar)
			Catch
				ToastMessageShow("اشکال در اتصال به تلگرام",False)
			End Try
			Return
	End Select

	config.Set("menu",S)
	StartActivity(menus)
End Sub
Sub FirstPage(COUNTRIES As List)
	Dim tl As TwoLines
	Dim maps1 As Map

	For ii=0 To COUNTRIES.Size-1
		maps1=COUNTRIES.Get(ii)
		tl.a1=maps1.Get("name")
		tl.a2=maps1.Get("mony")

		If tl.a1="null" Or tl.a1="" Or tl.a1="NULL" Then tl.a1=""
		If tl.a2="null" Or tl.a2="" Or tl.a2="NULL" Then tl.a2=""
		
		config.Set(tl.a1,tl.a2)
	Next
End Sub
Sub JobDone(job As HttpJob)
	If job.Success Then
		Dim res As String
		res = job.GetString

		If res="0" Then
			job.Release
			Return
		Else If res="﻿" Then
			job.Release
			Return
		Else If res="NULL" Then
			job.Release
			Return
		Else If res.IndexOf("html")=1 Then
			job.Release
			Return
		Else If res.IndexOf("null")=1 Then
			job.Release
			Return
		Else If res.IndexOf("[]")=1 Then
			job.Release
			Return
		Else If res.IndexOf("[]")<>-1 Then
			job.Release
			Return
		Else If res.IndexOf("<no>")=1 Then
			job.Release
			Return
		Else If res.IndexOf("<no>")<>-1 Then
			job.Release
			Return
		Else If res.IndexOf("<up>")=1 Then
			job.Release
			Msgbox("برنامه نیاز به بروز رسانی دارد.","")
			StartActivity(update)
			Return
		Else If res.IndexOf("<up>")<>-1 Then
			job.Release
			Msgbox("برنامه نیاز به بروز رسانی دارد.","")
			StartActivity(update)
			Return
		Else If res.IndexOf("[{")=-1 Then
			If res="" Then
				Return
			End If
		Else If res.IndexOf("Warning:")=1 Then
			Return
		End If

		Dim parser As JSONParser
		parser.Initialize(res)
		Dim COUNTRIES As List
		Try
			COUNTRIES = parser.NextArray
		Catch
			Return
		End Try
		If COUNTRIES.Size=0 Then
			job.Release
			Return
		End If

		config.Set(config.Cache,res)
		FirstPage(COUNTRIES)
	End If
	job.Release
End Sub