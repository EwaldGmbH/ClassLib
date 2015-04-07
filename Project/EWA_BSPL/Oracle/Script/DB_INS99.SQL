/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  DB_INS99.SQL                                       **/
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
/**   Funktion .......:  Datenbanktabellen für die Beispielapplikation      **/
/**                      BSPIEL01.APP füllen                                **/
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
--   Tabellen füllen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ============================================================
--   Table: SCHL_BEARB_STEUERUNG
-- ============================================================
Insert Into
  SCHL_BEARB_STEUERUNG
(
  BEARBSTEU_BEZ,
  BEARBSTEU_KURZ,
  BEARBSTEU_SEQ,
  BEARBSTEU_TYP
)
Select
  'Start des Bearbeitungsvorgangs',
  'Start des Bearbeitungsvorgangs',
  SCHL_BEARB_STEUERUNG_SEQ.Nextval,
  0001
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_STEUERUNG
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 0001
  );
Insert Into
  SCHL_BEARB_STEUERUNG
(
  BEARBSTEU_BEZ,
  BEARBSTEU_KURZ,
  BEARBSTEU_SEQ,
  BEARBSTEU_TYP
)
Select
  'Annehmen des Bearbeitungsvorgangs',
  'Annehmen des Bearbeitungsvorgangs',
  SCHL_BEARB_STEUERUNG_SEQ.Nextval,
  0002
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_STEUERUNG
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 0002
  );
Insert Into
  SCHL_BEARB_STEUERUNG
(
  BEARBSTEU_BEZ,
  BEARBSTEU_KURZ,
  BEARBSTEU_SEQ,
  BEARBSTEU_TYP
)
Select
  'Ablehnen des Bearbeitungsvorgangs',
  'Ablehnen des Bearbeitungsvorgangs',
  SCHL_BEARB_STEUERUNG_SEQ.Nextval,
  0003
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_STEUERUNG
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 0003
  );
-- ============================================================
--   Table: SCHL_BEARBLIST_STATUS
-- ============================================================
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Hinweis',
  'Hinweis',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0001
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0001
  );
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Ersterfasster Antrag',
  'Ersterfasster Antrag',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0002
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0002
  );
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Freigegeben zur Prüfung',
  'Freigegeben zur Prüfung',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0003
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0003
  );
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Abgelehnt durch Prüfer',
  'Abgelehnt durch Prüfer',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0004
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0004
  );
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Eintrag in Bearbeitung',
  'Eintrag in Bearbeitung',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0005
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0005
  );
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Dokumente werden in <WinWord> erzeugt',
  'Dokumente werden in <WinWord> erzeugt',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0091
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0091
  );
Insert Into
  SCHL_BEARBLIST_STATUS
(
  BEARBSTAT_BEZ,
  BEARBSTAT_KURZ,
  BEARBSTAT_SEQ,
  BEARBSTAT_TYP
)
Select
  'Dokumente werden in <WinWord> bearbeitet',
  'Dokumente werden in <WinWord> bearbeitet',
  SCHL_BEARBLIST_STATUS_SEQ.Nextval,
  0092
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARBLIST_STATUS
    Where
      SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 0092
  );
-- ============================================================
--   Table: SCHL_DV_PROG_FUNKTION
-- ============================================================
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Bearbeitungsliste suchen uns auswählen',
  'Bearbeitungsliste suchen uns auswählen',
  'tblBEARBL01_Bearbeitungliste',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblBEARBL01_Bearbeitungliste'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Anschriftart suchen und auswählen',
  'Anschriftart suchen und auswählen',
  'tblBSPIEL01_SchlAnschriftArtBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblBSPIEL01_SchlAnschriftArtBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Anschriftart erfassen und bearbeiten',
  'Anschriftart erfassen und bearbeiten',
  'frmBSPIEL01_SchlAnschriftArtBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlAnschriftArtBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Konto suchen und auswählen',
  'Konto suchen und auswählen',
  'tblBSPIEL01_KontoBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblBSPIEL01_KontoBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Konto erfassen und bearbeiten',
  'Konto erfassen und bearbeiten',
  'frmBSPIEL01_KontoBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_KontoBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Organisation suchen und auswählen',
  'Organisation suchen und auswählen',
  'tblBSPIEL01_OrganisationBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblBSPIEL01_OrganisationBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Organisation erfassen und bearbeiten',
  'Organisation erfassen und bearbeiten',
  'frmBSPIEL01_OrganisationBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_OrganisationBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Organisationsart suchen und auswählen',
  'Organisationsart suchen und auswählen',
  'tblBSPIEL01_SchlOrgartBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblBSPIEL01_SchlOrgartBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Organisationsart erfassen und bearbeiten',
  'Organisationsart erfassen und bearbeiten',
  'frmBSPIEL01_SchlOrgartBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlOrgartBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Person suchen und auswählen',
  'Person suchen und auswählen',
  'tblBSPIEL01_PersonBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblBSPIEL01_PersonBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Person erfassen und bearbeiten',
  'Person erfassen und bearbeiten',
  'frmBSPIEL01_PersonBsp',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_PersonBsp'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'DV-Meldung suchen und auswählen',
  'DV-Meldung suchen und auswählen',
  'tblDVMELD01_DvProgMeldung',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblDVMELD01_DvProgMeldung'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'DV-Meldung erfassen und bearbeiten',
  'DV-Meldung erfassen und bearbeiten',
  'frmDVMELD01_DvProgMeldung',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmDVMELD01_DvProgMeldung'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Mitarbeiter suchen und auswählen',
  'Mitarbeiter suchen und auswählen',
  'tblMITARB01_Mitarbeiter',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblMITARB01_Mitarbeiter'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Mitarbeiter erfassen und bearbeiten',
  'Mitarbeiter erfassen und bearbeiten',
  'frmMITARB01_Mitarbeiter',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmMITARB01_Mitarbeiter'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Protokoll suchen und auswählen',
  'Protokoll suchen und auswählen',
  'tblPROTOK01_Protokoll',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblPROTOK01_Protokoll'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Rechtegruppe suchen und auswählen',
  'Rechtegruppe suchen und auswählen',
  'tblRECHTE06_RechtGruppe',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblRECHTE06_RechtGruppe'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Rechtegruppe erfassen und bearbeiten',
  'Rechtegruppe erfassen und bearbeiten',
  'frmRECHTE06_RechtGruppe',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmRECHTE06_RechtGruppe'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Bearbeitungsvorgang suchen und auswählen',
  'Bearbeitungsvorgang suchen und auswähl.',
  'tblSLBEARBV_SchlBearbVorgang',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'tblSLBEARBV_SchlBearbVorgang'
  );
Insert Into
  SCHL_DV_PROG_FUNKTION
(
  DVPROGF_BEZ,
  DVPROGF_KURZ,
  DVPROGF_NAME,
  DVPROGF_SEQ
)
Select
  'Bearbeitungsvorgang erfassen und bearbeiten',
  'Bearbeitungsvorgang erfassen und bearb.',
  'frmSLBEARBV_SchlBearbVorgang',
  SCHL_DV_PROG_FUNKTION_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_DV_PROG_FUNKTION
    Where
      SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmSLBEARBV_SchlBearbVorgang'
  );
-- ============================================================
--   Table: SCHL_HIERARCHIE
-- ============================================================
Insert Into
  SCHL_HIERARCHIE
(
  HIERARCH_BEZ,
  HIERARCH_KURZ,
  HIERARCH_SEQ,
  HIERARCHIE
)
Select
  'Unternehmen',
  'Unternehmen',
  SCHL_HIERARCHIE_SEQ.Nextval,
  1
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 1
  );
Insert Into
  SCHL_HIERARCHIE
(
  HIERARCH_BEZ,
  HIERARCH_KURZ,
  HIERARCH_SEQ,
  HIERARCHIE
)
Select
  'Unternehmensführung',
  'Unternehmensführung',
  SCHL_HIERARCHIE_SEQ.Nextval,
  2
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 2
  );
Insert Into
  SCHL_HIERARCHIE
(
  HIERARCH_BEZ,
  HIERARCH_KURZ,
  HIERARCH_SEQ,
  HIERARCHIE
)
Select
  'Abteilung',
  'Abteilung',
  SCHL_HIERARCHIE_SEQ.Nextval,
  3
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 3
  );
Insert Into
  SCHL_HIERARCHIE
(
  HIERARCH_BEZ,
  HIERARCH_KURZ,
  HIERARCH_SEQ,
  HIERARCHIE
)
Select
  'Team',
  'Team',
  SCHL_HIERARCHIE_SEQ.Nextval,
  4
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  );
-- ============================================================
--   Table: SCHL_ORGEINHEIT
-- ============================================================
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 1
  ),
  'U1',
  'Testunternehmen',
  'Testunternehmen',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  Null
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'U1'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 2
  ),
  'F1',
  'Unternehmensführung 1',
  'Unternehmensführung 1',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'U1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'F1'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 3
  ),
  'A1',
  'Abteilung 1',
  'Abteilung 1',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'F1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A1'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 3
  ),
  'A2',
  'Abteilung 2',
  'Abteilung 2',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'F1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A2'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 3
  ),
  'A3',
  'Abteilung 3',
  'Abteilung 3',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'F1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A3'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  ),
  'T1',
  'Team 1',
  'Team 1',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T1'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  ),
  'T2',
  'Team 2',
  'Team 2',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T2'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  ),
  'T3',
  'Team 3',
  'Team 3',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T3'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  ),
  'T4',
  'Team 4',
  'Team 4',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A2'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T4'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  ),
  'T5',
  'Team 5',
  'Team 5',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A3'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T5'
  );
Insert Into
  SCHL_ORGEINHEIT
(
  HIERARCH_SEQ,
  ORGEINHEIT_ALT,
  ORGEINHEIT_BEZ,
  ORGEINHEIT_KURZ,
  ORGEINHEIT_SEQ,
  ORGEINHEIT_SEQ_V
)
Select
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 4
  ),
  'T6',
  'Team 6',
  'Team 6',
  SCHL_ORGEINHEIT_SEQ.Nextval,
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A3'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T6'
  );
-- ============================================================
--   Table: MITARBEITER
-- ============================================================
Insert Into
  MITARBEITER
(
  BRIEFZEICHEN_SB,
  MITARB_KURZ,
  MITARB_SEQ,
  NETZ_LOGINNAME,
  ORGEINHEIT_SEQ
)
Select
  'AD_U1',
  'Anwender aus U1 für Administration',
  MITARBEITER_SEQ.Nextval,
  'ADMI_U1',
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'U1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      MITARBEITER
    Where
      MITARBEITER.NETZ_LOGINNAME = 'ADMI_U1'
  );
Insert Into
  MITARBEITER
(
  BRIEFZEICHEN_SB,
  MITARB_KURZ,
  MITARB_SEQ,
  NETZ_LOGINNAME,
  ORGEINHEIT_SEQ
)
Select
  'AE_A2',
  'Anwender aus A2 mit änderndem Zugriff',
  MITARBEITER_SEQ.Nextval,
  'AEND_A2',
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A2'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      MITARBEITER
    Where
      MITARBEITER.NETZ_LOGINNAME = 'AEND_A2'
  );
Insert Into
  MITARBEITER
(
  BRIEFZEICHEN_SB,
  MITARB_KURZ,
  MITARB_SEQ,
  NETZ_LOGINNAME,
  ORGEINHEIT_SEQ
)
Select
  'AE_A3',
  'Anwender aus A3 mit änderndem Zugriff',
  MITARBEITER_SEQ.Nextval,
  'AEND_A3',
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'A3'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      MITARBEITER
    Where
      MITARBEITER.NETZ_LOGINNAME = 'AEND_A3'
  );
Insert Into
  MITARBEITER
(
  BRIEFZEICHEN_SB,
  MITARB_KURZ,
  MITARB_SEQ,
  NETZ_LOGINNAME,
  ORGEINHEIT_SEQ
)
Select
  'LE_T1',
  'Anwender aus T1 mit lesendem Zugriff',
  MITARBEITER_SEQ.Nextval,
  'LESE_T1',
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'T1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      MITARBEITER
    Where
      MITARBEITER.NETZ_LOGINNAME = 'LESE_T1'
  );
Insert Into
  MITARBEITER
(
  BRIEFZEICHEN_SB,
  MITARB_KURZ,
  MITARB_SEQ,
  NETZ_LOGINNAME,
  ORGEINHEIT_SEQ
)
Select
  'VO_F1',
  'Anwender aus F1 mit vollem Zugriff',
  MITARBEITER_SEQ.Nextval,
  'VOLL_F1',
  (
    Select
      SCHL_ORGEINHEIT.ORGEINHEIT_SEQ
    From
      SCHL_ORGEINHEIT
    Where
      SCHL_ORGEINHEIT.ORGEINHEIT_ALT = 'F1'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      MITARBEITER
    Where
      MITARBEITER.NETZ_LOGINNAME = 'VOLL_F1'
  );
-- ============================================================
--   Table: DV_NUTZER
-- ============================================================
Insert Into
  DV_NUTZER
(
  DVNUTZER_KURZ,
  DVNUTZER_NAME,
  DVNUTZER_SEQ,
  ORGEINHEIT_SEQ
)
Select
  MITARBEITER.MITARB_KURZ,
  MITARBEITER.NETZ_LOGINNAME,
  DV_NUTZER_SEQ.Nextval,
  MITARBEITER.ORGEINHEIT_SEQ
From
  MITARBEITER
Where
  Not Exists
  (
    Select
      1
    From
      DV_NUTZER
    Where
      DV_NUTZER.DVNUTZER_NAME =
      MITARBEITER.NETZ_LOGINNAME
  );
-- ============================================================
--   Table: RECHT_MASTER
-- ============================================================
Insert Into
  RECHT_MASTER
(
  RECHTMA_BEZ,
  RECHTMA_KURZ,
  RECHTMA_SEQ
)
Select
  'Rechtemaster BSPIEL01',
  'Rechtemaster BSPIEL01',
  RECHT_MASTER_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      RECHT_MASTER
    Where
      RECHT_MASTER.RECHTMA_KURZ = 'Rechtemaster BSPIEL01'
  );
-- ============================================================
--   Table: RECHTMA_REF_DVNUTZER
-- ============================================================
Insert Into
  RECHTMA_REF_DVNUTZER
(
  DVNUTZER_SEQ,
  RECHTMA_SEQ,
  REMARDVN_SEQ
)
Select
  DV_NUTZER.DVNUTZER_SEQ,
  RECHT_MASTER.RECHTMA_SEQ,
  RECHTMA_REF_DVNUTZER_SEQ.Nextval
From
  DV_NUTZER,
  RECHT_MASTER
Where
  DV_NUTZER.DVNUTZER_NAME Like 'ADMI%' And
  RECHT_MASTER.RECHTMA_KURZ = 'Rechtemaster BSPIEL01' And
  Not Exists
  (
    Select
      1
    From
      RECHTMA_REF_DVNUTZER
      Inner Join DV_NUTZER DV_NUTZER_2 On
      (
        RECHTMA_REF_DVNUTZER.DVNUTZER_SEQ =
        DV_NUTZER_2.DVNUTZER_SEQ
      )
      Inner Join RECHT_MASTER RECHT_MASTER_2 On
      (
        RECHTMA_REF_DVNUTZER.RECHTMA_SEQ =
        RECHT_MASTER_2.RECHTMA_SEQ
      )
    Where
      DV_NUTZER_2.DVNUTZER_SEQ =
      DV_NUTZER.DVNUTZER_SEQ And
      RECHT_MASTER_2.RECHTMA_SEQ =
      RECHT_MASTER.RECHTMA_SEQ
  );
-- ============================================================
--   Table: RECHTMA_REF_DVPROGF
-- ============================================================
Insert Into
  RECHTMA_REF_DVPROGF
(
  DVPROGF_SEQ,
  RECHTMA_SEQ,
  REMARDVPF_SEQ
)
Select
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ,
  RECHT_MASTER.RECHTMA_SEQ,
  RECHTMA_REF_DVPROGF_SEQ.Nextval
From
  RECHT_MASTER,
  SCHL_DV_PROG_FUNKTION
Where
  RECHT_MASTER.RECHTMA_KURZ Like '%BSPIEL01%' And
  (
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%BEARBL01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%BSPIEL01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%DVMELD01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%MITARB01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%PROTOK01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%RECHTE06%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%SLBEARBV%'
  ) And
  Not Exists
  (
    Select
      1
    From
      RECHTMA_REF_DVPROGF
      Inner Join RECHT_MASTER RECHT_MASTER_2 On
      (
        RECHTMA_REF_DVPROGF.RECHTMA_SEQ =
        RECHT_MASTER_2.RECHTMA_SEQ
      )
      Inner Join SCHL_DV_PROG_FUNKTION SCHL_DV_PROG_FUNKTION_2 On
      (
        RECHTMA_REF_DVPROGF.DVPROGF_SEQ =
        SCHL_DV_PROG_FUNKTION_2.DVPROGF_SEQ
      )
    Where
      RECHT_MASTER_2.RECHTMA_SEQ =
      RECHT_MASTER.RECHTMA_SEQ And
      SCHL_DV_PROG_FUNKTION_2.DVPROGF_SEQ =
      SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
  );
-- ============================================================
--   Table: RECHT_GRUPPE
-- ============================================================
Insert Into
  RECHT_GRUPPE
(
  DVPROGF_JN,
  HIERARCH_SEQ,
  RECHTGR_BEZ,
  RECHTGR_KURZ,
  RECHTGR_RECHT,
  RECHTGR_SEQ,
  RECHTMA_SEQ
)
Select
  1,
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 1
  ),
  'Rechtegruppe Administration BSPIEL01',
  'Rechtegruppe Administration BSPIEL01',
  'DISU',
  RECHT_GRUPPE_SEQ.Nextval,
  (
    Select
      RECHT_MASTER.RECHTMA_SEQ
    From
      RECHT_MASTER
    Where
      RECHT_MASTER.RECHTMA_KURZ = 'Rechtemaster BSPIEL01'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      RECHT_GRUPPE
    Where
      RECHT_GRUPPE.RECHTGR_KURZ = 'Rechtegruppe Administration BSPIEL01'
  );
Insert Into
  RECHT_GRUPPE
(
  DVPROGF_JN,
  HIERARCH_SEQ,
  RECHTGR_BEZ,
  RECHTGR_KURZ,
  RECHTGR_RECHT,
  RECHTGR_SEQ,
  RECHTMA_SEQ
)
Select
  1,
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 1
  ),
  'Rechtegruppe Ändern BSPIEL01',
  'Rechtegruppe Ändern BSPIEL01',
  'ISU',
  RECHT_GRUPPE_SEQ.Nextval,
  (
    Select
      RECHT_MASTER.RECHTMA_SEQ
    From
      RECHT_MASTER
    Where
      RECHT_MASTER.RECHTMA_KURZ = 'Rechtemaster BSPIEL01'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      RECHT_GRUPPE
    Where
      RECHT_GRUPPE.RECHTGR_KURZ = 'Rechtegruppe Ändern BSPIEL01'
  );
Insert Into
  RECHT_GRUPPE
(
  DVPROGF_JN,
  HIERARCH_SEQ,
  RECHTGR_BEZ,
  RECHTGR_KURZ,
  RECHTGR_RECHT,
  RECHTGR_SEQ,
  RECHTMA_SEQ
)
Select
  1,
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 1
  ),
  'Rechtegruppe Lesen BSPIEL01',
  'Rechtegruppe Lesen BSPIEL01',
  'S',
  RECHT_GRUPPE_SEQ.Nextval,
  (
    Select
      RECHT_MASTER.RECHTMA_SEQ
    From
      RECHT_MASTER
    Where
      RECHT_MASTER.RECHTMA_KURZ = 'Rechtemaster BSPIEL01'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      RECHT_GRUPPE
    Where
      RECHT_GRUPPE.RECHTGR_KURZ = 'Rechtegruppe Lesen BSPIEL01'
  );
Insert Into
  RECHT_GRUPPE
(
  DVPROGF_JN,
  HIERARCH_SEQ,
  RECHTGR_BEZ,
  RECHTGR_KURZ,
  RECHTGR_RECHT,
  RECHTGR_SEQ,
  RECHTMA_SEQ
)
Select
  1,
  (
    Select
      SCHL_HIERARCHIE.HIERARCH_SEQ
    From
      SCHL_HIERARCHIE
    Where
      SCHL_HIERARCHIE.HIERARCHIE = 1
  ),
  'Rechtegruppe Vollzugriff BSPIEL01',
  'Rechtegruppe Vollzugriff BSPIEL01',
  'DISU',
  RECHT_GRUPPE_SEQ.Nextval,
  (
    Select
      RECHT_MASTER.RECHTMA_SEQ
    From
      RECHT_MASTER
    Where
      RECHT_MASTER.RECHTMA_KURZ = 'Rechtemaster BSPIEL01'
  )
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      RECHT_GRUPPE
    Where
      RECHT_GRUPPE.RECHTGR_KURZ = 'Rechtegruppe Vollzugriff BSPIEL01'
  );
-- ============================================================
--   Table: RECHTGR_REF_DVNUTZER
-- ============================================================
Insert Into
  RECHTGR_REF_DVNUTZER
(
  DVNUTZER_SEQ,
  RECHTGR_SEQ,
  REGRRDVN_SEQ
)
Select
  DV_NUTZER.DVNUTZER_SEQ,
  RECHT_GRUPPE.RECHTGR_SEQ,
  RECHTGR_REF_DVNUTZER_SEQ.Nextval
From
  DV_NUTZER,
  RECHT_GRUPPE
Where
  DV_NUTZER.DVNUTZER_NAME Like 'ADMI%' And
  RECHT_GRUPPE.RECHTGR_KURZ Like '%Administration%' And
  Not Exists
  (
    Select
      1
    From
      RECHTGR_REF_DVNUTZER
      Inner Join DV_NUTZER DV_NUTZER_2 On
      (
        RECHTGR_REF_DVNUTZER.DVNUTZER_SEQ =
        DV_NUTZER_2.DVNUTZER_SEQ
      )
      Inner Join RECHT_GRUPPE RECHT_GRUPPE_2 On
      (
        RECHTGR_REF_DVNUTZER.RECHTGR_SEQ =
        RECHT_GRUPPE_2.RECHTGR_SEQ
      )
    Where
      DV_NUTZER_2.DVNUTZER_SEQ =
      DV_NUTZER.DVNUTZER_SEQ And
      RECHT_GRUPPE_2.RECHTGR_SEQ =
      RECHT_GRUPPE.RECHTGR_SEQ
  );
Insert Into
  RECHTGR_REF_DVNUTZER
(
  DVNUTZER_SEQ,
  RECHTGR_SEQ,
  REGRRDVN_SEQ
)
Select
  DV_NUTZER.DVNUTZER_SEQ,
  RECHT_GRUPPE.RECHTGR_SEQ,
  RECHTGR_REF_DVNUTZER_SEQ.Nextval
From
  DV_NUTZER,
  RECHT_GRUPPE
Where
  DV_NUTZER.DVNUTZER_NAME Like 'AEND%' And
  RECHT_GRUPPE.RECHTGR_KURZ Like '%Ändern%' And
  Not Exists
  (
    Select
      1
    From
      RECHTGR_REF_DVNUTZER
      Inner Join DV_NUTZER DV_NUTZER_2 On
      (
        RECHTGR_REF_DVNUTZER.DVNUTZER_SEQ =
        DV_NUTZER_2.DVNUTZER_SEQ
      )
      Inner Join RECHT_GRUPPE RECHT_GRUPPE_2 On
      (
        RECHTGR_REF_DVNUTZER.RECHTGR_SEQ =
        RECHT_GRUPPE_2.RECHTGR_SEQ
      )
    Where
      DV_NUTZER_2.DVNUTZER_SEQ =
      DV_NUTZER.DVNUTZER_SEQ And
      RECHT_GRUPPE_2.RECHTGR_SEQ =
      RECHT_GRUPPE.RECHTGR_SEQ
  );
Insert Into
  RECHTGR_REF_DVNUTZER
(
  DVNUTZER_SEQ,
  RECHTGR_SEQ,
  REGRRDVN_SEQ
)
Select
  DV_NUTZER.DVNUTZER_SEQ,
  RECHT_GRUPPE.RECHTGR_SEQ,
  RECHTGR_REF_DVNUTZER_SEQ.Nextval
From
  DV_NUTZER,
  RECHT_GRUPPE
Where
  DV_NUTZER.DVNUTZER_NAME Like 'LESE%' And
  RECHT_GRUPPE.RECHTGR_KURZ Like '%Lesen%' And
  Not Exists
  (
    Select
      1
    From
      RECHTGR_REF_DVNUTZER
      Inner Join DV_NUTZER DV_NUTZER_2 On
      (
        RECHTGR_REF_DVNUTZER.DVNUTZER_SEQ =
        DV_NUTZER_2.DVNUTZER_SEQ
      )
      Inner Join RECHT_GRUPPE RECHT_GRUPPE_2 On
      (
        RECHTGR_REF_DVNUTZER.RECHTGR_SEQ =
        RECHT_GRUPPE_2.RECHTGR_SEQ
      )
    Where
      DV_NUTZER_2.DVNUTZER_SEQ =
      DV_NUTZER.DVNUTZER_SEQ And
      RECHT_GRUPPE_2.RECHTGR_SEQ =
      RECHT_GRUPPE.RECHTGR_SEQ
  );
Insert Into
  RECHTGR_REF_DVNUTZER
(
  DVNUTZER_SEQ,
  RECHTGR_SEQ,
  REGRRDVN_SEQ
)
Select
  DV_NUTZER.DVNUTZER_SEQ,
  RECHT_GRUPPE.RECHTGR_SEQ,
  RECHTGR_REF_DVNUTZER_SEQ.Nextval
From
  DV_NUTZER,
  RECHT_GRUPPE
Where
  DV_NUTZER.DVNUTZER_NAME Like 'VOLL%' And
  RECHT_GRUPPE.RECHTGR_KURZ Like '%Vollzugriff%' And
  Not Exists
  (
    Select
      1
    From
      RECHTGR_REF_DVNUTZER
      Inner Join DV_NUTZER DV_NUTZER_2 On
      (
        RECHTGR_REF_DVNUTZER.DVNUTZER_SEQ =
        DV_NUTZER_2.DVNUTZER_SEQ
      )
      Inner Join RECHT_GRUPPE RECHT_GRUPPE_2 On
      (
        RECHTGR_REF_DVNUTZER.RECHTGR_SEQ =
        RECHT_GRUPPE_2.RECHTGR_SEQ
      )
    Where
      DV_NUTZER_2.DVNUTZER_SEQ =
      DV_NUTZER.DVNUTZER_SEQ And
      RECHT_GRUPPE_2.RECHTGR_SEQ =
      RECHT_GRUPPE.RECHTGR_SEQ
  );
-- ============================================================
--   Table: RECHTGR_REF_DVPROGF
-- ============================================================
Insert Into
  RECHTGR_REF_DVPROGF
(
  DVPROGF_SEQ,
  RECHTGR_SEQ,
  REGRRDVPF_SEQ
)
Select
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ,
  RECHT_GRUPPE.RECHTGR_SEQ,
  RECHTGR_REF_DVPROGF_SEQ.Nextval
From
  RECHT_GRUPPE,
  SCHL_DV_PROG_FUNKTION
Where
  RECHT_GRUPPE.RECHTGR_KURZ Like '%BSPIEL01%' And
  RECHT_GRUPPE.RECHTGR_KURZ Like '%Administration%' And
  (
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%RECHTE06%'
  ) And
  Not Exists
  (
    Select
      1
    From
      RECHTGR_REF_DVPROGF
      Inner Join RECHT_GRUPPE RECHT_GRUPPE_2 On
      (
        RECHTGR_REF_DVPROGF.RECHTGR_SEQ =
        RECHT_GRUPPE_2.RECHTGR_SEQ
      )
      Inner Join SCHL_DV_PROG_FUNKTION SCHL_DV_PROG_FUNKTION_2 On
      (
        RECHTGR_REF_DVPROGF.DVPROGF_SEQ =
        SCHL_DV_PROG_FUNKTION_2.DVPROGF_SEQ
      )
    Where
      RECHT_GRUPPE_2.RECHTGR_SEQ =
      RECHT_GRUPPE.RECHTGR_SEQ And
      SCHL_DV_PROG_FUNKTION_2.DVPROGF_SEQ =
      SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
  );
Insert Into
  RECHTGR_REF_DVPROGF
(
  DVPROGF_SEQ,
  RECHTGR_SEQ,
  REGRRDVPF_SEQ
)
Select
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ,
  RECHT_GRUPPE.RECHTGR_SEQ,
  RECHTGR_REF_DVPROGF_SEQ.Nextval
From
  RECHT_GRUPPE,
  SCHL_DV_PROG_FUNKTION
Where
  RECHT_GRUPPE.RECHTGR_KURZ Like '%BSPIEL01%' And
  RECHT_GRUPPE.RECHTGR_KURZ Not Like '%Administration%' And
  (
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%BEARBL01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%BSPIEL01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%DVMELD01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%MITARB01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%PROTOK01%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%RECHTE06%' Or
    SCHL_DV_PROG_FUNKTION.DVPROGF_NAME Like '%SLBEARBV%'
  ) And
  Not Exists
  (
    Select
      1
    From
      RECHTGR_REF_DVPROGF
      Inner Join RECHT_GRUPPE RECHT_GRUPPE_2 On
      (
        RECHTGR_REF_DVPROGF.RECHTGR_SEQ =
        RECHT_GRUPPE_2.RECHTGR_SEQ
      )
      Inner Join SCHL_DV_PROG_FUNKTION SCHL_DV_PROG_FUNKTION_2 On
      (
        RECHTGR_REF_DVPROGF.DVPROGF_SEQ =
        SCHL_DV_PROG_FUNKTION_2.DVPROGF_SEQ
      )
    Where
      RECHT_GRUPPE_2.RECHTGR_SEQ =
      RECHT_GRUPPE.RECHTGR_SEQ And
      SCHL_DV_PROG_FUNKTION_2.DVPROGF_SEQ =
      SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
  );
-- ============================================================
--   Table: SCHL_BEARB_VORGANG
-- ============================================================
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP
)
Select
  'Ende der Bearbeitungsliste',
  'Ende der Bearbeitungsliste',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0000
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0000
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  'Anschriftart erfassen und bearbeiten',
  'Anschriftart erfassen und bearbeiten',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0010 + 00,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlAnschriftArtBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0010 + 00
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Anschriftart korrigieren',
  'Anschriftart korrigieren',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0010 + 01,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 4 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlAnschriftArtBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0010 + 01
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Anschriftart prüfen',
  'Anschriftart prüfen',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0010 + 02,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 3 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlAnschriftArtBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0010 + 02
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  'Konto erfassen und bearbeiten',
  'Konto erfassen und bearbeiten',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0020 + 00,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_KontoBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0020 + 00
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Konto korrigieren',
  'Konto korrigieren',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0020 + 01,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 4 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_KontoBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0020 + 01
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Konto prüfen',
  'Konto prüfen',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0020 + 02,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 3 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_KontoBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0020 + 02
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  'Organisation erfassen und bearbeiten',
  'Organisation erfassen und bearbeiten',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0030 + 00,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_OrganisationBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0030 + 00
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Organisation korrigieren',
  'Organisation korrigieren',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0030 + 01,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 4 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_OrganisationBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0030 + 01
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Organisation prüfen',
  'Organisation prüfen',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0030 + 02,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 3 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_OrganisationBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0030 + 02
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  'Organisationsart erfassen und bearbeiten',
  'Organisationsart erfassen und bearbeiten',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0040 + 00,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlOrgartBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0040 + 00
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Organisationsart korrigieren',
  'Organisationsart korrigieren',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0040 + 01,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 4 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlOrgartBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0040 + 01
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Organisationsart prüfen',
  'Organisationsart prüfen',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0040 + 02,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 3 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_SchlOrgartBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0040 + 02
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  'Person erfassen und bearbeiten',
  'Person erfassen und bearbeiten',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0050 + 00,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_PersonBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0050 + 00
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Person korrigieren',
  'Person korrigieren',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0050 + 01,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 4 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_PersonBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0050 + 01
  );
Insert Into
  SCHL_BEARB_VORGANG
(
  BEARBSTAT_SEQ,
  BEARBVORG_BEZ,
  BEARBVORG_KURZ,
  BEARBVORG_SEQ,
  BEARBVORG_TYP,
  DVPROGF_SEQ
)
Select
  SCHL_BEARBLIST_STATUS.BEARBSTAT_SEQ,
  'Person prüfen',
  'Person prüfen',
  SCHL_BEARB_VORGANG_SEQ.Nextval,
  0050 + 02,
  SCHL_DV_PROG_FUNKTION.DVPROGF_SEQ
From
  SCHL_BEARBLIST_STATUS,
  SCHL_DV_PROG_FUNKTION
Where
  SCHL_BEARBLIST_STATUS.BEARBSTAT_TYP = 3 And
  SCHL_DV_PROG_FUNKTION.DVPROGF_NAME = 'frmBSPIEL01_PersonBsp' And
  Not Exists
  (
    Select
      1
    From
      SCHL_BEARB_VORGANG
    Where
      SCHL_BEARB_VORGANG.BEARBVORG_TYP = 0050 + 02
  );
-- ============================================================
--   Table: BEARBVORG_REF_BEARBVORG
-- ============================================================
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 00 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0010 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 00 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0010 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 01 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0010 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 01 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0010 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0010 + 01 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0010 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0010 + 01
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 00 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0020 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 00 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0020 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 01 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0020 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 01 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0020 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0020 + 01 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0020 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0020 + 01
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 00 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0030 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 00 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0030 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 01 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0030 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 01 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0030 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0030 + 01 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0030 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0030 + 01
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 00 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0040 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 00 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0040 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 01 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0040 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 01 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0040 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0040 + 01 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0040 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0040 + 01
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 00 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0050 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 1 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 00 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0050 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 01 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0050 + 02 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 01 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0050 + 02
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 2 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0000
  );
Insert Into
  BEARBVORG_REF_BEARBVORG
(
  BEARBLIST_MOD,
  BEARBSTEU_SEQ,
  BEARBVORG_SEQ_1,
  BEARBVORG_SEQ_2,
  BVREFBV_SEQ
)
Select
  2,
  SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ,
  SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ,
  SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ,
  BEARBVORG_REF_BEARBVORG_SEQ.Nextval
From
  SCHL_BEARB_STEUERUNG,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1,
  SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2
Where
  SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
  SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 02 And
  SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0050 + 01 And
  Not Exists
  (
    Select
      1
    From
      BEARBVORG_REF_BEARBVORG
      Inner Join SCHL_BEARB_STEUERUNG On
      (
        BEARBVORG_REF_BEARBVORG.BEARBSTEU_SEQ =
        SCHL_BEARB_STEUERUNG.BEARBSTEU_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_1 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_1 =
        SCHL_BEARB_VORGANG_1.BEARBVORG_SEQ
      )
      Inner Join SCHL_BEARB_VORGANG SCHL_BEARB_VORGANG_2 On
      (
        BEARBVORG_REF_BEARBVORG.BEARBVORG_SEQ_2 =
        SCHL_BEARB_VORGANG_2.BEARBVORG_SEQ
      )
    Where
      SCHL_BEARB_STEUERUNG.BEARBSTEU_TYP = 3 And
      SCHL_BEARB_VORGANG_1.BEARBVORG_TYP = 0050 + 02 And
      SCHL_BEARB_VORGANG_2.BEARBVORG_TYP = 0050 + 01
  );
-- ============================================================
--   Table: DV_PROG_MELDUNG
-- ============================================================
Set Define #
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Die Bearbeiter müssen für Erst- und Zweit-Bearbeitung verschieden sein!',
  0010,
  'BEL',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0010 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Sie können im Bereich Zweit-Bearbeitung nur entweder über den ' ||
  'Bearbeiter oder das Team einschränken!',
  0011,
  'BEL',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0011 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Das Datum zur Erst-Bearbeitung darf nicht vor dem Datum für die ' ||
  'Zweit-Bearbeitung liegen!',
  0012,
  'BEL',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0012 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Das Datum für die Zweit-Bearbeitung ist Datum zur Erst-Bearbeitung ' ||
  'bzw. Tagesdatum!',
  0013,
  'BEL',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0013 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Sie haben einen Bearbeitungslisteneintrag zum Löschen markiert. ' ||
  'Wollen Sie wirklich mit dem Speichern fortfahren und diesen Eintrag ' ||
  'inaktivieren?',
  0014,
  'BEL',
  '(&00) Hinweis'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0014 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Sie dürfen nur Bearbeitungslisteneinträge löschen, die innerhalb ' ||
  'Ihrer Organisationshierarchie liegen!',
  0015,
  'BEL',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0015 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Es sind nur die Werte 1=Neuanlage, 2=Bearbeitung und 3=Löschung ' ||
  'zulässig.',
  0100,
  'BEL',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0100 And
      DV_PROG_MELDUNG.PRAEFIX = 'BEL'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Es konnte kein Mitarbeiter in der Tabelle <MITARBEITER> ermittelt ' ||
  'werden. Entweder Mitarbeiter mit Netz-Login eintragen oder für die ' ||
  'Rechteprüfung bei der Anmeldung den Netz-Login für einen bekannten ' ||
  'Mitarbeiter angeben.',
  0010,
  'BSP',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0010 And
      DV_PROG_MELDUNG.PRAEFIX = 'BSP'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Eingabe nicht numerisch.',
  0010,
  'MLD',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0010 And
      DV_PROG_MELDUNG.PRAEFIX = 'MLD'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Eingabe darf nur vierstellig sein.',
  0020,
  'MLD',
  '(&00) Fehler'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0020 And
      DV_PROG_MELDUNG.PRAEFIX = 'MLD'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Es können keine Programme zugewiesen werden, da der angemeldete ' ||
  'Mitarbeiter zur Rechtegruppe gehört.',
  0010,
  'REC',
  '(&00) Programm zuweisen'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0010 And
      DV_PROG_MELDUNG.PRAEFIX = 'REC'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Es können keine Programmfunktionen zugewiesen werden, da der ' ||
  'angemeldete Mitarbeiter zur Rechtegruppe gehört.',
  0020,
  'REC',
  '(&00) Programmfunktion zuweisen'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0020 And
      DV_PROG_MELDUNG.PRAEFIX = 'REC'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Es können keine Sonderfälle zugewiesen werden, da der angemeldete ' ||
  'Mitarbeiter zur Rechtegruppe gehört.',
  0030,
  'REC',
  '(&00) Sonderfall zuweisen'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0030 And
      DV_PROG_MELDUNG.PRAEFIX = 'REC'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Speichern nicht möglich, da der angemeldete Mitarbeiter nicht zum ' ||
  'zuständigen Rechtemaster für die Rechtegruppe gehört.',
  0040,
  'REC',
  '(&00) Rechtegruppe speichern'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0040 And
      DV_PROG_MELDUNG.PRAEFIX = 'REC'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Es können keine Rechte zugewiesen werden, da der angemeldete ' ||
  'Mitarbeiter zur Rechtegruppe gehört.',
  0050,
  'REC',
  '(&00) Rechte zuweisen'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0050 And
      DV_PROG_MELDUNG.PRAEFIX = 'REC'
  );
Insert Into
  DV_PROG_MELDUNG
(
  DV_PROG_MELD_SEQ,
  MELD_TEXT,
  NUMMER,
  PRAEFIX,
  TITEL
)
Select
  DV_PROG_MELDUNG_SEQ.Nextval,
  'Speichern nicht möglich, da noch nicht festgelegt wurde, ob durch ' ||
  'die Gruppe Rechte auf Programme, Programmfunktionen oder Sonderfälle ' ||
  'vergeben werden sollen.',
  0060,
  'REC',
  '(&00) Rechtegruppe speichern'
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      DV_PROG_MELDUNG
    Where
      DV_PROG_MELDUNG.NUMMER = 0060 And
      DV_PROG_MELDUNG.PRAEFIX = 'REC'
  );
Set Define &