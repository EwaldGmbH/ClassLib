/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  DB_DRP01.SQL                                       **/
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
/**   Funktion .......:  Datenbanktabellen (und zugehörige Objekte) für     **/
/**                      die Klassenbibliotheken (ohne Wordschnittstelle)   **/
/**                      entfernen.                                         **/
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
-------------------------------------------------------------------------------
--
--   Foreign Key Constraints löschen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Alter Table
  MITARBEITER
Drop Constraint
  MITARBEITER_FK1;

Alter Table
  MITARBEITER
Drop Constraint
  MITARBEITER_FK2;

Alter Table
  MITARBEITER
Drop Constraint
  MITARBEITER_FK3;

Alter Table
  MITARBEITER
Drop Constraint
  MITARBEITER_FK4;

Alter Table
  PROTOKOLL_REF
Drop Constraint
  PROTOKOLL_REF_FK1;

Alter Table
  PROTOKOLL_WERT
Drop Constraint
  PROTOKOLL_WERT_FK1;

Alter Table
  PROTOKOLL_ZEILE
Drop Constraint
  PROTOKOLL_ZEILE_FK1;

Alter Table
  SCHL_DV_PROG_FUNKTION
Drop Constraint
  SCHL_DV_PROG_FUNKTION_FK1;

Alter Table
  SCHL_DV_UVERFAHREN
Drop Constraint
  SCHL_DV_UVERFAHREN_FK1;

Alter Table
  SCHL_ORGEINHEIT
Drop Constraint
  SCHL_ORGEINHEIT_FK1;

Alter Table
  SCHL_ORGEINHEIT
Drop Constraint
  SCHL_ORGEINHEIT_FK2;

Alter Table
  SCHL_ORGEINHEIT
Drop Constraint
  SCHL_ORGEINHEIT_FK3;

Alter Table
  SCHL_ORGEINHEIT
Drop Constraint
  SCHL_ORGEINHEIT_FK4;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--   Tabellen löschen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Drop Table BATCH_UEBERWACHUNG;
Drop Table BEARBLIST_REF;
Drop Table BEARBEITUNG_LISTE;
Drop Table BEARBVORG_REF_BEARBVORG;
Drop Table DOKUMENT;
Drop Table DV_NUTZER;
Drop Table DV_PROG_MELDUNG;
Drop Table DV_PROG_PARAM;
Drop Table DV_PROG_PARAM_WERT;
Drop Table DV_PROG_VORGANG;
Drop Table DV_PROG_VORGANG_PARAM;
Drop Table DVPROGV_REF_DOK;
Drop Table DVPROGV_REF_PROTK;
Drop Table EURO;
Drop Table MITARBEITER;
Drop Table PROTOKOLL_KOPF;
Drop Table PROTOKOLL_REF;
Drop Table PROTOKOLL_WERT;
Drop Table PROTOKOLL_ZEILE;
Drop Table RECHT_GRUPPE;
Drop Table RECHT_MASTER;
Drop Table RECHTGR_REF_DVNUTZER;
Drop Table RECHTGR_REF_DVPROGF;
Drop Table RECHTGR_REF_SONDERFALL;
Drop Table RECHTMA_REF_DVNUTZER;
Drop Table RECHTMA_REF_DVPROGF;
Drop Table RECHTMA_REF_SONDERFALL;
Drop Table SCHL_BEARB_DB_FUNKTION;
Drop Table SCHL_BEARB_STEUERUNG;
Drop Table SCHL_BEARB_VORGANG;
Drop Table SCHL_BEARBLIST_STATUS;
Drop Table SCHL_DATENBANK;
Drop Table SCHL_DRUCKER;
Drop Table SCHL_DV_PROG_FUNKTION;
Drop Table SCHL_DV_UVERFAHREN;
Drop Table SCHL_DV_VERF_BEREICH;
Drop Table SCHL_HIERARCHIE;
Drop Table SCHL_ORGEINHEIT;
Drop Table SCHL_SONDERFALL;
Drop Table SCHL_TELEKRED_STATUS;
Drop Table SCHL_WAEHRUNG;
Drop Table TKR_ZEILE;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--   Sequencen löschen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Drop Sequence BATCH_UEBERWACHUNG_SEQ;
Drop Sequence BEARBLIST_REF_SEQ;
Drop Sequence BEARBEITUNG_LISTE_SEQ;
Drop Sequence BEARBVORG_REF_BEARBVORG_SEQ;
Drop Sequence DOKUMENT_SEQ;
Drop Sequence DV_NUTZER_SEQ;
Drop Sequence DV_PROG_MELDUNG_SEQ;
Drop Sequence DV_PROG_PARAM_SEQ;
Drop Sequence DV_PROG_PARAM_WERT_SEQ;
Drop Sequence DV_PROG_VORGANG_SEQ;
Drop Sequence DV_PROG_VORGANG_PARAM_SEQ;
Drop Sequence DVPROGV_REF_DOK_SEQ;
Drop Sequence DVPROGV_REF_PROTK_SEQ;
Drop Sequence MITARBEITER_SEQ;
Drop Sequence PROTOKOLL_KOPF_SEQ;
Drop Sequence PROTOKOLL_REF_SEQ;
Drop Sequence PROTOKOLL_WERT_SEQ;
Drop Sequence PROTOKOLL_ZEILE_SEQ;
Drop Sequence RECHT_GRUPPE_SEQ;
Drop Sequence RECHT_MASTER_SEQ;
Drop Sequence RECHTGR_REF_DVNUTZER_SEQ;
Drop Sequence RECHTGR_REF_DVPROGF_SEQ;
Drop Sequence RECHTGR_REF_SONDERFALL_SEQ;
Drop Sequence RECHTMA_REF_DVNUTZER_SEQ;
Drop Sequence RECHTMA_REF_DVPROGF_SEQ;
Drop Sequence RECHTMA_REF_SONDERFALL_SEQ;
Drop Sequence SCHL_BEARB_DB_FUNKTION_SEQ;
Drop Sequence SCHL_BEARB_STEUERUNG_SEQ;
Drop Sequence SCHL_BEARB_VORGANG_SEQ;
Drop Sequence SCHL_BEARBLIST_STATUS_SEQ;
Drop Sequence SCHL_DATENBANK_SEQ;
Drop Sequence SCHL_DRUCKER_SEQ;
Drop Sequence SCHL_DV_PROG_FUNKTION_SEQ;
Drop Sequence SCHL_DV_UVERFAHREN_SEQ;
Drop Sequence SCHL_DV_VERF_BEREICH_SEQ;
Drop Sequence SCHL_HIERARCHIE_SEQ;
Drop Sequence SCHL_ORGEINHEIT_SEQ;
Drop Sequence SCHL_SONDERFALL_SEQ;
Drop Sequence SCHL_TELEKRED_STATUS_SEQ;
Drop Sequence SCHL_WAEHRUNG_SEQ;
Drop Sequence TKR_ZEILE_SEQ;
