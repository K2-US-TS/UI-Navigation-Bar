/****** Object:  Table [dbo].[NavMenuConfig]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavMenuConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](50) NULL,
	[Theme] [nvarchar](50) NULL,
	[LogoURL] [nvarchar](max) NULL,
	[DropDownName] [nvarchar](50) NULL,
	[ColorHeader] [nvarchar](50) NULL,
	[ColorHover] [nvarchar](50) NULL,
	[ColorDropdown] [nvarchar](50) NULL,
	[ColorSlideOut] [nvarchar](50) NULL,
 CONSTRAINT [PK_NavMenuConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavMenuItems]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavMenuItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](50) NULL,
	[Position] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[URL] [nvarchar](max) NULL,
	[K2Action] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
	[MenuOrder] [int] NULL,
 CONSTRAINT [PK_NavMenuItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavMenuPositions]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavMenuPositions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_NavMenuPositions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavMenuThemes]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavMenuThemes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Theme] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ElementDescription] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nchar](10) NULL,
	[Status] [nvarchar](50) NULL,
	[Reference] [nvarchar](50) NULL,
 CONSTRAINT [PK_NavMenuThemes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NavMenuCSS]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NavMenuCSS] @user nvarchar(100), @html nvarchar(max)=NULL OUTPUT, @DisplayName nvarchar(50), @Application nvarchar(50)




AS
BEGIN

DECLARE @theme nvarchar(50)
SET @theme = (select theme from navmenuconfig where application = @application)


DECLARE @jstemp table (Temp NVARCHAR(max) )

INSERT INTO @jstemp
SELECT  
--'<style> body { margin: 0; font-size: 28px; font-family: Arial, Helvetica, sans-serif;}.header { background-color: #f1f1f1; padding: 0px; text-align: center;}#navbar { overflow: hidden; background-color: #333;}#navbar a { float: left; display: block; color: #f2f2f2; text-align: center; padding: 14px 16px; text-decoration: none; font-size: 30px;}#navbar a:hover { background-color: #1B5CB5; color: black;}#navbar a.active { background-color: #4CAF50; color: white;}.content { padding: 16px;}.sticky { position: fixed; top: 0; width: 100%;}.sticky + .content { padding-top: 60px;}.navbar { overflow: hidden; background-color: #333; top: 0; right: 0; left: 0; position: fixed; z-index: 1;}.navbar a { float: left; font-size: 30px; color: white; text-align: center; padding: 14px 16px; text-decoration: none;}.dropdown { float: right; overflow: hidden; z-index: 1;}.dropdown .dropbtn { font-size: 30px; border: none; outline: none; color: white; padding: 14px 70px; background-color: inherit; font-family: inherit; margin: 0;}.navbar a:hover, .dropdown:hover .dropbtn { background-color: #1B5CB5;}.dropdown-content { display: none; position: fixed; background-color: #f9f9f9; min-width: 300px; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); z-index: 1;}.dropdown-content a { float: none; color: black; padding: 12px 16px; text-decoration: none; display: block; text-align: left;}.dropdown-content a:hover { background-color: yellow;}.dropdown:hover .dropdown-content { display: block;}.sidenav { height: 100%; width: 0; position: fixed; z-index: 1; top: 0; left: 0; background-color: #111; overflow-x: hidden; transition: 0.5s; padding-top: 0px;}.sidenav a { padding: 8px 8px 8px 32px; text-decoration: none; font-size: 25px; color: #818181; display: block; transition: 0.3s;}.sidenav a:hover { color: #f1f1f1;}.sidenav .closebtn { position: absolute; top: 0; right: 25px; font-size: 36px; margin-left: 50px;}#main { transition: margin-left .5s; padding: 16px;}@media screen and (max-height: 450px) { .sidenav {padding-top: 15px;} .sidenav a {font-size: 18px;}}/* fallback */@font-face { font-family: ''Material Icons''; font-style: normal; font-weight:400; src: url(https://fonts.gstatic.com/s/materialicons/v53/flUhRq6tzZclQEJ-Vdg-IuiaDsNcIhQ8tQ.woff2) format(''woff2'');}.material-icons { font-family: ''Material Icons''; font-weight: normal; font-style: normal; font-size: 30px; line-height: 0; letter-spacing: normal; text-transform: none; display: inline-block; white-space: nowrap; word-wrap: normal; direction: ltr; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased;}.center { display: block; margin-left: auto; margin-right: auto; width: 50%;}.chip { display: inline-block; padding: 0px 25px; height: 50px; font-size: 16px; line-height: 50px; border-radius: 25px; background-color: #f1f1f1; float: left; top: 2px}.chip img { float: left; margin: 0 10px 0 -25px; height: 50px; width: 50px; border-radius: 50%;}* { box-sizing: border-box;}.slideouttable{ margin-top:0px; margin-left:10px; }.RoundImage{ border-radius: 50%; display: block; margin-left: auto; margin-right: auto;}</style>'
 '<style> body { margin: 0; font-size: 28px; font-family: Arial, Helvetica, sans-serif;}.header { background-color: #f1f1f1; padding: 0px; text-align: center;}#navbar { overflow: hidden; background-color: '+ (Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'navbarcolor' and [reference] = 'Navbar')+';}.navbar a { float: left; display: block; color: '+ (Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'navbariconcolor' and [reference] = 'Navbar')+'; text-align: center; padding: 14px 16px; text-decoration: none; font-size: 30px; align-items: center; display: flex;}#navbar a:hover { background-color: green; color: black;}#navbar a.active { background-color: #4CAF50; color: white;}.content { padding: 16px;}.sticky { position: fixed; top: 0; width: 100%;}.sticky + .content { padding-top: 60px;}.navbar { overflow: hidden; background-color: '+ (Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'navbarcolor' and [reference] = 'Navbar')+'; top: 0; right: 0; left: 0; position: fixed; z-index: 1;}.navbar a { float: left; font-size: 30px; color: '+ ( Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'navbariconcolor' and [reference] = 'Navbar')+'; text-align: center; padding: 14px 16px; text-decoration: none;}.dropdown { float: right; overflow: hidden; z-index: 1;}.dropdown .dropbtn { font-size: 30px; border: none; outline: none; color: '+ (Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'dropdowntitlecolor' and [reference] = 'Navbar')+'; padding: 14px 70px; background-color: inherit; font-family: inherit; margin: 0;}.navbar a:hover, .dropdown:hover .dropbtn { background-color: '+ ( Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'navbarhovercolor' and [reference] = 'Navbar')+';}.dropdown-content { display: none; position: fixed; background-color: '+ ( Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'dropdownbackgroundcolor' and [reference] = 'Navbar')+'; min-width: 300px; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); z-index: 1;}.dropdown-content a { float: none; color:  '+ (Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'dropdownfontcolor' and [reference] = 'Navbar')+'; padding: 12px 16px; text-decoration: none; display: block; text-align: left;}.dropdown-content a:hover { background-color: '+ ( Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'dropdownhovercolor' and [reference] = 'Navbar')+';}.dropdown:hover .dropdown-content { display: block;}.sidenav { height: 100%; width: 0; position: fixed; z-index: 1; top: 0; left: 0; background-color: '+ (Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'sidebarbackgroundcolor' and [reference] = 'Navbar')+'; overflow-x: hidden; transition: 0.5s; padding-top: 0px;}.sidenav a { padding: 8px 8px 8px 32px; text-decoration: none; font-size: 25px; color: '+ ( Select value FROM NavMenuThemes WHERE [theme] = @theme and [name] = 'sidebarfontcolor' and [reference] = 'Navbar')+'; display: block; transition: 0.3s;}.sidenav a:hover { color: #f1f1f1;}.sidenav .closebtn { position: absolute; top: 0; right: 25px; font-size: 36px; margin-left: 50px;}#main { transition: margin-left .5s; padding: 16px;}@media screen and (max-height: 450px) { .sidenav {padding-top: 15px;} .sidenav a {font-size: 18px;}}/* fallback */@font-face { font-family: ''Material Icons''; font-style: normal; font-weight:400; src: url(https://fonts.gstatic.com/s/materialicons/v53/flUhRq6tzZclQEJ-Vdg-IuiaDsNcIhQ8tQ.woff2) format(''woff2'');}.material-icons { font-family: ''Material Icons''; font-weight: bold; font-style: normal; font-size: 30px; line-height: 0; letter-spacing: normal; text-transform: none; display: inline-block; white-space: nowrap; word-wrap: normal; direction: ltr; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased;}.center { display: block; margin-left: auto; margin-right: auto; width: 50%;}.chip { display: inline-block; padding: 0px 25px; height: 50px; font-size: 16px; line-height: 50px; border-radius: 25px; background-color: #f1f1f1; float: left; top: 2px}.chip img { float: left; margin: 0 10px 0 -25px; height: 50px; width: 50px; border-radius: 50%;}* { box-sizing: border-box;}.slideouttable{ margin-top:0px; margin-left:10px; }.RoundImage{ border-radius: 50%; display: block; margin-left: auto; margin-right: auto;}</style>'

 as Temp

SET @html = (SELECT * FROM @jstemp)
SELECT @html



END
GO
/****** Object:  StoredProcedure [dbo].[NavMenuFormAction]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NavMenuFormAction] @html nvarchar(max)=NULL OUTPUT, @textboxname nvarchar(50)




AS
BEGIN




DECLARE @htmltemp table (Temp NVARCHAR(max) )

INSERT INTO @htmltemp
SELECT  

--'<div class="navbar"> <a href="javascript:void(0)" class="Openbtn" onclick="openNav()">&#9776; </a> <a href="javascript:void(0)" onclick="homeButton()"><i class="material-icons" >chat</i> Chat</a> <a href="javascript:void(0)" onclick="Button()"><i class="material-icons" >timeline</i> Timeline</a> <a href="javascript:void(0)" onclick="MetricsButton()"><i class="material-icons" >analytics</i> Metrics</a> <div class="dropdown"> <button class="dropbtn"><i class="material-icons" >add</i>New <i class="fa fa-caret-down"></i> </button> <div class="dropdown-content"> <a href="javascript:void(0)" onclick="NewVendorButton()"><i class="material-icons" >work</i> Prime Vendor</a> <a href="javascript:void(0)" onclick="NewTaskButton()"><i class="material-icons" >all_inbox</i> Task</a> <a href="javascript:void(0)" onclick="messengerButton()"><i class="material-icons" >comment</i> Messenger </a> </div> </div></div><div id="mySidenav" class="sidenav"> <table style="margin-top:10px; margin-left:10px;"> <tr> <td> <img src="https://tsdemos.blob.core.windows.net/iap/austinwater/images.png" alt="Austin Water" class="center" style="width:150px;height:150px;"><br /> </td> <td> <a href="javascript:void(0)" onclick="closeNav()">&times;</a><br /><br /> </td> </tr> </table> <a href="javascript:void(0)"><img src="https://uktsblob.blob.core.windows.net/images/img_avatar.png" class="RoundImage" alt="Person" width="96" height="96" onclick="userProfilesButton()" ></a> <a href="https://www.k2.com/" target="_blank"><i class="material-icons" >web</i> K2 Website</a> <a href="https://www.k2.com/case-studies" target="_blank"><i class="material-icons" >new_releases</i> Case Studies</a> <a href=javascript:void(0)" onclick="SettingsButton()"><i class="material-icons" >connect_without_contact</i> Settings</a></div>'

'<script>
function k2action(value) {
  var myTextBoxXPath = "Controllers/Controller/Controls/Control[@Name='''+ @textboxname + ''']";
var windowToUse = window;
if (!checkExists(windowToUse.viewControllerDefinition))
{
   windowToUse.viewControllerDefinition = $xml(windowToUse.__runtimeControllersDefinition);
}
 
var myTextBoxControl = windowToUse.$sn(windowToUse.viewControllerDefinition, myTextBoxXPath);
var controlInfoObj = new windowToUse.PopulateObject(null, value, myTextBoxControl.getAttribute("ID"));
windowToUse.executeControlFunction(myTextBoxControl, "SetValue", controlInfoObj);
 
}


</script>'
 as Temp

SET @html = (SELECT * FROM @htmltemp)
SELECT @html



END
GO
/****** Object:  StoredProcedure [dbo].[NavMenuHTML]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NavMenuHTML] @user nvarchar(100), @html nvarchar(max)=NULL OUTPUT, @DisplayName nvarchar(50), @Application nvarchar(50)




AS
BEGIN




DECLARE @htmltemp table (Temp NVARCHAR(max) )

--Top
INSERT INTO @htmltemp
SELECT '<div class="navbar"><a href="javascript:void(0)" class="Openbtn" onclick="openNav()">&#9776; </a>' as temp
INSERT INTO @htmltemp
--SELECT '<a href="javascript:void(0)" onclick="k2action('''+ [Name] +''')"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>'
SELECT CASE WHEN [Action] = 'K2' THEN '<a href=javascript:void(0)" onclick="k2action('''+[name]+''')"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>' ELSE '<a href="'+[url]+'" target="_blank"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>' END 
FROM NavMenuItems
WHERE [Application] = @application and [Position] = '2'
--Dropdown
INSERT INTO @htmltemp
SELECT '<div class="dropdown"><button class="dropbtn"><i class="material-icons" >add</i>New <i class="fa fa-caret-down"></i></button><div class="dropdown-content">'
--Dropdown Items
INSERT INTO @htmltemp
--SELECT '<a href="javascript:void(0)" onclick="k2action('''+[name]+''')"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>'
SELECT CASE WHEN [Action] = 'K2' THEN '<a href=javascript:void(0)" onclick="k2action('''+[name]+''')"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>' ELSE '<a href="'+[url]+'" target="_blank"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>' END
FROM NavMenuItems
WHERE [Application] = @application and [Position] = '3'
--Sidebar Default Items
INSERT INTO @htmltemp
SELECT '</div></div></div>'
INSERT INTO @htmltemp
SELECT '<div id="mySidenav" class="sidenav"><table style="margin-top:10px; margin-left:10px;"><tr><td> <img src="'+[logourl]+'" alt="Austin Water" class="center" style="width:150px;height:150px;"><br /> </td><td><a href="javascript:void(0)" onclick="closeNav()">&times;</a><br /><br /></td></tr></table><a href="javascript:void(0)"><img src="https://uktsblob.blob.core.windows.net/images/img_avatar.png" class="RoundImage" alt="Person" width="96" height="96" onclick="k2action(''userprofiles'')" ></a>'
FROM NavMenuConfig
WHERE [Application] = @application
--Sidebar Items
INSERT INTO @htmltemp
--SELECT '<a href=javascript:void(0)" onclick="k2action('''+[name]+''')"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a></div>'
SELECT CASE WHEN [Action] = 'K2' THEN '<a href=javascript:void(0)" onclick="k2action('''+[name]+''')"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>' ELSE '<a href="'+[url]+'" target="_blank"><i class="material-icons" >'+[icon]+'</i> '+[name]+'</a>' END 
FROM NavMenuItems
WHERE [Application] = @application and [Position] = '1'


SET @HTML = (SELECT STRING_AGG(temp, ' ') as HTML
FROM @htmlTemp)

SELECT @HTML



END
GO
/****** Object:  StoredProcedure [dbo].[NavMenuJS]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NavMenuJS] @user nvarchar(100), @html nvarchar(max)=NULL OUTPUT, @DisplayName nvarchar(50), @Application nvarchar(50)




AS
BEGIN




DECLARE @jstemp table (Temp NVARCHAR(max) )

INSERT INTO @jstemp
SELECT  

--'<div class="navbar"> <a href="javascript:void(0)" class="Openbtn" onclick="openNav()">&#9776; </a> <a href="javascript:void(0)" onclick="homeButton()"><i class="material-icons" >chat</i> Chat</a> <a href="javascript:void(0)" onclick="Button()"><i class="material-icons" >timeline</i> Timeline</a> <a href="javascript:void(0)" onclick="MetricsButton()"><i class="material-icons" >analytics</i> Metrics</a> <div class="dropdown"> <button class="dropbtn"><i class="material-icons" >add</i>New <i class="fa fa-caret-down"></i> </button> <div class="dropdown-content"> <a href="javascript:void(0)" onclick="NewVendorButton()"><i class="material-icons" >work</i> Prime Vendor</a> <a href="javascript:void(0)" onclick="NewTaskButton()"><i class="material-icons" >all_inbox</i> Task</a> <a href="javascript:void(0)" onclick="messengerButton()"><i class="material-icons" >comment</i> Messenger </a> </div> </div></div><div id="mySidenav" class="sidenav"> <table style="margin-top:10px; margin-left:10px;"> <tr> <td> <img src="https://tsdemos.blob.core.windows.net/iap/austinwater/images.png" alt="Austin Water" class="center" style="width:150px;height:150px;"><br /> </td> <td> <a href="javascript:void(0)" onclick="closeNav()">&times;</a><br /><br /> </td> </tr> </table> <a href="javascript:void(0)"><img src="https://uktsblob.blob.core.windows.net/images/img_avatar.png" class="RoundImage" alt="Person" width="96" height="96" onclick="userProfilesButton()" ></a> <a href="https://www.k2.com/" target="_blank"><i class="material-icons" >web</i> K2 Website</a> <a href="https://www.k2.com/case-studies" target="_blank"><i class="material-icons" >new_releases</i> Case Studies</a> <a href=javascript:void(0)" onclick="SettingsButton()"><i class="material-icons" >connect_without_contact</i> Settings</a></div>'
'<script>window.onscroll = function() {myFunction()};var navbar = document.getElementById("navbar");var sticky = navbar.offsetTop;function myFunction() { if (window.pageYOffset >= sticky) { navbar.classList.add("sticky") } else { navbar.classList.remove("sticky"); }}</script> <script>function openNav() { document.getElementById("mySidenav").style.width = "250px"; document.getElementById("main").style.marginLeft = "250px";}function closeNav() { document.getElementById("mySidenav").style.width = "0"; document.getElementById("main").style.marginLeft= "0";}</script>'
 as Temp

SET @html = (SELECT * FROM @jstemp)
SELECT @html



END
GO
/****** Object:  StoredProcedure [dbo].[NavMenuThemeList]    Script Date: 10/27/2020 11:34:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NavMenuThemeList] @Application nvarchar(50)=NULL




AS
BEGIN

SELECT DISTINCT Theme
  FROM [dbo].[NavMenuThemes]


END
GO
