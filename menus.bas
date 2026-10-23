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

End Sub
Sub Globals
	Private vScroll,Scroll As ScrollView
	Private title,Txt,Txt2 As Label
	Private menu,img_menu,bg,pic(20) As ImageView
	Private i,ii,picCount As Int
	Private Caption(30),Caption2(30),Mony(30) As String
	Private Panel As Panel
	Private web As WebView
End Sub
Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("menus")

	title.Width=100%x
	title.Height=50dip
	title.Gravity=Gravity.CENTER
	title.Typeface=config.font
	title.TextSize=14
	title.TextColor=Colors.White

	bg.Width=100%x
	bg.Height=100%y
	bg.Bitmap=LoadBitmap(File.DirAssets,"bg.xml")

	Panel.Width=90%x
	Panel.Height=90%y
	Panel.Top=(100%y/2)-(Panel.Height/2)
	Panel.Left=(100%x/2)-(Panel.Width/2)

	Scroll.Left=5dip
	Scroll.Top=5dip
	Scroll.Width=Panel.Width-10dip
	Scroll.Height=Panel.Height-10dip

	vScroll.Top=title.Height
	vScroll.Height=100%y-title.Height
	vScroll.Width=100%x

	web.Top=title.Height
	web.Height=100%y-title.Height
	web.Width=100%x

	Sleep(0)
	Select config.Get("menu")
		Case "1"
			m1
		Case "2"
			m2
		Case "3"
			m3
		Case "4"
			m4
		Case "5"
			m5
	End Select
End Sub
Sub Activity_Resume

End Sub
Sub Activity_Pause (UserClosed As Boolean)

End Sub
Sub Activity_KeyPress (KeyCode As Int) As Boolean
	If KeyCode<>4 Then Return True
	If bg.Visible=True Then
		bg.Visible=False
		Panel.Visible=False
		Return True
	End If
End Sub
Sub menu_Click
	Dim m As Label
	Dim ht As Float

	m=Sender
	Caption2(1)="اگر شب یلدا مهمان دارید و به دنبال یک غذای خاص هستید این غذای گیلانی را که شبیه خورش فسنجان است به شما پیشنهاد می‌کنیم."&CRLF&CRLF&"مواد لازم:"&CRLF&CRLF&"گردو ساییده نیم کیلو"&CRLF&"سبزی قورمه (جعفری, تره, کمی شنبلیله) نیم کیلو"&CRLF&"آبغوره 2 لیوان (ماده اصلی و مهم)"&CRLF&"رب انار یا آلوچه یک قاشق غذاخوری"&CRLF&"گوشت چرخ کرده نیم کیلو"&CRLF&"پیاز یک عدد"&CRLF&"نمک، فلفل و زرد چوبه به مقدار لازم"&CRLF&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. رب انار و یا آلوچه و آبغوره و گردو ساییده شده رو در قابلمه بریزین و یک لیوان و نیم آب سرد بهش اضافه کنین و خوب هم بزنین تا تمام مواد در آب حل بشن."&CRLF&CRLF&"2. در قابلمه رو بذارین ،شعله رو کمی زیاد کنین و به مدت 20 دقیقه بذارین بجوشه.تو این مدت هر از گاهی به غذا سر بزنین تا ته نگیره . حالا شعله رو کم کنین و بذارین آروم آروم گردو دم بیاد . دست کم این مرحله 3 ساعت وقت میگیره و تو این مدت باید مدام به غذا سر بزنین و هر وقت که لازم بود آب سرد به غذا اضافه کنین."&CRLF&CRLF&"3. طریقه اضافه کردن آب سرد به این صورته که اول تو لیوان کمی آب سرد بریزین و بعد کمی از آب رو تو دستتون ریخته و به کناره های خورش بپاشین. این کارو در چند مرحله انجام بدین و مقداری هم داخل خورش بزنین. یادتون باشه که یک دفعه کل آب سرد رو به خورش اضافه نکنین چون مغز گردو روغن پس نمیده و دست کم تو این 3 ساعت بارها و بارها باید به غذا آب سرد اضافه کنین."&CRLF&CRLF&"4. بعد از این مدت که گردو به اصطلاح دم اومد ، سبزی قورمه رو سرخ کنین و تو غذا بریزین. حالا تو این فاصله که گردو و سبزی قورمه دارن با هم جوش میخورن، گوشت چرخ کرده رو با پیاز رنده شده ، نمک ، فلفل و زرد چوبه مخلوط کنین و به اندازه 2 تا 3 قاشق غذا خوری آب به مایه گوشت اضافه کنین و خوب ورز بدین."&CRLF&CRLF&"نکته: مایه کوفته رو باید حدود 5 تا 10 دقیقه ورز بدین و بذارین یه نیم ساعتی بمونه تا طعم پیاز به خرد گوشت بره."&CRLF&CRLF&"5. اگه آب تو مایه گوشت چرخ کرده نریزین وقتی که کوفته ها رو تو غذا ریختین حالت تیغ تیغی پیدا میکنه ولی با اضافه کردن آب ، سطح کوفته‌ها تو خورش کاملا صاف و یکدست میشه. حالا به اندازه یه گردو از مایه گوشت چرخ کرده کوفته درست کنین. یادتون باشه که گوشت چرخ کرده کمی آب میره واسه همین اندازه های کوفته بعد از جوشیدن در غذا کمی کوچیک میشه. بعد زیر غذا رو زیاد کنین و وقتی که شروع به جوشیدن کرد کوفته ها رو بندازین تو خورش."&CRLF&CRLF&"6. اگه غذا در حال جوشیدن نباشه کوفته‌ها وا میرن. بعد از اینکه کوفته ها خودشونو گرفتن، زیر غذا رو کم کنین تا غذا جا بیفته. وقتی به مدت 2 یا 3 ساعت غذا جوش میخوره، کمی رقیق میشه ولی نگران نباشین که غذاتون آبکی شده . اگه قبل از سرو کردن به مدت یک ربع زیر غذا رو خاموش کنین، غذا کمی خودشو میگیره و غلیظ میشه."
	Caption2(2)="مواد لازم:"&CRLF&CRLF&"باقالی خشک کشاورزی(پاچ باقلا رشتی)  100 گرم"&CRLF&"شوید(شبت) خشک  2 قاشق غذاخوری"&CRLF&"سیر  3 الی 4 حبه تخم مرغ  2 عدد"&CRLF&"روغن  2 قاشق غذاخوری"&CRLF&"آب  2 لیوان"&CRLF&"زردچوبه, نمک وفلفل  به میزان دلخواه"&CRLF&CRLF&"طرز تهیه:"&CRLF&"1. ابتدا باقالی خشک را 5 الی 6 ساعت قبل (معمولا یک شب تا صبح) را در آب خیس کرده تا پوست آن به راحتی جدا شود. سپس پوست آن را جدا کرده و می شوریم. روغن را در یک قابلمه داغ نموده."&CRLF&CRLF&"2. سپس باقالی و سیر خشک خرد شده یا رنده شده را در آن تفت می دهیم.بعد از کمی تفت دادن شوید خشک و نمک- فلفل- زردچوبه را اضافه کرده و کاملا هم می زنیم و در روغن تفت می دهیم. وقتی کاملا بخار جمع شد."&CRLF&CRLF&"3. 2 لیوان آب ولرم را به قابلمه اضافه کرده و می گذاریم تا باقالی ها پخته شوند.(دقت شود که باقالی له نشود.) در آخر تخم مرغ ها را در خورش می شکنیم و در ظرف را می گذاریم تا خورش یک جوش بخورد و تخم مرغ ها ببندد."&CRLF&CRLF&"نکات:"&CRLF&CRLF&"1. تخم مرغ ها را بعد از شکستن در خورش نباید هم زد. کافیست کمی زرده آن را شل کنید تا به همان شکل کامل ببندد."&CRLF&CRLF&"2. می توان از تخم مرغ به تعداد نفرات در این خورش استفاده کرد. می توان به جای شوید خشک، از شوید تاز ه خرد شده در این خورش استفاده کرد. عطر و طعم بهتری خواهد داشت."&CRLF&CRLF&"3. بجای سیر خشک هم می توان از برگ سیر تازه خرد شده استفاده نمود. در خطه شمال کشور این غذا را به همراه چلو یا کته، سیر ترشی، ماهی شور و زیتون پرورده سرو می کنند."
	Caption2(3)="مواد لازم:"&CRLF&CRLF&" 600 گرم بادمجان"&CRLF&" 250 گرم گوجه فرنگی"&CRLF&" 3 حبه سیر"&CRLF&" 1 فنجان ماست"&CRLF&" 4/1 تا 2/1 فنجان روغن"&CRLF&" نمک و فلفل به میزان لازم"&CRLF&" نان لواش یا چیپس پیتاطرز تهیه بورانی بادمجان"&CRLF&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. بادمجان را برش داده و نمک می پاشیم و به مدت 20 تا 30 دقیقه استراحت می دهیم."&CRLF&"2. نمک ها را از روی بادمجانها پاک کرده و در ماهی تابه سرخ می کنیم تا فقط کمی طلایی شود. پس از سرخ شدن ، بادمجان در یک ظرف روی یک حوله کاغذی می گذاریم تا روغن اضافه آن خارج شود."&CRLF&"3. در این زمان، برش گوجه فرنگی را داخل میکسر ریخته یا رنده می کنیم و بعد سیر و نمک و فلفل را اضافه می کنیم."&CRLF&"4. در یک قابلمه مقداری روغن زیتون ریخته و بادمجانها را ته آن می چینیم و پوره گوجه فرنگی را اضافه می کنیم. با پشت قاشق یا گوشت کوب بادمجانها را کاملا له می کنیم."&CRLF&"5. نصف فنجان آب گرم اضافه می کنیم و به مدت 25 الی 30 دقیقه می پداریم روی حرارت تا تمام آب آن تبخیر شود. مراقب باشید بادمجانها ته نگیرد مرتب هم بزنید."&CRLF&"6. در نهایت ماست را به بادمجان و گوجه فرنگی اضافه کرده و خوب به هم بزنید میزان نمک و فلفل آن را بچشید و گرم همراه نان لواش یا چیپس چیتا سرو نمایید"
	Caption2(4)="مواد لازم:"&CRLF&CRLF&"تخم مرغ 3 عدد"&CRLF&"سیر 1 بوته"&CRLF&"خالواش نصف پیمانه (سبزی سنتی گیلانی)"&CRLF&"آب نارنج 1 تا 1 و نیم لیوان"&CRLF&"فلفل به میزان لازم"&CRLF&"سبزی 1 كیلو (اسفناج، برگ چغندر، گشنیز، تره،جعفری و شوید (اسفناج بیشتر از بقیه))"&CRLF&"نعنا نصف پیمانه"&CRLF&"دارچین به میزان لازم"&CRLF&"روغن نصف پیمانه"&CRLF&"نمك به میزان لازم"&CRLF&"زردچوبه به میزان لازم"&CRLF&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. ابتدا سبزی ها را پاك كنید و بشویید. پس از اینكه كمی آب آنها رفت، همه را خرد كنید، ولی لازم نیست خیلی ریز شود. برنج را بشویید و با نمك كمی خیس كنید. برنج و سبزی های خرد شده را در قابلمه ای با ظرفیت مناسب یا در ظرف سنتی گیلان به نام گمج بریزید و با یك پیمانه آب و نمك بپزید."&CRLF&CRLF&"2. بعد از پختن سبزی چاشنی این غذا یعنی آب نارنج را اضافه كنید و صبر كنید تا كمی با هم بجوشند. اگر ترشی غذا كم بود، باز هم به آن چاشنی اضافه كنید تا به اندازه كافی و دلخواه ترش شود."&CRLF&CRLF&"3. نعنا،‌خالواش و سیر پوست كنده را خرد كنید و در تابه ای همراه نمك، فلفل، دارچین و زردچوبه در روغن فراوان، كمی سرخ كنید. این مخلوط را به سبزی و برنج پخته اضافه كنید تا با هم بپزند."&CRLF&CRLF&"4. تخم مرغ ها را در ظرفی بشكنید و با چنگال بزنی و در صورت تمایل كمی زعفران به آن بیفزایید."&CRLF&CRLF&"5.  سپس روی مخلوط سبزی ها و برنج بریزید. زمانی كه تخم مرغ ها پخت، خورش را هم بزنید و به آن فلفل و دارچین بیفزایید. وقتی همه مواد خوب پخت و خورش به روغن افتاد، غذا آماده است."&CRLF&CRLF&"نكات:"&CRLF&CRLF&"1. به جای آب نارنج میتوانید از آبغوره استفاده كنید و یا آب انار ترش بریزید.البته توجه داشته باشید كه آب انار رنگ خورش را تیره میكند."&CRLF&CRLF&"2. این غذا را با برنج كته یا نان سرو كنید."&CRLF&CRLF&"3. اگر خالواش در دسترس نبود آن را حذف كرده و مقدار بیشتری نعنا بریزید."&CRLF&CRLF&"4. برای پوست كندن سیر كمی آن را در آب سرد بگذارید تا پوست آن به راحتی جدا شود و بعد با چاقو یا هر وسیله دیگری آن را خرد و له كنید."&CRLF&CRLF&"5. اگر از نعنا و خالواش خشك استفاده می كنید، كمی آنها را خیس كنید و بعد با سیر سرخ كنید."
	Caption2(5)="مواد لازم:"&CRLF&CRLF&"جگر گوسفند نصف یک دست سیاه و 1سوم یک دست سفید"&CRLF&"دل گوسفند نصف عدد"&CRLF&"پیاز (بزرگ) 1عدد"&CRLF&"گوجه فرنگی  1عدد بزرگ"&CRLF&"رب گوجه فرنگی 2قاشق غذاخوری"&CRLF&"آب نصف لیوان"&CRLF&"انار (دانه شده و ترش) 2 قاشق غذاخوری"&CRLF&"نمک به میزان لازم"&CRLF&"فلفل به میزان لازم"&CRLF&"گلپر به میزان لازم"&CRLF&"زعفران (اختیاری) 2قاشق غذاخوری"&CRLF&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. اول پیاز رو نگینی خرد کنید و با مقداری روغن یا در صورت دلخواه کره تفتش بدید تا طلایی بشه."&CRLF&CRLF&"2. دل و جگر گوسفند رو خوب بشورید و خشک کنید و به صورت نگینی (ریز یا درشت) خرد کنید و با هم به پیاز داغ اضافه کنید و خوب سرخ کنید حالا شعله رو خیلی خیلی ملایم کنید."&CRLF&CRLF&"3. گوجه رو چند ثانیه بندازید توی ابجوش و بعد خارجش کنید و با آب سرد بشوریدش و پوستش رو جدا کنید و ریز و به صورت نگینی خردش کنید."&CRLF&CRLF&"4. رب گوجه فرنگی رو به جگرها اضافه کنید و خوب هم بزنید تا رب کمی سرخ بشه و بعد گوجه های ریز شده رو هم با نمک و فلفل و زعفران(اختیاری)به مواد اضافه کنید و کمی تفت بدید و بعد آب رو به مواد اضافه کنید و شعله رو زیاد کنید تا آب بجوشه."&CRLF&CRLF&"5. حالا شعله رو بسیار ملایم کنید و درب ظرف رو ببندید و صبر کنید تا غذا بپزه و آماده بشه."&CRLF&CRLF&"6. وقتی غذا آماده شد و آبش کامل کشیده شد دانه انار و گلپر رو بهش اضافه کنید و خوب هم بزنید."&CRLF&CRLF&"7. شعله رو خاموش کنید و غذا رو برای سرو آماده کنید."&CRLF&CRLF&"نکات:"&CRLF&CRLF&"1. بهتره داخل غذا چند قاشق آب انار ترش یا آب نارنج هم بریزید."&CRLF&CRLF&"2. این غذا رو هم با نان و هم با برنج میشه سرو کرد ولی سروش با نان متداول تر هست."&CRLF&CRLF&"3. این غذا ابش تقریبا خیلی کمه."&CRLF&CRLF&"4. این غذا در واقع همون چغور بغور ترکی هستش (همون چیغیر بغیر ) به معنی داد و بیداد(چون موقع سرخ کردن جگر و دل و...سرو صدای خاصی ایجاد میشه)و غذای خیلی متداول ترکی محسوب میشه در برخی مناطق ایران به این غذا روده گوسفند هم اضافه میکنن و خیلی هم تند و فلفلی و پر از زرد چوبه و پیاز درستش میکنن!"&CRLF&CRLF&"5. بهتره که جگر سفید اول با ابجوش کمی پخته بشه و بعد ریز بشه و به خوراک اضافه بشه چون کمی دیرپزه."&CRLF&CRLF&"6. توی برخی مناطق شمال به این غذا گوشت سرخ شده یا مقداری گوشت چرخ کرده یا مربعی خرد شده و سرخ شده هم اضافه میکنن."&CRLF&CRLF&"7. میتونید به خوراک مقداری آبغوره یا آبلیمو هم اضافه کنید."&CRLF&CRLF&"8. این غذا در برخی مناطق شمال فقط با گوشت خرد شده تهیه میشه.(بدون جگر)"
	Caption2(6)="مواد لازم:"&CRLF&CRLF&"مرغ براي هر نفر يه تكه"&CRLF&"آلو قيسي براي هر نفر 2 تا 3 عدد"&CRLF&"آلو سياه براي هر نفر 2 تا 3 عدد"&CRLF&"پياز 2 عدد"&CRLF&"شکر 2 قاشق غذاخوري"&CRLF&"زردچوبه مقداري"&CRLF&CRLF&"طرز تهيه:"&CRLF&CRLF&"1. مرغ رو با كمي آب و زرد چوبه به روی آتش می گذاریم, و پس از آنکه نیم پز شد آلوها را که در روغن سرخ کرده ایم بدان اضافه می کنیم."&CRLF&CRLF&"2. هر وقت كه مرغ و آلو كاملا پخت پياز را که قبلا سرخ کرده ایم بهمراه شکر به مقدار گفته شده به آن اضافه می کنیم. بعد از کمی جوشیدن ( 3 تا 5 دقيقه ) غذای ما آماده است."&CRLF&CRLF&"نكته:"&CRLF&CRLF&"1. اين خورش بايد آب كمي داشته باشد."&CRLF&CRLF&"2. اگر در حین طبخ متوجه شده اید که مرغ کاملا پخته شده ولی آلوها هنوز نپخته اند مرغها را از قابلمه خارج کنید تا الوها حسابی پخته و مرغها له نشوند."&CRLF&CRLF&"3. پس از اضافه کردن پياز نگذارید که غذا زیاد بجوشد چون اصطلاحا غذا وا خواهد رفت."&CRLF&CRLF&"4. ميزان شكر اين غذا بسته به ميل شما قابل تغييراست."&CRLF&CRLF&"5. طعم اين غذا با وجود شكر و آلو سياه, ملس می باشد."
	Caption2(7)="مواد لازم:"&CRLF&CRLF&"برگ سیر تازه  3 عدد"&CRLF&"تخم مرغ  3 عدد"&CRLF&"پیاز متوسط  ۱ عدد"&CRLF&"لپه 1 فنجان یا ۵۰ گرم"&CRLF&"مرغ یا گوشت اردک  نصف یا یک عدد کوچک"&CRLF&"نمک، فلفل و زردچوبه  به مقدار لازم"&CRLF&CRLF&"طرز تهیه: "&CRLF&CRLF&"1. در ابتدا برگ سیرها را می شوییم (البته وقتی برگ سیر در دسترس نیست، از تره که شبیه برگ سیر، فقط کمی نازکتر و لطیفتراست، هم می توان استفاده کرد). برگ سیرها را با چاقو به اندازه های مساوی نیم سانتی خرد می کنیم و با پیاز خلال شده تفت می دهیم. زمانیکه رنگ پیازها طلایی شد و برگ سیر ها نرم شدند و در آستانه تیره شدن بودند لپه، نمک، فلفل و زردچوبه را اضافه کنید و کمی دیگر تفت دهید."&CRLF&CRLF&"2. گوشت مرغ یا اردک را به اندازه های کوچک خرد کرده و استخوان های آن را خارج می کنیم بعد در ماهیتابه ای جداگانه در روغن تفت می دهیم تا هم طعم بگیرد و هم روی مرغها طلایی شود. سپس مخلوط پیاز و برگ سیر و لپه را به آن می افزاییم. این مواد را به همراه آب داخل قابلمه قرار داده و می گذاریم کاملا بپزد. دقت کنید آب این غذا باید کم باشد ولی نباید موقع پختن  کل آب بخار شود، بگذارید کمی از آب آن باقی بماند. بنا به اندازه تکه های مرغ، آب را خودتان اندازه کنید."&CRLF&CRLF&"3. بعد از پخت کامل تا حدی که آب مواد کاملا گرفته شده باشد تخم مرغ را مثل املت روی سیرها ریخته و هم نمی زنیم تا ببندد. بعد از پنج دقیقه غذا کاملا آماده است. این خورش بسیار خوشمزه و کم آب با برنج سرو می شود و جالب اینکه بعد از خوردن آن بوی سیر در دهانتان باقی نمی ماند. پس با خیال راحت امتحان کنید."
	Caption2(8)="مواد لازم:"&CRLF&CRLF&"بادنجان قلمي بدون تخم پنج عدد"&CRLF&"مغز گردو ساييده شده 300 گرم"&CRLF&"رب انار دو قاشق سوپخوري"&CRLF&"پياز سرخ كرده چهار قاشق سوپخوري"&CRLF&"نمك، فلفل، زردچوبه و روغن به ميزان لازم"&CRLF&CRLF&"طرز تهيه:"&CRLF&CRLF&"1. دو تا سه قاشق روغن در قابلمه ريخته و روي حرارت مي‌گذاريم. سپس مغز گردوي ساييده شده را در آن تفت مي‌دهيم. "&CRLF&CRLF&"2. پياز سرخ كرده و زردچوبه را افزوده و كمي ديگر تفت مي‌دهيم. دو تا سه پيمانه آب ولرم و رب انار را مخلوط و به مواد اضافه مي‌كنيم. "&CRLF&CRLF&"3. نمك و فلفل زده و با حرارت ملايم اجازه مي‌‌دهيم تا خورش به روغن بيفتد. در آخر به بادنجان‌هايي كه پوست گرفته‌ و به صورت حلقه‌اي خرد كرده‌ايم نمك زده و در آبكش به مدت دو ساعت قرار مي‌دهيم تا تلخي آن گرفته شود. سپس شسته، خشك نموده و سرخ مي‌كنيم. آنگاه بادنجان‌ها را به خورش اضافه كرده و اجازه مي‌دهيم تا جا بيفتد. "
	Caption2(9)="مواد لازم:"&CRLF&CRLF&"بادنجان یک و نیم کیلوگرم"&CRLF&"گردو ساییده ۳۰۰ گرم"&CRLF&"انار ترش دانه شده یک پیمانه"&CRLF&"چوچاق (سبزی محلی) دو قاشق سوپخوری"&CRLF&"سیر چهار حبه"&CRLF&"نمک و فلفل به میزان لازم"&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. ابتدا بادنجان ها را روی شعله گاز یا زغال کباب کنید. می توانید بادنجان ها را روی سینی فر بچینید و تا زمانی که پوست آنها کبابی شود داخل فر قرار دهید."&CRLF&CRLF&"2. پس از کبابی شدن پوست بادمجان ها را جدا کنید."&CRLF&CRLF&"3. بادنجان های پوست کنده را درون ظرفی بریزید و خوب بکوبید (از دستگاه غذاساز و یا گوشت کوب برقی برای پوره و له شدن بادنجان ها کمک بگیرید.)"&CRLF&CRLF&"4. پس از اینکه به طور کامل له شد، گردوی آسیاب شده را با بادنجان ها مخلوط کنید."&CRLF&CRLF&"5. سپس انار دانه شده را اضافه کنید و دوباره میکس کنید تا دانه های انار خوب درون مایه له شود."&CRLF&CRLF&"6. در آخرین مرحله چوچاق و سیر را اضافه کنید و همه مواد را خوب بکوبید و یا آسیاب کنید."&CRLF&CRLF&"7. نمک و فلفل اضافه کنید و یک دور با سرعت زیاد میکس کنید."&CRLF&CRLF&"8. در این مرحله غذای شما آماده است، غذا را داخل ظرف بکشید و با دانه های انار تزیین کنید و همراه با برنج سفید سرو کنید."&CRLF&CRLF&"9. این غذا را به عنوان خوراک و یا پیش غذا نیز می توانید مصرف کنید."&CRLF&CRLF&"نکات:"&CRLF&CRLF&"1. برای این که میزان ترشی غذا کم شود می توانید یک تا دو قاشق سوپخوری از انار آن کم کنید."&CRLF&CRLF&"2. گردو را تا حدی که دندان گیر باشد آسیاب کرد."&CRLF&CRLF&"3. به جای سبزی محلی چوچاق می توانید از گشنیز نیز استفاده کنید."
	Caption2(10)="مواد لازم: "&CRLF&CRLF&"مرغ پخته  ۱کیلو"&CRLF&"تخم مرغ  ۸ عدد"&CRLF&"پیاز داغ طلایی  ۴ ق غ"&CRLF&"زعفران آب زده  ۳ ق غ"&CRLF&"آب لیمو  ۳ ق غ"&CRLF&"ماست چکیده  ۲ ق غ"&CRLF&"نمک و فلفل  به مقدار لازم"&CRLF&"روغن مایع  مقدار لازم"&CRLF&CRLF&"مواد لازم جهت تهیه سس مخصوص: "&CRLF&CRLF&"کره  ۵۰ گرم"&CRLF&"آرد  ۱ ق غ"&CRLF&"جعفری ریز شده  ۳ ق غ"&CRLF&"رب گوجه فرنگی  ۴ ق غ"&CRLF&"زعفران آب زده  ۲ ق غ"&CRLF&"سس گوجه فرنگی  ۲ ق غ"&CRLF&"سس تند  ۱ ق چ"&CRLF&"آب مرغ  ۱ لیوان"&CRLF&"نمک و فلفل"&CRLF&CRLF&"طرز تهیه: "&CRLF&CRLF&"تخم مرغ ها را خوب بزنید تا یک دست شوند. سپس نمک و فلفل را به همراه ماست اضافه کرده و هم بزنید. پیاز داغ ها را اضافه و مخلوط کنید. مرغ را ریز کرده و به مواد بیافزایید، سپس آبلیمو و زعفران را ریخته و مواد را مخلوط کنید. روغن را در ظرف مناسب داغ کرده، مواد را اضافه و کف ظرف صاف کنید، سپس در طبقه وسط فر با درجه ۲۲۰-۲۴۰ درجه سانتی گراد به مدت ۲۰ دقیقه قرار دهید. "&CRLF&CRLF&"تهیه سس کوکو مرغ: "&CRLF&CRLF&"کره را آب کرده، آرد را بیافزایید و ۳ دقیقه تفت دهید. آب مرغ را افزوده هم بزنید تا آرد گلوله نشود. رب گوجه و نمک و فلفل را اضافه کنید و بر روی حرارت هم بزنید. زعفران آب کرده و جعفری ریز شده را نیز افزوده و بعد از کمی حرارت در ظرف مناسب بریزید. سس گوجه و سس تند را اضافه و سرو کنید. "&CRLF&CRLF&"چند نکته: "&CRLF&CRLF&"1. میتوانید در مواد از نصف قاشق چای خوری دارچین نیز استفاده کنید. "&CRLF&CRLF&"2. در بعضی دستورات جوش شیرین نیز به اندازه یک قاشق غذا خوری استفاده می شود."&CRLF&CRLF&"3. بعضی ها قارچ و نخود فرنگی و فلفل دلمه ای ریز شده هم در مواد میزنند که به سلیقه افراد بستگی دارد ولی در دستور اصلی این غذا نیست."
	Caption2(11)="مواد لازم:"&CRLF&CRLF&"کدو حلوایی نصف عدد"&CRLF&"سیر سه حبه"&CRLF&"گردو 150 گرم"&CRLF&"رب انار و رب گوجه‌فرنگی و شکر از هر کدام دو قاشق غذاخوری"&CRLF&"نمک، فلفل، زردچوبه، گلپر و ادویه و آب به میزان لازم"&CRLF&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. سیر را له و با روغن سرخ کنید."&CRLF&CRLF&"2. بعد کدوی پخته شده را پوست گرفته و به صورت پوره در آورید و در همان روغن سرخ کنید."&CRLF&CRLF&"3. گردوی ساییده‌شده، رب انار، رب گوجه‌ فرنگی، آب، نمک، فلفل، زردچوبه و شکر را در قابلمه بریزید و به مدت دو ساعت با حرارت ملایم بجوشانید."&CRLF&CRLF&"4. کدو، سیر، گلپر و ادویه را به آن اضافه کرده و هم بزنید تا یک مخلوط غلیظی به دست آید."
	Caption2(12)="مواد لازم:"&CRLF&CRLF&"بادمجان 5 عدد متوسط"&CRLF&"گوجه فرنگی تازه 2 عدد"&CRLF&"سیر یک بوته"&CRLF&"تخم مرغ 3 عدد"&CRLF&"روغن و فلفل و نمک به مقدار لازم"&CRLF&CRLF&"طرز تهیه:"&CRLF&CRLF&"1. در ابتدا بادمجان ها را کباب می کنیم ( شما می توانید بادمجان ها را داخل فر و یا روی آتش کباب کنید ) سپس پوست آنها را کنده و سرهای بادمجان ها را جدا می کنیم؛ پس از آن بادمجان ها را ساطوری می نماییم."&CRLF&CRLF&"2. حال نوبت به گوجه ها می رسد؛ گوجه فرنگی ها را در آب جوش ریخته و پوست آنها را میگیریم و سپس خرد می کنیم."&CRLF&CRLF&"3. سیر را کوبیده و داخل روغن داغ که از قبل درتابه و روی اجاق آماده شده است میریزیم تا کمی سیر ها سرخ شود."&CRLF&CRLF&"4. سپس بادمجان ها و گوجه های آماده شده را به همان تابه اضافه کرده و سرخ می کنیم ؛ این کار را تا زمانی که آب آنها کشیده شده و کمی روغن بیافتد ادامه می دهیم."&CRLF&CRLF&"5. حال کمی نمک و فلفل به آن اضافه می کنیم و مایه را در یک طرف تابه قرار می دهیم و در طرف دیگر خالی تابه تخم مرغ ها را شکسته و مخلوط می کنیم و انقدر هم می زنیم تا بسته شده و سرخ شود"&CRLF&CRLF&"6. بعد بادمجان ها و تخم مرغ ها (یعنی تمام محتویات تابه) را با هم مخلوط می کنیم."&CRLF&CRLF&"7. میرزا قاسمی ما آماده شده و می توانید آنرا در دیس کشیده و سرو کنید."
	
	bg.Visible=True
	Panel.Visible=True
	
	Scroll.Panel.RemoveAllViews
	Scroll.ScrollPosition=0
	Scroll.Panel.Height=0

	Txt.Initialize("")
	Scroll.Panel.AddView(Txt,0,0,Scroll.Width,100dip)
	ht=config.art(Caption2(m.Tag),Txt,config.font,14)
	Txt.Gravity=Gravity.RIGHT
	Txt.TextColor=Colors.Black
	
	Scroll.Panel.Height=ht+20dip
End Sub
Sub bg_Click
	'این تابع باشد
End Sub
Sub m1
	Dim t As Int=0

	title.Color=Colors.RGB(78,128,43)
	title.Text="چای و نوشیدنی گرم"

	Caption(1)="چای سیاه لیمو"
	Caption(2)="چای سیاه هل"
	Caption(3)="چای سیاه بهار نارنج"
	Caption(4)="چای سیاه وانیل"
	Caption(5)="چای سیاه کرن بری"
	Caption(6)="چای سیاه دارچین"
	Caption(7)="چای سیاه زنجبیل"
	Caption(8)="چای سیاه زعفران"
	Caption(9)="چای سیاه توت فرنگی"
	Caption(10)="چای سبز هلو"
	Caption(11)="چای سبز زعفران"
	Caption(12)="چای سبز زنجبیل"
	Caption(13)="چای سبز نعنا"
	Caption(14)="چای سبز بهار نارنج"
	Caption(15)="چای سبز دارچین"
	Caption(16)="چای سبز سیب"
	Caption(17)="چای سبز عسل و جنسینگ"
	Caption(18)="چای سبز گل گاو زبان"
	Caption(19)="چای سبز لیمو"
	Caption(20)="چای سبز عسل و آلوئه ورا"

	Mony(1)=""
	Mony(2)=""
	Mony(3)=""
	Mony(4)=""
	Mony(5)=""
	Mony(6)=""
	Mony(7)=""
	Mony(8)=""
	Mony(9)=""
	Mony(10)=""
	Mony(11)=""
	Mony(12)=""
	Mony(13)=""
	Mony(14)=""
	Mony(15)=""
	Mony(16)=""
	Mony(17)=""
	Mony(18)=""
	Mony(19)=""
	Mony(20)=""

	For i=1 To 20
		If config.Exists(Caption(i))=False Then config.Set(Caption(i),Mony(i))

		menu.Initialize("")
		vScroll.Panel.AddView(menu,0,t,100%x,35%x)
		menu.Gravity=Gravity.FILL
		menu.Left=(100%x/2)-(menu.Width/2)
		menu.Bitmap=LoadBitmapSample(File.DirAssets,"menu2.xml",menu.Width,menu.Height)

		img_menu.Initialize("")
		vScroll.Panel.AddView(img_menu,0,menu.Top+5dip,menu.Height-10dip,menu.Height-10dip)
		img_menu.Gravity=Gravity.FILL
		img_menu.Left=100%x-img_menu.Width-10dip
		img_menu.Bitmap=LoadBitmapSample(File.DirAssets,"tea/"&i&".xml",img_menu.Width,img_menu.Height)

		Txt.Initialize("")
		vScroll.Panel.AddView(Txt,0,menu.Top+5dip,menu.Width-menu.Height-5dip,menu.Height/2)
		Txt.Gravity=Gravity.RIGHT
		Txt.Typeface=config.font
		Txt.TextSize=14
		If i<10 Then
			Txt.TextColor=Colors.Black
		Else
			Txt.TextColor=Colors.RGB(78,128,43)
		End If
		Txt.Text=Caption(i)

		Txt2.Initialize("")
		vScroll.Panel.AddView(Txt2,5dip,Txt.Top+Txt.Height+5dip,menu.Width-menu.Height,menu.Height/2)
		Txt2.Gravity=Gravity.LEFT
		Txt2.Typeface=config.font
		Txt2.TextSize=14
		Txt2.TextColor=config.Get("Color")
		Txt2.Text=NumberFormat(config.Get(Caption(i)),0,0) & " تومان"
		Txt2.Text=config.En_Fr(Txt2.Text)

		t=menu.top+menu.Height+3dip
	Next
	vScroll.Panel.Height=t
End Sub
Sub m2
	Dim t As Int=10dip

	title.Color=Colors.RGB(156,130,97)
	title.Text="غذاهای محلی شمال"

	Caption(1)="اناربیج"
	Caption(2)="باقالا قاتق"
	Caption(3)="بورانی بادمجان"
	Caption(4)="ترشه تره"
	Caption(5)="خوراک واویشکا"
	Caption(6)="خورش آلو مسمای"
	Caption(7)="سیر قلیه"
	Caption(8)="شش انداز بادنجان"
	Caption(9)="کال کباب"
	Caption(10)="کوکو مرغ"
	Caption(11)="کویی تره"
	Caption(12)="میرزا قاسمی"

	Mony(1)=""
	Mony(2)=""
	Mony(3)=""
	Mony(4)=""
	Mony(5)=""
	Mony(6)=""
	Mony(7)=""
	Mony(8)=""
	Mony(9)=""
	Mony(10)=""
	Mony(11)=""
	Mony(12)=""

	For i=1 To 12
		If config.Exists(Caption(i))=False Then config.Set(Caption(i),Mony(i))

		img_menu.Initialize("")
		vScroll.Panel.AddView(img_menu,10dip,t,100%x-20dip,1dip)
		img_menu.Gravity=Gravity.FILL
		img_menu.Height=(281dip*img_menu.Width)/500dip
		img_menu.Bitmap=LoadBitmapSample(File.DirAssets,"food/"&i&".xml",img_menu.Width,img_menu.Height)

		Txt.Initialize("")
		vScroll.Panel.AddView(Txt,0,img_menu.Top+img_menu.Height+5dip,100%x,30dip)
		Txt.Gravity=Gravity.CENTER
		Txt.Typeface=config.font
		Txt.TextSize=17
		Txt.TextColor=Colors.Black
		Txt.Text=Caption(i)

		Txt2.Initialize("menu")
		vScroll.Panel.AddView(Txt2,0,Txt.Top+Txt.Height+10dip,100%x/3.5,40dip)
		Txt2.Gravity=Gravity.CENTER
		Txt2.Typeface=config.font
		Txt2.Left=100%x-Txt2.Width-10dip
		Txt2.TextSize=14
		Txt2.TextColor=Colors.Black
		Txt2.Color=Colors.RGB(217,217,221)
		Txt2.Text="طرز تهیه"
		Txt2.Tag=i

		Txt2.Initialize("")
		vScroll.Panel.AddView(Txt2,10dip,Txt.Top+Txt.Height+10dip,100%x/3.5,40dip)
		Txt2.Gravity=Gravity.CENTER
		Txt2.Typeface=config.font
		Txt2.TextSize=14
		Txt2.TextColor=Colors.Black
		Txt2.Color=Colors.RGB(217,217,221)
		Txt2.Text=NumberFormat(config.Get(Caption(i)),0,0) & " تومان"
		Txt2.Text=config.En_Fr(Txt2.Text)

		t=Txt2.top+Txt2.Height+50dip
	Next
	vScroll.Panel.Height=t
End Sub
Sub m3
	Dim t As Int=0

	title.Color=Colors.RGB(15,115,180)
	title.Text="قلیان و دخانیات"

	Caption(1)="قلیان پرتقال یخ"
	Caption(2)="قلیان سیب یخ"
	Caption(3)="قلیان گرانادیا"
	Caption(4)="قلیان پرتقال و خامه"
	Caption(5)="قلیان میوه های استوایی"
	Caption(6)="قلیان تمشک آبی"
	Caption(7)="قلیان گواوا"

	Mony(1)=""
	Mony(2)=""
	Mony(3)=""
	Mony(4)=""
	Mony(5)=""
	Mony(6)=""
	Mony(7)=""

	For i=1 To 7
		If config.Exists(Caption(i))=False Then config.Set(Caption(i),Mony(i))

		menu.Initialize("")
		vScroll.Panel.AddView(menu,0,t,100%x,35%x)
		menu.Gravity=Gravity.FILL
		menu.Left=(100%x/2)-(menu.Width/2)
		menu.Bitmap=LoadBitmapSample(File.DirAssets,"menu2.xml",menu.Width,menu.Height)

		img_menu.Initialize("")
		vScroll.Panel.AddView(img_menu,0,menu.Top+5dip,menu.Height-10dip,menu.Height-10dip)
		img_menu.Gravity=Gravity.FILL
		img_menu.Left=100%x-img_menu.Width-10dip
		img_menu.Bitmap=LoadBitmapSample(File.DirAssets,"dood/"&i&".xml",img_menu.Width,img_menu.Height)

		Txt.Initialize("")
		vScroll.Panel.AddView(Txt,0,menu.Top+5dip,menu.Width-menu.Height-5dip,menu.Height/2)
		Txt.Gravity=Gravity.RIGHT
		Txt.Typeface=config.font
		Txt.TextSize=14
		Txt.TextColor=Colors.Black
		Txt.Text=Caption(i)

		Txt2.Initialize("")
		vScroll.Panel.AddView(Txt2,5dip,Txt.Top+Txt.Height+5dip,menu.Width-menu.Height,menu.Height/2)
		Txt2.Gravity=Gravity.LEFT
		Txt2.Typeface=config.font
		Txt2.TextSize=14
		Txt2.TextColor=config.Get("Color")
		Txt2.Text=NumberFormat(config.Get(Caption(i)),0,0) & " تومان"
		Txt2.Text=config.En_Fr(Txt2.Text)

		t=menu.top+menu.Height+3dip
	Next
	vScroll.Panel.Height=t
End Sub
Sub m4
	title.Color=Colors.RGB(28,129,131)
	title.Text="تصاویر استراحتگاه"
	ii=1
	picCount=7'تعداد عکسها

	For i=1 To picCount
		pic(i).Initialize("")
		vScroll.Panel.AddView(pic(i),0,0,vScroll.Width,vScroll.Height)
		pic(i).Gravity=Gravity.CENTER
		pic(i).Bitmap=LoadBitmapSample(File.DirAssets,"pic/"&i&".jpg",pic(i).Width,pic(i).Height)
		pic(i).Visible=False

		Sleep(0)
	Next

	img_menu.Initialize("lefts")
	vScroll.Panel.AddView(img_menu,10dip,0,20%x,20%x)
	img_menu.Gravity=Gravity.FILL
	img_menu.Top=(100%y/2)-(img_menu.Height/2)-title.Height
	img_menu.Bitmap=LoadBitmapSample(File.DirAssets,"lefts.png",img_menu.Width,img_menu.Height)

	img_menu.Initialize("rights")
	vScroll.Panel.AddView(img_menu,80%x,0,20%x,20%x)
	img_menu.Gravity=Gravity.FILL
	img_menu.Top=(100%y/2)-(img_menu.Height/2)-title.Height
	img_menu.Bitmap=LoadBitmapSample(File.DirAssets,"rights.png",img_menu.Width,img_menu.Height)

	pic(1).Visible=True
	vScroll.Panel.Height=vScroll.Height
End Sub
Sub m5
	web.Visible=True
	title.Color=Colors.RGB(219,206,98)
	title.Text="محل استراحتگاه از روی نقشه"

	web.LoadUrl("https://www.google.com/maps/dir/36.6523977,51.1122549//@36.6524068,51.1124452,240m/data=!3m1!1e3!4m2!4m1!3e0?hl=en")
End Sub
Sub lefts_Click
	ii=ii-1
	If ii<1 Then ii=picCount
	For i=1 To picCount
		pic(i).Visible=False
	Next
	pic(ii).Visible=True
End Sub
Sub rights_Click
	ii=ii+1
	If ii>picCount Then ii=1
	For i=1 To picCount
		pic(i).Visible=False
	Next
	pic(ii).Visible=True
End Sub