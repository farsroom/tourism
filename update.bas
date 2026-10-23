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
	Dim Install As Timer
End Sub
Sub Globals
	Dim Ss As String
End Sub
Sub Activity_Create(FirstTime As Boolean)
	ProgressDialogShow2("در حال بروز رسانی...",False)
	Install.Initialize("Install",1000)
	Install.Enabled=False

	Dim InstallApp As HttpJob
	InstallApp.Initialize("InstallApp",Me)
	InstallApp.Download("http://www.touka-co.ir/tourism.apk")
End Sub
Sub Activity_Resume

End Sub
Sub Activity_Pause (UserClosed As Boolean)

End Sub
Sub Install_Tick
	Install.Enabled=False
	Install_App
End Sub
Sub Install_App
	DoEvents
	Dim Installs As Intent
	Installs.Initialize(Installs.ACTION_VIEW,"file://" & File.Combine(File.DirRootExternal,"tourism.apk"))
	Installs.SetType("application/vnd.android.package-archive")
	StartActivity(Installs)
	DoEvents
	ExitApplication
End Sub
Sub JobDone(job As HttpJob)
	ProgressDialogHide

	If job.Success Then
		If job.JobName="InstallApp" Then
			Dim OutStream As OutputStream

			OutStream=File.OpenOutput(File.DirRootExternal,"tourism.apk",False)
			File.Copy2(job.GetInputStream,OutStream)
			OutStream.Close

			Install.Enabled=True
			Return
		End If

		Dim res As String
		res = job.GetString

		If res="0" Then
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
			ExitApplication
			job.Release
			Return
		Else If res="﻿" Then
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("html")=1 Then
			ToastMessageShow("اینترنت تمام شده.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("null")=1 Then
			ToastMessageShow("مطلبی وجود ندارد.", True)
			ExitApplication
			job.Release
			Return
		Else If res="NULL" Then
			ToastMessageShow("مطلبی وجود ندارد.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("[]")=1 Then
			ToastMessageShow("مطلبی وجود ندارد.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("<no>")=1 Then
			ToastMessageShow("مشکل در اینترنت شما. دوباره سعی کنید.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("<no>")<>-1 Then
			ToastMessageShow("مشکل در اینترنت شما. دوباره سعی کنید.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("[]")<>-1 Then
			ToastMessageShow("مطلبی وجود ندارد.", True)
			ExitApplication
			job.Release
			Return
		Else If res.IndexOf("[{")=-1 Then
			If res="" Then
				ToastMessageShow("مشکل در اینترنت شما. دوباره سعی کنید.", True)
				ExitApplication
				job.Release
				Return
			End If
		Else If res.IndexOf("Warning:")=1 Then
			job.Release
			Msgbox("اشکال بوجود آمده از طرف سرور. درصورت امکان برنامه را بروز رسانی کنید.","")
			ExitApplication
		End If

	Else
		Ss=job.ErrorMessage
		If Ss.IndexOf("timed out")<>-1 Then
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
			ExitApplication
		Else
			ToastMessageShow("مشکل در برقراری ارتباط با سرور.", True)
			ExitApplication
		End If
	End If
	job.Release
End Sub