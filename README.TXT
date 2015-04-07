========================================
== Framework f�r Gupta Team Developer ==
========================================

Voraussetzungen:
----------------

- Gupta Team Developer 6.1 oder h�her
  (getestet mit 6.1 - SP2)
  - Kostenlose Testversion kann von
    <http://www.guptatechnologies.com/Services/productDownloads.aspx>
    heruntergeladen werden.

- ORACLE-Datenbank (in 32-Bit Version, da 64-Bit Version nicht unterst�tzt)
  (getestet mit ORACLE XE 11.2)
  - Kostenlose Testversion kann von
    <http://www.oracle.com/technetwork/database/enterprise-edition/downloads>
    heruntergeladen werden.

- Tool zum ausf�hren von Datenbankskripten
  (getestet mit ORACLE SqlDeveloper 4.0.2)
  - Kostenlose Testversion kann von
    <http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads>
    heruntergeladen werden.


Anpassungen:
------------

- Bei den Pfadeintr�gen wird angenommen, dass die Installation in folgenden
  Verzeichnissen erfolgt ist:
  - J:\Development\TD6\Admin
  - J:\Development\TD6\Bitmap
  - J:\Development\TD6\Help
  - J:\Development\TD6\Project
  - J:\Development\TD6\Report

- Ist dies nicht der Fall, m�ssen die folgenden Pfade angepasst werden:
  - In ..\Admin m�ssen die Pfade in der <EWA_APP.INI> gepr�ft und angepasst
    werden.
  - In ..\Project\EWA_BASE\EWABAS02.APL muss die Konstante <K_BA_sIniPath>
    entsprechend angepasst werden.
  - In ..\Project\EWA_BASE\EWASQL02.APL muss im Named Menu <menuSQ_Help>
    der Men�punkt "Basishilfe" entsprechend angepasst werden.
  - In ..\Project\EWA_BASE\Oracle\INSTALL_01.SQL m�ssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.
  - In ..\Project\EWA_BASE\Oracle\UNINSTALL_01.SQL m�ssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.
  - In ..\Project\EWA_BSPL\Oracle\INSTALL_99.SQL m�ssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.
  - In ..\Project\EWA_BSPL\Oracle\UNINSTALL_99.SQL m�ssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.

- Im Team Developer muss unter dem Men�punkt <Tools -> Preferences> auf dem
  Register <Directories> der Wert <Global Path> um die Verzeichnisse
  <J:\Development\TD61\Project\EWA_BASE\Winappl;J:\Development\TD61\Bitmap;>
  erweitert werden (oder entsprechend angepasste Verzeichnisse).

- Die SQL.INI muss um einen Eintrag f�r die ORACLE-Datenbank <EWALD> erweitert
  werden. Dieser kann etwa wie folgt aussehen:

  [win32client]
  clientname=Win32Client
  [win32client.dll]
  comdll=sqlora32
  [oragtwy]
  REMOTEDBNAME=EWALD,@XE
  substitute=SYSSQL.,
  substitute=syssql.,sys.
  substitute=@UPPER,UPPER
  substitute=SYSDATETIME,SYSDATE
  substitute=@DATETOCHAR,TO_CHAR
  substitute=@DAY,DAY
  substitute=@MONTH,MONTH
  substitute=@YEAR,YEAR
  substitute=@YEARNO,YEARNO
  substitute=@DECODE,DECODE
  substitute=@RIGHT,RIGHT
  substitute=@LEFT,LEFT
  substitute=@CHAR,CHR
  substitute=@DATE,DATUM
  longbuffer=32760
  fetchrow=20
  maperror=OFF
  nodefparse=yes


Installation:
-------------

 - Einrichten eines Benutzers/Schemas <EWA_TEST> mit dem Passwort <EWA_TEST>
   in der ORACLE-Datenbank und zuweisen der entsprechenden Rechte, z.B. mit
   <Grant All Privileges To EWA_TEST>.

 - Ausf�hren des (evtl. zuvor angepassten) Installtionsskripts f�r das
   Framework ..\Project\EWA_BASE\Oracle\INSTALL_01.SQL unter dem Benutzer/
   Schema <EWA_TEST>.

 - Ausf�hren des (evtl. zuvor angepassten) Installtionsskripts f�r die
   Beispielapplikation ..\Project\EWA_BSPL\Oracle\INSTALL_99.SQL unter
   dem Benutzer/Schema <EWA_TEST>.


Start der Beispielapplikation:
------------------------------

  - Die Beispielapplikation ..\Project\EWA_BSPL\Winappl\BSPIEL01.APP
    im Team Developer laden und starten.

  - Beim Anmeldebildschirm in das Feld <Rechtpr�fung -> Anwender> einen
    der in der Datenbank angelegten Mitarbeiter/Nutzer angeben:
    - <ADMI_U1>: Administrator f�r die Rechteverwaltung
    - <AEND_A2>: Mitarbeiter aus Abteilung A2 mit �nderungsrechten
    - <AEND_A3>: Mitarbeiter aus Abteilung A3 mit �nderungsrechten
    - <LESE_T1>: Mitarbeiter aus Team T1 mit Leserechten
    - <VOLL_F1>: Mitarbeiter aus Unternehmensf�hrung F1 mit Vollzugriff

  - Entsprechend dem Anwender der Rechtpr�fung bestehen Lese-/�nderungs-
    rechte oder Vollzugriff auf die einzelnen Masken der Applikation.

  - �ber den Men�punkt <Funktionen -> Datenmodell> kann das Datenmodell
    f�r die Beispielapplikation angelegt bzw. gel�scht werden. Dies
    betrifft alle Masken unter dem Men� <Funktionen>.
    Das Datenmodell f�r die Masken unter dem Men� <Verwaltung> wurde
    bereits bei der Installation angelegt.

  - F�r alle Masken erfolgt eine Rechtepr�fung und eine Protokollierung
    der �nderungen.

  - F�r die Masken unter dem Men� <Funktionen> erfolgt ein Eintrag in
    den Workflow (Bearbeitungsliste), der im 4-Augen-Prinzip von einem
    anderen Mitarbeiter gepr�ft werden muss. Bei der Anmeldung wird
    dieser Mitarbeiter im Feld <Rechtpr�fung -> Anwender> angegeben.


Weitere Informationen:
----------------------

Ewald GmbH
info@ewald.de