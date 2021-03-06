Application Description: Klassenbibliothek für die Währungsverarbeitung.
		
		TITEL:			Klassenbibliothek für die Währungsverarbeitung.
		
		NAME:			EWAWHG02.APL
		
		VERSION:		V004 vom 07.04.2015 (32-Bit)
		
		AUTOR:			Ewald GmbH	(Kontakt: info@ewald.de)
		
		Dieses Programm ist freie Software. Sie können es unter den Bedingungen der
		GNU General Public License, wie von der Free Software Foundation veröffentlicht,
		weitergeben und/oder modifizieren, entweder gemäß Version 3 der Lizenz oder 
		(nach Ihrer Option) jeder späteren Version. 
		
		Die Veröffentlichung dieses Programms erfolgt in der Hoffnung, daß es Ihnen von
		Nutzen sein wird, aber OHNE IRGENDEINE GARANTIE, sogar ohne die implizite
		Garantie der MARKTREIFE oder der VERWENDBARKEIT FÜR EINEN 
		BESTIMMTEN ZWECK. Details finden Sie in der GNU General Public License. 
		
		Sie sollten ein Exemplar der GNU General Public License zusammen mit diesem
		Programm erhalten haben. Falls nicht, siehe <http://www.gnu.org/licenses/>.
		
		INHALT:			- Funktionen für die Währung.
		
		HISTORIE:
		------------------------------------------------------------------------------------------------------------------------------------------------
		V004	07.04.2015	ewa/jh	Anpassung für Open Source.
		------------------------------------------------------------------------------------------------------------------------------------------------
	Outline Version - 4.0.47
	Design-time Settings
.data VIEWINFO
0000: 6F00000001000000 FFFF01000D004347 5458566965775374 6174650400010000
0020: 0000000000D20000 002C000000020000 0003000000FFFFFF FFFFFFFFFFF8FFFF
0040: FFE1FFFFFF160000 0016000000EE0200 0084020000010000 0000000000010000
0060: 00FFFEFF0F410070 0070006C00690063 006100740069006F 006E004900740065
0080: 006D0000000000
.enddata
		Outline Window State: Maximized
		Outline Window Location and Size
.data VIEWINFO
0000: 6600010000001B00 0200000000000000 5BFDA41FE60C0500 1D00FFFF4D61696E
0020: 00
.enddata
.data VIEWSIZE
0000: 2100
.enddata
			Left: 0.0"
			Top: -0.01"
			Width:  9.0"
			Height: 5.479"
		Options Box Location
.data VIEWINFO
0000: D418D606B80B1A00
.enddata
.data VIEWSIZE
0000: 0800
.enddata
			Visible? Yes
			Left: 4.025"
			Top: 0.771"
			Width:  3.8"
			Height: 2.073"
		Class Editor Location
			Visible? No
			Left: 0.05"
			Top: 0.042"
			Width:  5.063"
			Height: 2.719"
		Tool Palette Location
			Visible? No
			Left: 8.1"
			Top: 2.594"
		Fully Qualified External References? Yes
		Reject Multiple Window Instances? No
		Enable Runtime Checks Of External References? No
		Use Release 4.0 Scope Rules? No
		Edit Fields Read Only On Disable? No
		Assembly Symbol File:
		! Outline Browser Location
			           Visible? No
			           Left:   Default
			           Top:    Default
			           Width:  Default
			           Height: Default
	Libraries
		File Include: EWASQL02.APL
			! Klassenbibliothek für das globale SQL - Handling..
	Global Declarations
		Window Defaults
			Tool Bar
				Display Style? Standard
				Font Name: MS Sans Serif
				Font Size: 8
				Font Enhancement: Bold
				Text Color: System Default
				Background Color: System Default
			Form Window
				Display Style? Etched
				Font Name: MS Sans Serif
				Font Size: 8
				Font Enhancement: Bold
				Text Color: System Default
				Background Color: System Default
			Dialog Box
				Display Style? Etched
				Font Name: MS Sans Serif
				Font Size: 8
				Font Enhancement: Bold
				Text Color: System Default
				Background Color: System Default
			Top Level Table Window
				Font Name: MS Sans Serif
				Font Size: 8
				Font Enhancement: None
				Text Color: System Default
				Background Color: System Default
			Top Level Grid Window
				Font Name: System Default
				Font Size: System Default
				Font Enhancement: System Default
				Text Color: System Default
				Background Color: System Default
			Data Field
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Multiline Field
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Spin Field
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
			Background Text
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Pushbutton
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
			Radio Button
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Check Box
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Option Button
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
			Group Box
				GroupBox Style: Etched
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Line Color: Use Parent
				Flow Direction: Default
			Child Table Window
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
			List Box
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Combo Box
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Line
				Line Color: Use Parent
			Frame
				Border Color: Use Parent
				Background Color: Use Parent
			Picture
				Border Color: Use Parent
				Background Color: Use Parent
			Date Time Picker
				Text Color: Use Parent
				Background Color: Use Parent
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
			Child Grid Window
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
			Rich Text Control
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Date Picker
				Font Name: Use Parent
				Font Size: Use Parent
			Tree Control
				Font Name: Use Parent
				Font Size: Use Parent
				Flow Direction: Default
			Navigation Bar
				Text Color: Use Parent
				Background Color: Use Parent
				Flow Direction: Default
			Pane Separator
			Tab Bar
				Font Name: Use Parent
				Font Size: Use Parent
				Font Enhancement: Use Parent
				Text Color: Use Parent
				Background Color: Use Parent
		Formats
			Number: 0%
			Number: #0
			Number: ###000
			Number: ###000;###000
			Date/Time: hh:mm:ss AMPM
			Date/Time: M/d/yy
			Date/Time: MM-dd-yy
			Date/Time: dd-MMM-yyyy
			Date/Time: MMM d, yyyy
			Date/Time: MMM d, yyyy hh:mm AMPM
			Date/Time: MMMM d, yyyy hh:mm AMPM
			Number: 000
		External Functions
		External Assemblies
		Constants
.data CCDATA
0000: 3000000000000000 0000000000000000 0000000000000000 0000000000000000
0020: 0000000000000000
.enddata
.data CCSIZE
0000: 2800
.enddata
			System
			User
			Enumerations
		Resources
		Variables
.data RESOURCE 0 0 1 1659395249
0000: DE0200009E010000 0000000000000000 02000017000000B8 0000001019000000
0020: 0106102044680000 00E703C026000B00 000083D100000019 F500012B00E73C00
0040: F60B0060EA000000 1900FD018A00E751 000B3D0003015800 00190001BF0062E7
0060: 99000B008F1C0100 1004000000020610 AF00E7D8A9000B00 A320010019F50001
0080: 2B00E7720CF40B00 00683901000400F8 010206FE00C18001 0000003F3D015A00
00A0: 190001BE060062E7 900C0B008F560100 C604000102EF009F 8001FC0000A35A01
00C0: 0019E50001062B00 E7BB0CF60B006873 01000400FC0102FE 00C9800100003F77
00E0: 015A00190001BE06 0042E7510D0B0000 8F90010016190004 0610AF00E7D8520D
0100: 0B00A3A9010019F5 00012B00E7530DF6 0B0048C201000400 008D02DC68000A00
0120: E70A00C402380000 00C6015A00040002 BF00E2E70C00C48E 00CA0100D6040002
0140: AF00E7B80E00C400 A3CE010004F50002 2B00E71000EEC400 68D201000400FD02
0160: 0A00E7FA00BD0338 000000D6015A0004 0002BF00C2E70901 BD038E00DA010016
0180: 0400030610AF00E7 A00D00C2030000A3 DE010004F1000102 FB002780010000FF
01A0: 68E201000400FE01 FE00C9800100003F
.enddata
			! .......... Anfang der globalen Variablen aus der Bibliothek 'EWAWHG02.APL'
			!
				! Globale Variablen: Boolean
			Boolean: bgWG_TestBalanceAmount
				! - TRUE, wenn die Umrechnung von Fremdwährung in Bilanzwährung
							im Testbetrieb nicht über die Währungskurse, sondern über
							einen festen Umrechnungsfaktor erfolgen soll.
						  - FALSE, wenn die Umrechnung im Testbetrieb und in der Produktion
							 gleich erfolgen soll.
			!
				! Globale Variablen: Functional Class
			FunctionalVar: agWG_Waehrung
				Class: fcWG_Waehrung
				! Instanz der Funktionen für Währungsfunktionalität.
			! .......... Ende der globalen Variablen aus der Bibliothek 'EWAWHG02.APL'
		Internal Functions
			!
			! .......... Anfang der internen Funktionen aus der Bibliothek 'EWAWHG02.APL'
			Function: WG_NumGetBalanceAmount
				Description: #VERWEIS: fcWG_Waehrung_WG_NumGetBalanceAmount#
				Returns
					Number: nBetr
				Parameters
					Number: npBetw
					Number: npWaehrungSeq
				Static Variables
				Local variables
				Actions
					Return agWG_Waehrung.WG_NumGetBalanceAmount( npBetw, npWaehrungSeq )
			Function: WG_NumGetBalanceSeq
				Description: #VERWEIS: fcWG_Waehrung_WG_NumGetBalanceSeq#
				Returns
					Number: nWaehrungSeq
				Parameters
				Static Variables
				Local variables
				Actions
					Return agWG_Waehrung.WG_NumGetBalanceSeq(  )
			Function: WG_StrGetBalanceShortName
				Description: #VERWEIS: fcWG_Waehrung_WG_StrGetBalanceShortName#
				Returns
					String: sWaehrungKurz
				Parameters
				Static Variables
				Local variables
				Actions
					Return agWG_Waehrung.WG_StrGetBalanceShortName(  )
			Function: __WG_NumGetKursEuro
				Description: Holt Kurs DM/EURO aus der DB.
				Returns
					Number: nKurs
						! Kurs Euro
				Parameters
				Static Variables
					Number: nsKurs
				Local variables
					String: slSql
				Actions
					!
					If (nsKurs = 0) or (nsKurs = NUMBER_Null)
						Set slSql = 'Select KURS from EURO where ROWNUM = 1 into :nsKurs'
						If SQ_SqlPrepare( hgSql, slSql ) = TRUE
							If SqlVarSetup( hgSql ) = TRUE
								If SQ_SqlExecute( hgSql ) = TRUE
									Call SQ_SqlFetchNext( hgSql )
					!
					Return nsKurs
			Function: WG_NumConvDmToEuro
				Description: Konvertiert einen gegebenen Betrag von
						DM nach EURO ohne zu runden.
				Returns
					Number: nEuro
						! Berechneter Betrag in EURO
				Parameters
					Number: npBetrag
						! Gegebener Betrag in DM
				Static Variables
					Number: nsKurs
				Local variables
				Actions
					If npBetrag = NUMBER_Null
						Return NUMBER_Null
					If npBetrag = 0
						Return 0
					!
					If (nsKurs = 0) or (nsKurs = NUMBER_Null)
						Set nsKurs = __WG_NumGetKursEuro( )
					!
					Return npBetrag / nsKurs
			Function: WG_NumConvEuroToDm
				Description: Konvertiert einen gegebenen Betrag von
						EURO nach DM ohne zu runden.
				Returns
					Number: nDM
						! Berechneter Betrag in DM
				Parameters
					Number: npBetrag
						! Gegebener Betrag in EURO
				Static Variables
					Number: nsKurs
				Local variables
				Actions
					If npBetrag = NUMBER_Null
						Return NUMBER_Null
					If npBetrag = 0
						Return 0
					!
					If (nsKurs = 0) or (nsKurs = NUMBER_Null)
						Set nsKurs = __WG_NumGetKursEuro( )
					!
					Return npBetrag * nsKurs
			Function: WG_NumConvDmToEuroRound
				Description: Konvertiert einen gegebenen Betrag von
						DM nach EURO und rundet auf 0 Nachkommastellen.
				Returns
					Number: nEuro
						! Berechneter Betrag in EURO
				Parameters
					Number: npBetrag
						! Gegebener Betrag in DM
				Static Variables
				Local variables
				Actions
					If npBetrag = NUMBER_Null
						Return NUMBER_Null
					If npBetrag = 0
						Return 0
					!
					Return SalNumberRound( WG_NumConvDmToEuro(npBetrag))
			Function: WG_NumConvEuroToDmRound
				Description: Konvertiert einen gegebenen Betrag von
						EURO nach DM und rundet auf 0 Nachkommastellen.
				Returns
					Number: nDM
						! Berechneter Betrag in DM
				Parameters
					Number: npBetrag
						! Gegebener Betrag in EURO
				Static Variables
				Local variables
				Actions
					If npBetrag = NUMBER_Null
						Return NUMBER_Null
					If npBetrag = 0
						Return 0
					!
					Return SalNumberRound( WG_NumConvEuroToDm(npBetrag))
			Function: WG_NumConvDmToEuroRound2
				Description: Konvertiert einen gegebenen Betrag von
						DM nach EURO und rundet auf 2 Nachkommastellen.
				Returns
					Number: nEuro
						! Berechneter Betrag in EURO
				Parameters
					Number: npBetrag
						! Gegebener Betrag in DM
				Static Variables
				Local variables
				Actions
					If npBetrag = NUMBER_Null
						Return NUMBER_Null
					If npBetrag = 0
						Return 0
					!
					Return ( WG_NumConvDmToEuroRound(npBetrag * 100) / 100 )
			Function: WG_NumConvEuroToDmRound2
				Description: Konvertiert einen gegebenen Betrag von
						EURO nach DM und rundet auf 2 Nachkommastellen.
				Returns
					Number: nDM
						! Berechneter Betrag in DM
				Parameters
					Number: npBetrag
						! Gegebener Betrag in EURO
				Static Variables
					Number: nsKurs
				Local variables
				Actions
					If npBetrag = NUMBER_Null
						Return NUMBER_Null
					If npBetrag = 0
						Return 0
					!
					Return ( WG_NumConvEuroToDmRound(npBetrag * 100) / 100 )
			Function: WG_StrGetHouseCurrencyIso
				Description: Liefert die ISO Bezeichnung der Hauswährung
						(früher Bilanzwährung)
				Returns
					String: sCurrencyIso
						! ISO Bezeichnung der Hauswährung
				Parameters
				Static Variables
					String: ssBezIso
				Local variables
					String: slSql
				Actions
					!
					If ssBezIso = STRING_Null
						Set slSql = '
									Select	WAEHRUNG_ISO 
									from	SCHL_WAEHRUNG 
									where	WAEHRUNG_BIL_JN = 1
									and	AKTIV_JN = 1 
									into	:ssBezIso'
						If SQ_SqlPrepare( hgSql, slSql ) = TRUE
							If SqlVarSetup( hgSql ) = TRUE
								If SQ_SqlExecute( hgSql ) = TRUE
									Call SQ_SqlFetchNext( hgSql )
									If ssBezIso = STRING_Null 
										Set ssBezIso = '???'
					!
					Return ssBezIso
			Function: WG_AppIsHouseCurrencyEuro
				Description: Zeigt, ob die Hauswährung Euro ist.
				Returns
					Boolean: bOk
						! - TRUE, wenn die Hauswährung Euro ist.
								  - FALSE, wenn die Hauswährung nicht Euro ist.
				Parameters
				Static Variables
				Local variables
				Actions
					If ( WG_StrGetHouseCurrencyIso( ) = 'EUR' )
						Return TRUE
					!
					Return FALSE
			!
			! .......... Ende der internen Funktionen aus der Bibliothek 'EWAWHG02.APL'
			!
		Named Toolbars
		Named Menus
		Class Definitions
.data RESOURCE 0 0 1 2575033799
0000: 1E1D00009C0F0000 0000000000000000 0200001E00FFFF01 00160000436C6173
0020: 73566172004F7574 6C696E6552006567 496E666F1D003C00 00FFFE00FF0D6600
0040: 630057002047005F 0057610000650068 0072007500006E00 670040000000F002
0060: 0000001019000000 0106102010680000 00E703C01E000E00 00001B19000400C4
0080: 00000206102B00E7 3400F60E00000180 A600000001001800 00FF106600835300
00A0: 51005F2041007000 706C002869006361 740022696F006E38 01C2000A0000005B
00C0: 190001A2063C6800 0082E70700180004 6D001900D6040002 AE1000E7D82F0019
00E0: 00931D000019F500 012B00E74000F619 0060360000001900 FD018A00E7580019
0100: 3D004F0058000004 0002BF0062E77100 19002F530000D619 0001AF00E7D88200
0120: 19008B6C000004F5 00022B00E79A00F6 1900627000001900 FD018A00E7AD0019
0140: 3D00890058000019 0001BF0042E76C01 1900000FA2000000 861900010106EF00
0160: 1F800100FC000003 0180210000006402 0000FF08AC660053 518B5371006C005E
0180: 000000030000006F 0400E902063C0A00 E708002400B00500 0000045900190001
01A0: BA06100002E72400 250000006F1D00D6 040002AF00E7C825 002500000301806A
01C0: 000000660300FF09 BC66005123420061 7300226504020010 003C00000400B500
01E0: 023CAB00E707D82C 0004006604000400 FD028A00E709002C 3700080058000004
0200: 0002BF00E2E70B00 2C0D000C000000D6 040002AF00E7780D 002C009B100004F5
0220: 00022B00E70F00DE 2C00601400000004 00FD028A00E71100 2CB7001858000004
0240: 0002BF00E2E71300 2C0D001C000000D6 040002AF00E77815 002C008320000000
0260: 04F500022B00E717 00DE2C0062240000 0400FD028A00E719 002C370028004800
0280: 0019000001BE0600 E2E71D002C2D0041 0000860400010206 EF009F8001FC0000
02A0: 834500000004F900 01FB002780010000 FF60490000001900 F90106AA00E7252C
02C0: 3700620018000004 000102BF007F80F2 0100000F66000000 E6040001EF009F80
02E0: 01FC000043018004 0000660400FF11F8 660063A343007265 FA6174AB496E6602
0300: 6F220000000100BD 0004F50002AB00E7 07D8340004008001 80C3000000051900
0320: FF0C6600FE63A044 00760063423B736C 01DA000C005B1900 01BE06008EE73800
0340: 046D001900161900 040610AF00E75A09 3800008332000000 19F50001AB00E70B
0360: DE3800604B000000 1900FD01AA00E70D 3837006400580000 190001BF00EAE70F
0380: 380D007D000000D6 190001AF00E77A11 3800839600000019 F50001AB00E713DE
03A0: 380060AF00000004 00FD02AA00E71538 3700B30058000004 0003BC061000EAE7
03C0: 17380D00B7000000 D6040003AF00E77A 19380083BB000000 04F500032B00E71B
03E0: 00DE380060BF0000 000400FD03AA00E7 1D383700018000A8 00000006000000C6
0400: FF1366003E535000 AA726F746F8A636F 6C004FA2626A0065 6322740203001500
0420: BC000019E4000001 06AB00E708DA4705 006619001900FD01 8A00E70C0047B700
0440: 32190019000101BF 007F80F20100006F 3600C604000102EF 009F8001FC000083
0460: 3A00000004F90001 FB002780010000FF 603E0000001900F9 01068A00E7160047
0480: B700571800001900 0101BF007F80F201 00000F5B000000E6 190001EF009F8001
04A0: FC00008B5F000004 F1000102FB002780 010000FF62630000 0400FE01FE00C980
04C0: 010000BF67980000 040001BF007F80F2 0100000F6B000000 9619000106AF00E7
04E0: 7A24470083840000 0019F1000101FB00 2780010000FF6088 0000001900FE01FE
0500: 00C9800100003F8C 00980000190001BF 007F80F20100000F 90000000E6190001
0520: EF009F8001FC0000 839400000004F100 0102FB0027800100 00FF609800000004
0540: 00FE01FE00C98001 00003F9C00980000 040001BF007F80F2 0100000FA0000000
0560: E6040001EF009F80 01FC000083A40000 0004F90001FB0027 80010000FF100180
0580: 1900000700180000 FF0B6600FB53A852 0065706F6A727422 00F4010000961900
05A0: 0106AF00E76A0749 0400630180190062 080000FF11FFEB53 71A24578006563EA
05C0: 7574691A6E220001 00BD0019E5000106 EB00E7DA4F040018 0180040009001800
05E0: 00FF0D6300BA5351 57AA696E646FA077 005400626C462200 0100006F0400F902
0600: 062A00E70B870036 0A0001806604000A 00C6FF0F6300AF45 64AA6974446FA86D
0620: 0061696E1A322200 0100BD0004B50002 102B00E7C700F0EF 0000001801800400
0640: 0B00D80000FF0D3F 4600AE696446AB65 6C64462200010000 6F0400ED033C0A00
0660: E70A000901320700 000180201D000000 0C000086FF114300 74EE6253AB53686F
0680: BA77446DAF6E40D0 00000200005B1900 019A0610000082E7 3700AE01006E0019
06A0: 009604000206AF00 E7B83800AE004301 803E0000600D0000 00FF13FC4300FB51
06C0: AA686F77508A6F70 5500702A537464B2 00D8000005005B19 00019E06000082E7
06E0: 8400BB01006E0019 00D6190001AF00E7 B88500BB008B3200 0004F1000102FB00
0700: 2780010000FF6636 000400FE01FE00C9 80010000BF3A9900 040001BF007F80F2
0720: 0100000F01803A00 99000E00FFAD1163 6FEE6C51AE456974 EE446D0B6E7C0000
0740: 00F60400D6040002 AF00E7A0FA000702 00009B040019E500 01062B00E7FB00EE
0760: 0700661D001900FD 018A00E7FC0007BB 00365900040003BF 00E2E7FD00070E00
0780: 0180AC008000000F 000000FFBD1042AA 415F4170AA706C69 63AA6174696FA26E
07A0: C0020016BC000019 A50001063CAB00E7 07D8C80204006619 000400FD02AA00E7
07C0: 09C8B7001D590004 0002BF00EAE70BC8 4D00210000D60400 02AF00E77A0DC800
07E0: 8B25000004F50002 AB00E711DEC80060 290000000400FD02 AA00E713C837002D
0800: 00580000040002BF 00EAE715C80D0031 0000008604000202 06EF001F800200FD
0820: 003F010080000035 00000004E5000206 AB00E71BDEC80060 390000000400FD02
0840: AA00E71DC837003D 0018000004000202 BF007F80F60200FF 2201000041000096
0860: 19000106AF00E778 2300C800835A0000 0019F50001AB00E7 25DEC80062730000
0880: 0400F902068A00E7 2700C8B700775800 00040002BF00E2E7 2900C80D007B0000
08A0: 00D6040002AF00E7 782B00C800837F00 000004F500022B00 E72D00DEC8006083
08C0: 0000000400FD02AA 00E72FC8B7008758 0000190001BB1000 82E7AE01C902006E
08E0: 00A000C619000101 EF009F8001FC0000 9BA40004F500022B 00E74B02ECC90200
0900: 64A800000400FD02 0A00E7BA04C9023B 000180663A001000 C6FF0A6600AE425F
0920: 42AE616368667C00 04006F1900690106 3C002A00E707CA02 B604001959000400
0940: 02BF00EAE709CA2D 001D0000D6040002 AF00E77A0BCA009B 210019B50001102B
0960: 00E7C200E8CB0200 0018018004001100 D80000FF0CEB4241 A84D006573732A61
0980: 67652A00D0000001 00001B04000102BB 3C007F80F2010000 0F01802D00800000
09A0: 12000000FFFD0BEF 57AA6E646F7760D0 00000006006F0400 FD022A00E707CE02
09C0: B604000459000400 03BF00EAE709CE6D 0008009619000106 AF00E77A0DCE009B
09E0: 210004F1000102FB 002780010000FF62 2500000400F80103 06FE00C980010000
0A00: BF29980000040001 BF007F80F2010000 8F01801D81001300 0000FFFD0CFFA348
0A20: 00656C1A70400002 00BD0019E5000106 AB00E707D8D00204 006619000400F902
0A40: 06AA00E709D03700 018060AE00000014 00C6FF0E6600BF42 AA61736550AA6172
0A60: 616D689C01000C00 6F1900F901062A00 E708D802B6050019 190019000101BF00
0A80: 7F80F20100006F1D 009619000106AF00 E7780E00D8009B36 0019E100010406FB
0AA0: 002780010000FF66 3A001900F901068A 00E71400D8B70053 18000004000103BF
0AC0: 007F80F20100002F 5700009619000106 AF00E7781A00D800 8B70000004F10001
0AE0: 02FB002780010000 FF627400001900F9 01068A00E72000D8 37008D0018000019
0B00: 000101BF007F80F2 0100000F91000000 9619000106AF00E7 782600D80083AA00
0B20: 000004F1000102FB 002780010000FF98 0180040015980000 FF1166EF41EE444D
0B40: AA6E754163AA7469 6F6E462200010000 6F0400FD032A00E7 07DA023604000180
0B60: 684501001600C6FF 0F6600AE425F57EA 696E642A7753697A 00A2658A01000DBC
0B80: 000019E50001062B 00E70500D0510304 00006619001900FD 01AA00E70851B700
0BA0: 325900190001BF00 EAE70A516D004B00 D6190001AF00E77A 0C51008B64000019
0BC0: F50001AB00E70EDE 5100667D001900FD 018A00E7100051B7 00965900190001BF
0BE0: 00E2E71200516D00 AF00D6190001AF00 E77A14510083C800 000019F50001AB00
0C00: E716DE510060E100 00001900FD018A00 E71800513700FA00 580000190001BF00
0C20: EAE71A518D001301 00D6190001AF00E7 781C005100A32C01 0019F50001AB00E7
0C40: 1EDE51000001805F 0000001700D80000 FF10AB434F5FAA41 70706CAA69636174
0C60: 2B6F6EF400C80000 0800005B190001BA 06100082E7430062 03006E001900D604
0C80: 0002AF00E7B84500 62009B1D0004F500 022B00E75600EE62 006621000400FD02
0CA0: 8A00E7650062BB00 255900040002BF00 E2E77400626E0029 00D6040002AF00E7
0CC0: BA8362009B2D0019 F500012B00E79400 EE62006246000019 00FD018A00E79600
0CE0: 623B000180204200 0000180000F6FF0C BA434F43AE6F6E65 0A6374D8000000F6
0D00: 06009619000106AE 3C00E76207630304 009B190004F10001 02FB002780010000
0D20: FF661D000400FE01 FE00C980010000BF 219900040001BF00 7F80F20100006F25
0D40: 009619000106AE10 00E7A02601640300 009B3E0004F10001 02FB002780010000
0D60: FF9001807D000019 D900FF0DAA526164 69A34C006973AA74 426F78209A000000
0D80: 0500006F1900E901 063C0A00E70600D5 03B6050019590019 0001BF00EAE707D5
0DA0: 6D003200D6190001 AF00E77A08D5009B 4B0019F50001AB00 E709DED500626400
0DC0: 001900FD01AA00E7 0AD5370001800C13 011A000000A6FF0F 6344AA65736B74EA
0DE0: 6F704CEB7442A278 4E01000BBC000019 E5000106AB00E707 C8F5030600006619
0E00: 001900FD01AA00E7 08F5B70032590019 0001BF00EAE709F5 6D004B00D6190001
0E20: AF00E77A0AF5009B 640019F50001AB00 E70BDEF500667D00 1900FD01AA00E70C
0E40: F5B7009658000019 0001BF00EAE70DF5 6D00AF00D6190001 AF00E77A0EF5009B
0E60: C80019F50001AB00 E70FDEF50066E100 1900FD01AA00E710 F5B700FA59001900
0E80: 01BF00EAE711F50D 000180640081001B 000000FFB10B6300 69BA724C73FF667C
0EA0: 0004006F1900F901 062A00E707F803B6 0600195900190001 BF00EAE708F86D00
0EC0: 3200D6190001AF00 E77A09F8009B4B00 19F50001AB00E70A DEF8009001804B00
0EE0: 001CD80000FF0FAF 7254AA7265654CFB 736F5E00F4030000 9619000106AF00E7
0F00: 6207FB0306009B19 0019F50001AB00E7 08DEFB0066320019 00FD01AA00E709FB
0F20: 3700018064AF0000 1D0086FF0C630046 EA696C65FB730FD6 000000F007000000
0F40: 9619000106AF00E7 420601040500009B 190019E5000106AB 00E707DC01040066
0F60: 32001900F901062A 00E7080104B7004B 5900190001BE0600 CAE70901046D0064
0F80: 009619000106AF00 E7720A0104009B7D 0019E5000106AB00 E70BDC0104006696
0FA0: 001900F901062A00 E70C01043700
.enddata
			! .......... Anfang der Klassendefinitionen aus der Bibliothek 'EWAWHG02.APL'
			!
				! Funktionale Basis - Klassen
			Functional Class: fcWG_Waehrung
				Description: Klasse für die Funktionen der Waehrungszugriffe und -berechnungen.
				Derived From
				Class Variables
				Instance Variables
				Functions
					Function: WG_NumGetBalanceAmount
						Description: Rechnet einen Fremdwährungsbetrag in Bilanzwährung um.
								- Ist die Variable 'bgWG_TestBalanceAmount = TRUE', so
								  wird die Umrechnung im Testbetrieb mit dem Faktor 0,5
								  durchgeführt.
								- Da noch keine Währungskurse vorhanden sind, wird die
								  normale Umrechnung mit dem Faktor 1 durchgeführt.
						Returns
							Number: nBetr
								! Betrag in Bilanzwährung.
						Parameters
							Number: npBetw
								! Betrag in Fremdwährung.
							Number: npWaehrungSeq
								! Sequence der Fremdwährung.
						Static Variables
						Local variables
							Number: nlBetr
						Actions
							Set nlBetr = npBetw
							If npWaehrungSeq != WG_NumGetBalanceSeq(  )
								If CO_AppIsProduction(  ) = FALSE
									If bgWG_TestBalanceAmount = TRUE
										Set nlBetr = SalNumberRound( npBetw * 50 ) / 100
							!
							Return nlBetr
					Function: WG_NumGetBalanceSeq
						Description: Liefert die Sequence der Bilanzwährung.
						Returns
							Number: nWaehrungSeq
								! Sequence der Bilanzwährung.
						Parameters
						Static Variables
							Number: nsWaehrungSeq
						Local variables
							String: slSql
						Actions
							If ( nsWaehrungSeq = NUMBER_Null ) Or
									   ( nsWaehrungSeq = 0 )
								Set slSql = 'Select WAEHRUNG_SEQ ' ||
											   'From SCHL_WAEHRUNG ' ||
											   'Into :nsWaehrungSeq ' ||
											   'Where AKTIV_JN = 1 And ' ||
											   'WAEHRUNG_BIL_JN = 1'
								!
								If SQ_SqlPrepare( hgSql, slSql ) = TRUE
									If SqlVarSetup( hgSql ) = TRUE
										If SQ_SqlExecute( hgSql ) = TRUE
											Call SQ_SqlFetchNext( hgSql )
								If nsWaehrungSeq = 0
									Set nsWaehrungSeq = NUMBER_Null
							!
							Return nsWaehrungSeq
					Function: WG_StrGetBalanceShortName
						Description: Liefert die Kurzbezeichnung der Bilanzwährung.
						Returns
							String: sWaehrungKurz
								! Kurzbezeichnung der Bilanzwährung.
						Parameters
						Static Variables
							String: ssWaehrungKurz
						Local variables
							String: slSql
						Actions
							If ssWaehrungKurz = STRING_Null
								Set slSql = 'Select WAEHRUNG_KURZ ' ||
											   'From SCHL_WAEHRUNG ' ||
											   'Into :ssWaehrungKurz ' ||
											   'Where AKTIV_JN = 1 And ' ||
											   'WAEHRUNG_BIL_JN = 1'
								!
								If SQ_SqlPrepare( hgSql, slSql ) = TRUE
									If SqlVarSetup( hgSql ) = TRUE
										If SQ_SqlExecute( hgSql ) = TRUE
											Call SQ_SqlFetchNext( hgSql )
								If ssWaehrungKurz = STRING_Null
									Set ssWaehrungKurz = '???'
							!
							Return ssWaehrungKurz
			! .......... Ende der Klassendefinitionen aus der Bibliothek 'EWAWHG02.APL'
		Default Classes
			MDI Window:
			Form Window:
			Dialog Box:
			Table Window:
			Grid Window:
			Quest Window:
			Data Field:
			Spin Field:
			Multiline Field:
			Pushbutton: CpbBA_Ok
			Radio Button:
			Check Box:
			Option Button:
			Child Table:
			Quest Child Window:
			List Box:
			Combo Box:
			Picture:
			Vertical Scroll Bar:
			Horizontal Scroll Bar:
			Column:
			Background Text:
			Group Box:
			Line:
			Frame:
			Custom Control:
			ActiveX:
			Date Picker:
			Date Time Picker:
			Child Grid:
			Tab Bar:
			Rich Text Control:
			Separator:
			Tree Control:
			Navigation Bar:
			Pane Separator:
		Application Actions
			On SAM_AppExit
				!
					! Ereignis, das an die Applikation gesendet wird, wenn die Applikation beendet wird.
				If BA_AppIsBatch(  ) = TRUE
					Call BA_AppWriteBatchFileRet( NUMBER_Null )
			On SAM_AppStartup
				!
					! Ereignis, das an die Applikation gesendet wird, wenn die Applikation gestartet wird.
				Call BA_AppSetProgramConstant( 'EWAWHG02',
									      004,
									      'Ewald GmbH',
									      '07.04.2015' )
				!
				Call BA_AppStartup(  )
				Call SQ_AppStartup(  )
			On SAM_SqlError
				!
					! Ereignis, das an die Applikation gesendet wird, wenn ein SQL-Fehler auftritt und keine
							  lokale Behandlung des SQL-Fehlers erfolgt.
				Return SQ_SqlCheckErr(  )
	! Änderungshistorie
		! Version 004
			! Datum		Name	Änderung
					----------------------------------------------------------------------------------------------------------------------------------
					  07.04.2015	ewa/jh	Anpassung für Open Source.
