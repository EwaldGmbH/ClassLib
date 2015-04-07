/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  INSTALL_01.SQL                                     **/
/**                                                                         **/
/**   Version ........:  V001 vom 07.04.2015                                **/
/**                                                                         **/
/**   Autor: .........:  Ewald GmbH          (Kontakt: info@ewald.de)       **/
/**                                                                         **/
/**   Dieses Programm ist freie Software. Sie können es unter den Beding-   **/
/**   ungen der GNU General Public License, wie von der Free Software       **/
/**   Foundation veröffentlicht, weitergeben und/oder modifizieren, ent-    **/
/**   weder gemäß Version 3 der Lizenz oder (nach Ihrer Option) jeder       **/
/**   späteren Version.                                                     **/
/**                                                                         **/
/**   Die Veröffentlichung dieses Programms erfolgt in der Hoffnung, dass   **/
/**   es Ihnen von Nutzen sein wird, aber OHNE IRGENDEINE GARANTIE, sogar   **/
/**   ohne die implizite Garantie der MARKTREIFE oder der VERWENDBARKEIT    **/
/**   FÜR EINEN BESTIMMTEN ZWECK. Details finden Sie in der GNU General     **/
/**   Public License.                                                       **/
/**                                                                         **/
/**   Sie sollten ein Exemplar der GNU General Public License zusammen mit  **/
/**   diesem Programm erhalten haben.                                       **/
/**   Falls nicht, siehe <http://www.gnu.org/licenses/>.                    **/
/**                                                                         **/
/**   Funktion .......:  Installation der Datenbank für die Klassen-        **/
/**                      bibliotheken (ohne Wordschnittstelle)              **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   Änderungsgeschichte                                                   **/
/**                                                                         **/
/**   Vers. Datum       Bearb.  Aenderungsgrund (lt. Antrag)                **/
/**   --------------------------------------------------------------------  **/
/**   001   07.04.2015  EWA/JH  Neuerstellung.                              **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
-------------------------------------------------------------------------------
-- Verzeichnisse der Installationsdateien definieren
-------------------------------------------------------------------------------
Define SQL_PACKAGE_DIR=J:\Development\TD61\Project\EWA_BASE\Oracle\Package\
Define SQL_SCRIPT_DIR=J:\Development\TD61\Project\EWA_BASE\Oracle\Script\
Define SQL_TRIGGER_DIR=J:\Development\TD61\Project\EWA_BASE\Oracle\Trigger\

-------------------------------------------------------------------------------
-- Datenbanktabellen und zugehörige Objekte installieren
-------------------------------------------------------------------------------
@&SQL_SCRIPT_DIR.DB_CRE01.SQL

-------------------------------------------------------------------------------
-- Packages installieren
-------------------------------------------------------------------------------
@&SQL_PACKAGE_DIR.DVPGPA01.SPE
@&SQL_PACKAGE_DIR.DVPGPA01.BDY
@&SQL_PACKAGE_DIR.KRMASK01.SPE
@&SQL_PACKAGE_DIR.KRMASK01.BDY
@&SQL_PACKAGE_DIR.RECHTE11.SPE
@&SQL_PACKAGE_DIR.RECHTE11.BDY
@&SQL_PACKAGE_DIR.RECHTE10.SPE
@&SQL_PACKAGE_DIR.RECHTE10.BDY

-------------------------------------------------------------------------------
-- Trigger installieren
-------------------------------------------------------------------------------
@&SQL_TRIGGER_DIR.BATCH_UEBERWACHUNG.TRG;
@&SQL_TRIGGER_DIR.BEARBEITUNG_LISTE.TRG;
@&SQL_TRIGGER_DIR.BEARBLIST_REF.TRG;
@&SQL_TRIGGER_DIR.BEARBVORG_REF_BEARBVORG.TRG;
@&SQL_TRIGGER_DIR.DOKUMENT.TRG;
@&SQL_TRIGGER_DIR.DV_NUTZER.TRG;
@&SQL_TRIGGER_DIR.DV_PROG_MELDUNG.TRG;
@&SQL_TRIGGER_DIR.DV_PROG_PARAM.TRG;
@&SQL_TRIGGER_DIR.DV_PROG_PARAM_WERT.TRG;
@&SQL_TRIGGER_DIR.DV_PROG_VORGANG.TRG;
@&SQL_TRIGGER_DIR.DV_PROG_VORGANG_PARAM.TRG;
@&SQL_TRIGGER_DIR.DVPROGV_REF_DOK.TRG;
@&SQL_TRIGGER_DIR.DVPROGV_REF_PROTK.TRG;
@&SQL_TRIGGER_DIR.MITARBEITER.TRG;
@&SQL_TRIGGER_DIR.PROTOKOLL_KOPF.TRG;
@&SQL_TRIGGER_DIR.PROTOKOLL_WERT.TRG;
@&SQL_TRIGGER_DIR.PROTOKOLL_ZEILE.TRG;
@&SQL_TRIGGER_DIR.RECHT_GRUPPE.TRG;
@&SQL_TRIGGER_DIR.RECHT_MASTER.TRG;
@&SQL_TRIGGER_DIR.RECHTGR_REF_DVNUTZER.TRG;
@&SQL_TRIGGER_DIR.RECHTGR_REF_DVPROGF.TRG;
@&SQL_TRIGGER_DIR.RECHTGR_REF_SONDERFALL.TRG;
@&SQL_TRIGGER_DIR.RECHTMA_REF_DVNUTZER.TRG;
@&SQL_TRIGGER_DIR.RECHTMA_REF_DVPROGF.TRG;
@&SQL_TRIGGER_DIR.RECHTMA_REF_SONDERFALL.TRG;
@&SQL_TRIGGER_DIR.SCHL_BEARB_DB_FUNKTION.TRG;
@&SQL_TRIGGER_DIR.SCHL_BEARB_STEUERUNG.TRG;
@&SQL_TRIGGER_DIR.SCHL_BEARB_VORGANG.TRG;
@&SQL_TRIGGER_DIR.SCHL_BEARBLIST_STATUS.TRG;
@&SQL_TRIGGER_DIR.SCHL_DATENBANK.TRG;
@&SQL_TRIGGER_DIR.SCHL_DRUCKER.TRG;
@&SQL_TRIGGER_DIR.SCHL_DV_PROG_FUNKTION.TRG;
@&SQL_TRIGGER_DIR.SCHL_DV_UVERFAHREN.TRG;
@&SQL_TRIGGER_DIR.SCHL_DV_VERF_BEREICH.TRG;
@&SQL_TRIGGER_DIR.SCHL_HIERARCHIE.TRG;
@&SQL_TRIGGER_DIR.SCHL_ORGEINHEIT.TRG;
@&SQL_TRIGGER_DIR.SCHL_SONDERFALL.TRG;
@&SQL_TRIGGER_DIR.SCHL_TELEKRED_STATUS.TRG;
@&SQL_TRIGGER_DIR.SCHL_WAEHRUNG.TRG;
@&SQL_TRIGGER_DIR.TKR_ZEILE.TRG;

-------------------------------------------------------------------------------
-- Datenbanktabellen füllen
-------------------------------------------------------------------------------
@&SQL_SCRIPT_DIR.DB_INS01.SQL

-------------------------------------------------------------------------------
-- Commit ausführen
-------------------------------------------------------------------------------
Commit;