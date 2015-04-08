========================================
== Framework für Gupta Team Developer ==
========================================

Features:
---------

- Anbindung an ORACLE-Datenbank.

- Klassen für Masken zur Suche und Auswahl von Datensätzen.

- Klassen für Masken zur Erfassung und Bearbeitung von Datensätzen.

- Automatische Protokollierung von Änderungen.

- Komplette Rechteverwaltung für die Masken und weitere Funktionalitäten.

- Workflow (4-Augenprinzip) über die Bearbeitungslistenfunktionalität.

- Einfaches Hinzufügen bzw. Entfernenen von Objekten für eine Datenbankspalte:
  - Auf dem Objekt muss nur Datenbanktabelle und Datenbankspalte gesetzt werden
    => Automatisch in SQL-Statements und in der Protokollierung.

- Meldungstexte können in der Datenbank hinterlegt werden.

- Programmparameter können in der Datenbank hinterlegt und dort ausgelesen werden.

- Beispielapplikation, die ausführlich die wichtigsten Funktionalitäten aufzeigt.


Voraussetzungen:
----------------

- Gupta Team Developer 6.1 oder höher
  (getestet mit 6.1 - SP2)
  - Kostenlose Testversion kann von
    <http://www.guptatechnologies.com/Services/productDownloads.aspx>
    heruntergeladen werden.

- ORACLE-Datenbank (in 32-Bit Version, da 64-Bit Version nicht unterstützt)
  (getestet mit ORACLE XE 11.2)
  - Kostenlose Testversion kann von
    <http://www.oracle.com/technetwork/database/enterprise-edition/downloads>
    heruntergeladen werden.

- Tool zum ausführen von Datenbankskripten
  (getestet mit ORACLE SqlDeveloper 4.0.2)
  - Kostenlose Testversion kann von
    <http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads>
    heruntergeladen werden.


Anpassungen:
------------

- Bei den Pfadeinträgen wird angenommen, dass die Installation in folgenden
  Verzeichnissen erfolgt ist:
  - J:\Development\TD6\Admin
  - J:\Development\TD6\Bitmap
  - J:\Development\TD6\Help
  - J:\Development\TD6\Project
  - J:\Development\TD6\Report

- Ist dies nicht der Fall, müssen die folgenden Pfade angepasst werden:
  - In ..\Admin müssen die Pfade in der <EWA_APP.INI> geprüft und angepasst
    werden.
  - In ..\Project\EWA_BASE\EWABAS02.APL muss die Konstante <K_BA_sIniPath>
    entsprechend angepasst werden.
  - In ..\Project\EWA_BASE\EWASQL02.APL muss im Named Menu <menuSQ_Help>
    der Menüpunkt "Basishilfe" entsprechend angepasst werden.
  - In ..\Project\EWA_BASE\Oracle\INSTALL_01.SQL müssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.
  - In ..\Project\EWA_BASE\Oracle\UNINSTALL_01.SQL müssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.
  - In ..\Project\EWA_BSPL\Oracle\INSTALL_99.SQL müssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.
  - In ..\Project\EWA_BSPL\Oracle\UNINSTALL_99.SQL müssen die Pfaddefinitionen
    am Beginn des Skripts entsprechend angepasst werden.

- Im Team Developer muss unter dem Menüpunkt <Tools -> Preferences> auf dem
  Register <Directories> der Wert <Global Path> um die Verzeichnisse
  <J:\Development\TD61\Project\EWA_BASE\Winappl;J:\Development\TD61\Bitmap;>
  erweitert werden (oder entsprechend angepasste Verzeichnisse).

- Die SQL.INI muss um einen Eintrag für die ORACLE-Datenbank <EWALD> erweitert
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

 - Ausführen des (evtl. zuvor angepassten) Installtionsskripts für das
   Framework ..\Project\EWA_BASE\Oracle\INSTALL_01.SQL unter dem Benutzer/
   Schema <EWA_TEST>.

 - Ausführen des (evtl. zuvor angepassten) Installtionsskripts für die
   Beispielapplikation ..\Project\EWA_BSPL\Oracle\INSTALL_99.SQL unter
   dem Benutzer/Schema <EWA_TEST>.


Start der Beispielapplikation:
------------------------------

  - Die Beispielapplikation ..\Project\EWA_BSPL\Winappl\BSPIEL01.APP
    im Team Developer laden und starten.

  - Beim Anmeldebildschirm in das Feld <Rechtprüfung -> Anwender> einen
    der in der Datenbank angelegten Mitarbeiter/Nutzer angeben:
    - <ADMI_U1>: Administrator für die Rechteverwaltung
    - <AEND_A2>: Mitarbeiter aus Abteilung A2 mit Änderungsrechten
    - <AEND_A3>: Mitarbeiter aus Abteilung A3 mit Änderungsrechten
    - <LESE_T1>: Mitarbeiter aus Team T1 mit Leserechten
    - <VOLL_F1>: Mitarbeiter aus Unternehmensführung F1 mit Vollzugriff

  - Entsprechend dem Anwender der Rechtprüfung bestehen Lese-/Änderungs-
    rechte oder Vollzugriff auf die einzelnen Masken der Applikation.

  - Über den Menüpunkt <Funktionen -> Datenmodell> kann das Datenmodell
    für die Beispielapplikation angelegt bzw. gelöscht werden. Dies
    betrifft alle Masken unter dem Menü <Funktionen>.
    Das Datenmodell für die Masken unter dem Menü <Verwaltung> wurde
    bereits bei der Installation angelegt.

  - Für alle Masken erfolgt eine Rechteprüfung und eine Protokollierung
    der Änderungen.

  - Für die Masken unter dem Menü <Funktionen> erfolgt ein Eintrag in
    den Workflow (Bearbeitungsliste), der im 4-Augen-Prinzip von einem
    anderen Mitarbeiter geprüft werden muss. Bei der Anmeldung wird
    dieser Mitarbeiter im Feld <Rechtprüfung -> Anwender> angegeben.


Weitere Informationen:
----------------------

Ewald GmbH
info@ewald.de
