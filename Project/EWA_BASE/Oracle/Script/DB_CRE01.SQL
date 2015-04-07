/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  DB_CRE01.SQL                                       **/
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
/**                      anlegen.                                           **/
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
--   Tabellen anlegen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ============================================================
--   Table: BATCH_UEBERWACHUNG                                 
-- ============================================================
Create Table BATCH_UEBERWACHUNG
(
    BATUEB_SEQ            NUMBER(10)             not null,
    BATUEB_BEM            VARCHAR2(250)          not null,
    BATUEB_ENDE_DAT       DATE                   not null,
    BATUEB_PC_NAME        VARCHAR2(6)            not null,
    BATUEB_PROG           VARCHAR2(8)            not null,
    BATUEB_DATEI_JN       NUMBER(1)              default 0 not null
        constraint BATCH_UEBERWACHUNG_CK6 check (BATUEB_DATEI_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint BATCH_UEBERWACHUNG_CK7 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint BATCH_UEBERWACHUNG_PK primary key (BATUEB_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence BATCH_UEBERWACHUNG_SEQ;

-- ============================================================
--   Table: BEARBEITUNG_LISTE                                  
-- ============================================================
Create Table BEARBEITUNG_LISTE
(
    BEARBLIST_SEQ         NUMBER(10)             not null,
    BEARBLIST_SEQ_V       NUMBER(10)             null    ,
    MITARB_SEQ_1          NUMBER(10)             not null,
    MITARB_SEQ_2          NUMBER(10)             null    ,
    DVPROGV_FACH_ID       VARCHAR2(40)           null    ,
    BEARBSTAT_SEQ         NUMBER(10)             not null,
    DVPROGV_SEQ           NUMBER(10)             null    ,
    BEARBLIST_BEM         VARCHAR2(2000)         null    ,
    BEARBVORG_SEQ_1       NUMBER(10)             not null,
    BEARBVORG_SEQ_2       NUMBER(10)             not null,
    ORGEINHEIT_SEQ        NUMBER(10)             not null,
    BEARBLIST_DAT         DATE                   null    ,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint BEARBEITUNG_LISTE_CK20 check (AKTIV_JN in (0,1)),
    BEARBLIST_MOD         NUMBER(2)              default 2 null    ,
    constraint BEARBEITUNG_LISTE_PK primary key (BEARBLIST_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence BEARBEITUNG_LISTE_SEQ;

Create Index
  BEARBEITUNG_LISTE_FK1
On
  BEARBEITUNG_LISTE (BEARBLIST_SEQ_V asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK2
On
  BEARBEITUNG_LISTE (BEARBSTAT_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK3
On
  BEARBEITUNG_LISTE (BEARBVORG_SEQ_1 asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK4
On
  BEARBEITUNG_LISTE (BEARBVORG_SEQ_2 asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK5
On
  BEARBEITUNG_LISTE (DVPROGV_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK6
On
  BEARBEITUNG_LISTE (MITARB_SEQ_1 asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK7
On
  BEARBEITUNG_LISTE (MITARB_SEQ_2 asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBEITUNG_LISTE_FK8
On
  BEARBEITUNG_LISTE (ORGEINHEIT_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: BEARBLIST_REF                                      
-- ============================================================
Create Table BEARBLIST_REF
(
    BEARBR_SEQ            NUMBER(10)             not null,
    BEARBLIST_SEQ         NUMBER(10)             not null,
    BEARBR_TABELLE        VARCHAR2(30)           not null,
    BEARBR_SPALTE         VARCHAR2(30)           not null,
    BEARBR_ZEILE_SEQ      NUMBER(10)             not null,
    BEARBR_PK_JN          NUMBER(1)              default 1 not null
        constraint BEARBLIST_REF_CK6 check (BEARBR_PK_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint BEARBLIST_REF_CK14 check (AKTIV_JN in (0,1)),
    constraint BEARBLIST_REF_PK primary key (BEARBR_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence BEARBLIST_REF_SEQ;

Create Index
  BEARBLIST_REF_FK1
On
  BEARBLIST_REF (BEARBLIST_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: BEARBVORG_REF_BEARBVORG                            
-- ============================================================
Create Table BEARBVORG_REF_BEARBVORG
(
    BVREFBV_SEQ           NUMBER(10)             not null,
    BEARBVORG_SEQ_1       NUMBER(10)             not null,
    BEARBVORG_SEQ_2       NUMBER(10)             not null,
    ORGEINHEIT_SEQ        NUMBER(10)             null    ,
    BVREFBV_GRUPPE        NUMBER(4)              null    ,
    BEARBDBF_SEQ          NUMBER(10)             null    ,
    BEARBSTEU_SEQ         NUMBER(10)             null    ,
    BVREFBV_RANG          NUMBER(10)             null    ,
    BVREFBV_ERST_JN       NUMBER(1)              default 0 not null
        constraint BEARBVORG_REF_BEARBVORG_CK9 check (BVREFBV_ERST_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint BEARBVORG_REF_BEARBVORG_CK17 check (AKTIV_JN in (0,1)),
    BEARBLIST_MOD         NUMBER(2)              default 2 null    ,
    constraint BEARBVORG_REF_BEARBVORG_PK primary key (BVREFBV_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence BEARBVORG_REF_BEARBVORG_SEQ;

Create Index
  BEARBVORG_REF_BEARBVORG_FK1
On
  BEARBVORG_REF_BEARBVORG (BEARBDBF_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBVORG_REF_BEARBVORG_FK2
On
  BEARBVORG_REF_BEARBVORG (BEARBSTEU_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBVORG_REF_BEARBVORG_FK3
On
  BEARBVORG_REF_BEARBVORG (BEARBVORG_SEQ_1 asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBVORG_REF_BEARBVORG_FK4
On
  BEARBVORG_REF_BEARBVORG (BEARBVORG_SEQ_2 asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  BEARBVORG_REF_BEARBVORG_FK5
On
  BEARBVORG_REF_BEARBVORG (ORGEINHEIT_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: DOKUMENT                                           
-- ============================================================
Create Table DOKUMENT
(
    DOK_SEQ               NUMBER(10)             not null,
    DRUCKER_SEQ           NUMBER(10)             null    ,
    DOKT_SEQ              NUMBER(10)             not null,
    DOKG_SEQ              NUMBER(10)             not null,
    WORDM_SEQ             NUMBER(10)             null    ,
    DOK_KURZ              VARCHAR2(40)           not null,
    DOK_BEZ               VARCHAR2(250)          null    ,
    DOK_NUMMER            NUMBER(5)              null    ,
    LAUFWERK_PFAD         VARCHAR2(100)          null    ,
    FILE_NAME             VARCHAR2(8)            null    ,
    FILE_SUFFIX           VARCHAR2(3)            null    ,
    FILE_NAME_STEU        VARCHAR2(8)            null    ,
    FILE_SUFFIX_STEU      VARCHAR2(3)            null    ,
    DOK_FREMD_MOD_JN      NUMBER(1)              default 0 not null
        constraint DOKUMENT_CK14 check (DOK_FREMD_MOD_JN in (0,1)),
    DOK_TEMPORAER_JN      NUMBER(1)              default 0 not null
        constraint DOKUMENT_CK15 check (DOK_TEMPORAER_JN in (0,1)),
    DOK_KOPIE_JN          NUMBER(1)              default 0 not null
        constraint DOKUMENT_CK16 check (DOK_KOPIE_JN in (0,1)),
    TB_FREI_SEL_JN        NUMBER(1)              default 1 not null
        constraint DOKUMENT_CK17 check (TB_FREI_SEL_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DOKUMENT_CK18 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    DOK_SEQ_VORG          NUMBER(10)             null    ,
    WORDM_SEQ_END         NUMBER(10)             null    ,
    MITARB_SEQ            NUMBER(10)             null    ,
    PERSON_SEQ            NUMBER(10)             null    ,
    WAEHRUNG_SEQ          NUMBER(10)             null    ,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    TELETYP_SEQ           NUMBER(10)             null    ,
    TKRZEILE_SEQ          NUMBER(10)             null    ,
    DOK_LFDNR_TBX         NUMBER(3)              null    ,
    constraint DOKUMENT_PK primary key (DOK_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence DOKUMENT_SEQ;

Create Index
  DOKUMENT_FK1
On
  DOKUMENT (DOK_SEQ_VORG asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK2
On
  DOKUMENT (DOKG_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK3
On
  DOKUMENT (DOKT_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK4
On
  DOKUMENT (DRUCKER_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK5
On
  DOKUMENT (MITARB_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK6
On
  DOKUMENT (PERSON_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK7
On
  DOKUMENT (TELETYP_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK8
On
  DOKUMENT (TKRZEILE_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK9
On
  DOKUMENT (WAEHRUNG_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK10
On
  DOKUMENT (WORDM_SEQ asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DOKUMENT_FK11
On
  DOKUMENT (WORDM_SEQ_END asc)
Storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: DV_NUTZER
-- ============================================================
Create Table DV_NUTZER
(
    DVNUTZER_SEQ          NUMBER(10)             not null,
    DVNUTZER_KURZ         VARCHAR2(40)           not null,
    DVNUTZER_NAME         VARCHAR2(250)          not null,
    ORGEINHEIT_SEQ        NUMBER(10)             not null,
    DB_SPERRE_JN          NUMBER(1)              default 0 not null
        constraint DV_NUTZER_CK5 check (DB_SPERRE_JN in (0,1)),
    RECHTVERW_JN          NUMBER(1)              default 1 not null
        constraint DV_NUTZER_CK6 check (RECHTVERW_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DV_NUTZER_CK7 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint DV_NUTZER_PK primary key (DVNUTZER_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
);

Create Sequence DV_NUTZER_SEQ;

-- ============================================================
--   Table: DV_PROG_MELDUNG                                    
-- ============================================================
Create Table DV_PROG_MELDUNG
(
    DV_PROG_MELD_SEQ      NUMBER(10)             not null,
    PRAEFIX               VARCHAR2(4)            not null,
    NUMMER                NUMBER(4)              not null,
    MELD_TEXT             VARCHAR2(250)          not null,
    TITEL                 VARCHAR2(80)           null    ,
    HELP_TEXT             VARCHAR2(250)          null    ,
    FREIGABE_JN           NUMBER(1)              default 1 not null,
        constraint DV_PROG_MELDUNG_CK7 check (FREIGABE_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DV_PROG_MELDUNG_CK8 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint DV_PROG_MELDUNG_PK primary key (DV_PROG_MELD_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence DV_PROG_MELDUNG_SEQ;

-- ============================================================
--   Table: DV_PROG_PARAM                                      
-- ============================================================
Create Table DV_PROG_PARAM
(
    DVPROGP_SEQ           NUMBER(10)             not null,
    DVPROGP_BEZ           VARCHAR2(250)          null    ,
    DVPROGP_NR            NUMBER(4)              not null,
    DVPROGP_PROG          VARCHAR2(32)           not null,
    DVPROGP_VALUETYP      NUMBER(2)              not null,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DV_PROG_PARAM_CK6 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint DV_PROG_PARAM_PK primary key (DVPROGP_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence DV_PROG_PARAM_SEQ;

-- ============================================================
--   Table: DV_PROG_PARAM_WERT                                 
-- ============================================================
Create Table DV_PROG_PARAM_WERT
(
    DVPROGPW_SEQ          NUMBER(10)             not null,
    DVPROGP_SEQ           NUMBER(10)             not null,
    DVPROGPW_SORT         NUMBER(6)              null    ,
    DVPROGPW_VALUE_A      VARCHAR2(250)          null    ,
    DVPROGPW_VALUE_D      DATE                   null    ,
    DVPROGPW_VALUE_N      NUMBER                 null    ,
    GUELTIG_VON_DAT       DATE                   null    ,
    GUELTIG_BIS_DAT       DATE                   null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DV_PROG_PARAM_WERT_CK9 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint DV_PROG_PARAM_WERT_PK primary key (DVPROGPW_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence DV_PROG_PARAM_WERT_SEQ;

Create Index
   DV_PROG_PARAM_WERT_FK1
On
   DV_PROG_PARAM_WERT (DVPROGP_SEQ Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: DV_PROG_VORGANG                                    
-- ============================================================
Create Table DV_PROG_VORGANG
(
    DVPROGV_SEQ           NUMBER(10)             not null,
    DVPROGF_SEQ           NUMBER(10)             null    ,
    DVPROGV_FACH_ID       VARCHAR2(40)           null    ,
    DVPROGV_WHERE         VARCHAR2(250)          null    ,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DV_PROG_VORGANG_CK12 check (AKTIV_JN in (0,1)),
    constraint DV_PROG_VORGANG_PK primary key (DVPROGV_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence DV_PROG_VORGANG_SEQ;

Create Index
  DV_PROG_VORGANG_FK1
On
  DV_PROG_VORGANG (DVPROGF_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: DV_PROG_VORGANG_PARAM                              
-- ============================================================
Create Table DV_PROG_VORGANG_PARAM
(
    DVPROGVP_SEQ          NUMBER(10)             not null,
    DVPROGV_SEQ           NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DV_PROG_VORGANG_PARAM_CK10 check (AKTIV_JN in (0,1)),
    DVPROGVP_IDX          NUMBER(10)             not null,
    DVPROGVP_TYP          NUMBER(4)              not null,
    DVPROGVP_N_WERT       NUMBER                 null    ,
    DVPROGVP_A_WERT       VARCHAR2(2000)         null    ,
    constraint DV_PROG_VORGANG_PARAM_PK primary key (DVPROGVP_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence DV_PROG_VORGANG_PARAM_SEQ;

Create Index
  DV_PROG_VORGANG_PARAM_FK1
On
  DV_PROG_VORGANG_PARAM (DVPROGV_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: DVPROGV_REF_DOK                                    
-- ============================================================
Create Table DVPROGV_REF_DOK
(
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DVPROGV_REF_DOK_CK8 check (AKTIV_JN in (0,1)),
    DVPROGVRD_SEQ         NUMBER(10)             not null,
    DOK_SEQ               NUMBER(10)             not null,
    DVPROGV_SEQ           NUMBER(10)             not null,
    constraint DVPROGV_REF_DOK_PK primary key (DVPROGVRD_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence DVPROGV_REF_DOK_SEQ;

Create Index
  DVPROGV_REF_DOK_FK1
On
  DVPROGV_REF_DOK (DOK_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DVPROGV_REF_DOK_FK2
On
  DVPROGV_REF_DOK (DVPROGV_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: DVPROGV_REF_PROTK                                  
-- ============================================================
Create Table DVPROGV_REF_PROTK
(
    DVPROGVRP_SEQ         NUMBER(10)             not null,
    PROTK_SEQ             NUMBER(10)             not null,
    DVPROGV_SEQ           NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint DVPROGV_REF_PROTK_CK11 check (AKTIV_JN in (0,1)),
    constraint DVPROGV_REF_PROTK_PK primary key (DVPROGVRP_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence DVPROGV_REF_PROTK_SEQ;

Create Index
  DVPROGV_REF_PROTK_FK1
On
  DVPROGV_REF_PROTK (DVPROGV_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  DVPROGV_REF_PROTK_FK2
On
  DVPROGV_REF_PROTK (PROTK_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: EURO                                       
-- ============================================================
Create Table
  EURO
(
  KURS Number
);

-- ============================================================
--   Table: MITARBEITER                                        
-- ============================================================
Create Table MITARBEITER
(
    MITARB_SEQ            NUMBER(10)             not null,
    ORGEINHEIT_SEQ        NUMBER(10)             not null,
    DRUCKER_SEQ           NUMBER(10)             null    ,
    MITARB_KURZ           VARCHAR2(40)           not null,
    BRIEFZEICHEN_SB       VARCHAR2(5)            not null,
    MITARB_ANSPRECH       VARCHAR2(30)           null    ,
    NETZ_LOGINNAME        VARCHAR2(250)          not null,
    NEBENSTELLE           NUMBER(4)              null    ,
    MITARB_USCHRIFT       VARCHAR2(40)           null    ,
    MITARB_LINKS_JN       NUMBER(1)              default 0 not null
        constraint MITARBEITER_CK10 check (MITARB_LINKS_JN in (0,1)),
    KRED_ADMIN_JN         NUMBER(1)              default 0 not null
        constraint MITARBEITER_CK11 check (KRED_ADMIN_JN in (0,1)),
    ZUGRIFF_ADMIN_JN      NUMBER(1)              default 0 not null
        constraint MITARBEITER_CK12 check (ZUGRIFF_ADMIN_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint MITARBEITER_CK13 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    MITARB_SEQ_2US        NUMBER(10)             null    ,
    NEBENSTELLE_FAX       NUMBER(4)              null    ,
    MITARB_SEQ_SP         NUMBER(10)             null    ,
    constraint MITARBEITER_PK primary key (MITARB_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
);

Create Sequence MITARBEITER_SEQ;

Create Index
  MITARBEITER_FK1
On
  MITARBEITER(ORGEINHEIT_SEQ Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

Create Index
  MITARBEITER_FK2
On
  MITARBEITER(DRUCKER_SEQ Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

Create Index
  MITARBEITER_FK3
On
  MITARBEITER(MITARB_SEQ_2US Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

Create Index
  MITARBEITER_FK4
On
  MITARBEITER(MITARB_SEQ_SP Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: PROTOKOLL_KOPF                                     
-- ============================================================
Create Table PROTOKOLL_KOPF
(
    PROTK_SEQ             NUMBER(10)             not null,
    DVPROGF_NAME          VARCHAR2(32)           not null,
    DVPROGF_KURZ          VARCHAR2(40)           not null,
    PROTK_ONLINE_BIS      DATE                   null    ,
    PROTK_ARCHIV_JN       NUMBER(1)              default 0 not null
        constraint PROTOKOLL_KOPF_CK5 check (PROTK_ARCHIV_JN in (0,1)),
    PROTK_FACH_ID         VARCHAR2(40)           null    ,
    PROTK_KONTR_JN        NUMBER(1)              default 0 not null
        constraint PROTOKOLL_KOPF_CK7 check (PROTK_KONTR_JN in (0,1)),
    PROTK_KONTR_DURCH     VARCHAR2(30)           null    ,
    PROTK_KONTR_AM        DATE                   null    ,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    LOG_UP_VERS           NUMBER(7)              not null,
    constraint PROTOKOLL_KOPF_PK primary key (PROTK_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence PROTOKOLL_KOPF_SEQ;

-- ============================================================
--   Table: PROTOKOLL_REF                                      
-- ============================================================
Create Table PROTOKOLL_REF
(
    PROTR_SEQ             NUMBER(10)             not null,
    PROTK_SEQ             NUMBER(10)             not null,
    PROTR_TABELLE         VARCHAR2(30)           not null,
    PROTR_SPALTE          VARCHAR2(30)           not null,
    PROTR_ZEILE_SEQ       NUMBER(10)             not null,
    constraint PROTOKOLL_REF_PK primary key (PROTR_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence PROTOKOLL_REF_SEQ;

Create Index
  PROTOKOLL_REF_FK1
On
  PROTOKOLL_REF (PROTK_SEQ asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);
-- ============================================================
--   Table: PROTOKOLL_WERT                                     
-- ============================================================
Create Table PROTOKOLL_WERT
(
    PROTW_SEQ             NUMBER(10)             not null,
    PROTZ_SEQ             NUMBER(10)             not null,
    PROTW_SPALTE          VARCHAR2(30)           not null,
    PROTW_WERT_ALT        VARCHAR2(2000)         null    ,
    PROTW_WERT_NEU        VARCHAR2(2000)         null    ,
    PROTW_AENDER_JN       NUMBER(1)              default 1 not null
        constraint PROTOKOLL_WERT_CK6 check (PROTW_AENDER_JN in (0,1)),
    constraint PROTOKOLL_WERT_PK primary key (PROTW_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence PROTOKOLL_WERT_SEQ;

Create Index
  PROTOKOLL_WERT_FK1
On
  PROTOKOLL_WERT (PROTZ_SEQ asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: PROTOKOLL_ZEILE                                    
-- ============================================================
Create Table PROTOKOLL_ZEILE
(
    PROTZ_SEQ             NUMBER(10)             not null,
    PROTK_SEQ             NUMBER(10)             not null,
    PROTZ_TABELLE         VARCHAR2(30)           not null,
    PROTZ_ZEILE_SEQ       NUMBER(10)             null    ,
    PROTZ_ZEILE_ID        VARCHAR2(40)           null    ,
    AKTION_TYP            VARCHAR2(6)            not null,
    SONDERFALL_TYP        VARCHAR2(6)            null    ,
    PROTZ_ZEILE_VERS      NUMBER(7)              null    ,
    constraint PROTOKOLL_ZEILE_PK primary key (PROTZ_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence PROTOKOLL_ZEILE_SEQ;

Create Index
  PROTOKOLL_ZEILE_FK1
On
  PROTOKOLL_ZEILE (PROTK_SEQ asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: RECHT_GRUPPE                                       
-- ============================================================
Create Table RECHT_GRUPPE
(
    RECHTGR_SEQ           NUMBER(10)             not null,
    RECHTGR_KURZ          VARCHAR2(40)           not null,
    RECHTGR_BEZ           VARCHAR2(250)          null    ,
    RECHTMA_SEQ           NUMBER(10)             not null,
    HIERARCH_SEQ          NUMBER(10)             not null,
    RECHTGR_RECHT         VARCHAR2(10)           null    ,
    DVPROG_ALLE_JN        NUMBER(1)              default 0 not null
        constraint RECHT_GRUPPE_CK7 check (DVPROG_ALLE_JN in (0,1)),
    DVPROGF_ALLE_JN       NUMBER(1)              default 0 not null
        constraint RECHT_GRUPPE_CK8 check (DVPROGF_ALLE_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHT_GRUPPE_CK16 check (AKTIV_JN in (0,1)),
    DVPROG_JN             NUMBER(1)              default 0 not null
        constraint RECHT_GRUPPE_CK17 check (DVPROG_JN in (0,1)),
    DVPROGF_JN            NUMBER(1)              default 0 not null
        constraint RECHT_GRUPPE_CK18 check (DVPROGF_JN in (0,1)),
    SONDERFALL_JN         NUMBER(1)              default 0 not null
        constraint RECHT_GRUPPE_CK19 check (SONDERFALL_JN in (0,1)),
    constraint RECHT_GRUPPE_PK primary key (RECHTGR_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence RECHT_GRUPPE_SEQ;

Create Index
  RECHT_GRUPPE_FK1
On
  RECHT_GRUPPE (HIERARCH_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHT_GRUPPE_FK2
On
  RECHT_GRUPPE (RECHTMA_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: RECHT_MASTER                                       
-- ============================================================
Create Table RECHT_MASTER
(
    RECHTMA_SEQ           NUMBER(10)             not null,
    RECHTMA_KURZ          VARCHAR2(40)           not null,
    RECHTMA_BEZ           VARCHAR2(250)          null    ,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHT_MASTER_CK11 check (AKTIV_JN in (0,1)),
    constraint RECHT_MASTER_PK primary key (RECHTMA_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence RECHT_MASTER_SEQ;

-- ============================================================
--   Table: RECHTGR_REF_DVNUTZER                               
-- ============================================================
Create Table RECHTGR_REF_DVNUTZER
(
    REGRRDVN_SEQ          NUMBER(10)             not null,
    RECHTGR_SEQ           NUMBER(10)             not null,
    DVNUTZER_SEQ          NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHTGR_REF_DVNUTZER_CK10 check (AKTIV_JN in (0,1)),
    constraint RECHTGR_REF_DVNUTZER_PK primary key (REGRRDVN_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence RECHTGR_REF_DVNUTZER_SEQ;

Create Index
  RECHTGR_REF_DVNUTZER_FK1
On
  RECHTGR_REF_DVNUTZER (DVNUTZER_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHTGR_REF_DVNUTZER_FK2
On
  RECHTGR_REF_DVNUTZER (RECHTGR_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: RECHTGR_REF_DVPROGF                                
-- ============================================================
Create Table RECHTGR_REF_DVPROGF
(
    REGRRDVPF_SEQ         NUMBER(10)             not null,
    RECHTGR_SEQ           NUMBER(10)             not null,
    DVPROGF_SEQ           NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHTGR_REF_DVPROGF_CK11 check (AKTIV_JN in (0,1)),
    constraint RECHTGR_REF_DVPROGF_PK primary key (REGRRDVPF_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence RECHTGR_REF_DVPROGF_SEQ;

Create Index
  RECHTGR_REF_DVPROGF_FK1
On
  RECHTGR_REF_DVPROGF (DVPROGF_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHTGR_REF_DVPROGF_FK2
On
  RECHTGR_REF_DVPROGF (RECHTGR_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: RECHTGR_REF_SONDERFALL                             
-- ============================================================
Create Table RECHTGR_REF_SONDERFALL
(
    REGRRSOND_SEQ         NUMBER(10)             not null,
    RECHTGR_SEQ           NUMBER(10)             not null,
    SONDERFALL_SEQ        NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHTGR_REF_SONDERFALL_CK11 check (AKTIV_JN in (0,1)),
    constraint RECHTGR_REF_SONDERFALL_PK primary key (REGRRSOND_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence RECHTGR_REF_SONDERFALL_SEQ;

Create Index
  RECHTGR_REF_SONDERFALL_FK1
On
  RECHTGR_REF_SONDERFALL (RECHTGR_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHTGR_REF_SONDERFALL_FK2
On
  RECHTGR_REF_SONDERFALL (SONDERFALL_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: RECHTMA_REF_DVNUTZER                               
-- ============================================================
Create Table RECHTMA_REF_DVNUTZER
(
    REMARDVN_SEQ          NUMBER(10)             not null,
    RECHTMA_SEQ           NUMBER(10)             not null,
    DVNUTZER_SEQ          NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHTMA_REF_DVNUTZER_CK10 check (AKTIV_JN in (0,1)),
    constraint RECHTMA_REF_DVNUTZER_PK primary key (REMARDVN_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence RECHTMA_REF_DVNUTZER_SEQ;

Create Index
  RECHTMA_REF_DVNUTZER_FK1
On
  RECHTMA_REF_DVNUTZER (DVNUTZER_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHTMA_REF_DVNUTZER_FK2
On
  RECHTMA_REF_DVNUTZER (RECHTMA_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: RECHTMA_REF_DVPROGF                                
-- ============================================================
Create Table RECHTMA_REF_DVPROGF
(
    REMARDVPF_SEQ         NUMBER(10)             not null,
    RECHTMA_SEQ           NUMBER(10)             not null,
    DVPROGF_SEQ           NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHTMA_REF_DVPROGF_CK11 check (AKTIV_JN in (0,1)),
    constraint RECHTMA_REF_DVPROGF_PK primary key (REMARDVPF_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence RECHTMA_REF_DVPROGF_SEQ;

Create Index
  RECHTMA_REF_DVPROGF_FK1
On
  RECHTMA_REF_DVPROGF (DVPROGF_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHTMA_REF_DVPROGF_FK2
On
  RECHTMA_REF_DVPROGF (RECHTMA_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: RECHTMA_REF_SONDERFALL                             
-- ============================================================
Create Table RECHTMA_REF_SONDERFALL
(
    REMARSOND_SEQ         NUMBER(10)             not null,
    SONDERFALL_SEQ        NUMBER(10)             not null,
    RECHTMA_SEQ           NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint RECHTMA_REF_SONDERFALL_CK11 check (AKTIV_JN in (0,1)),
    constraint RECHTMA_REF_SONDERFALL_PK primary key (REMARSOND_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence RECHTMA_REF_SONDERFALL_SEQ;

Create Index
  RECHTMA_REF_SONDERFALL_FK1
On
  RECHTMA_REF_SONDERFALL (RECHTMA_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  RECHTMA_REF_SONDERFALL_FK2
On
  RECHTMA_REF_SONDERFALL (SONDERFALL_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: SCHL_BEARB_DB_FUNKTION                             
-- ============================================================
Create Table SCHL_BEARB_DB_FUNKTION
(
    BEARBDBF_SEQ          NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_BEARB_DB_FUNKTION_CK9 check (AKTIV_JN in (0,1)),
    BEARBDBF_KURZ         VARCHAR2(40)           not null,
    BEARBDBF_BEZ          VARCHAR2(250)          null    ,
    BEARBDBF_NAME         VARCHAR2(92)           not null,
    constraint SCHL_BEARB_DB_FUNKTION_PK primary key (BEARBDBF_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_BEARB_DB_FUNKTION_SEQ;

-- ============================================================
--   Table: SCHL_BEARB_STEUERUNG                               
-- ============================================================
Create Table SCHL_BEARB_STEUERUNG
(
    BEARBSTEU_SEQ         NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_BEARB_STEUERUNG_CK9 check (AKTIV_JN in (0,1)),
    BEARBSTEU_KURZ        VARCHAR2(40)           not null,
    BEARBSTEU_BEZ         VARCHAR2(250)          null    ,
    BEARBSTEU_TYP         NUMBER(4)              not null,
    constraint SCHL_BEARB_STEUERUNG_PK primary key (BEARBSTEU_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_BEARB_STEUERUNG_SEQ;

-- ============================================================
--   Table: SCHL_BEARB_VORGANG                                 
-- ============================================================
Create Table SCHL_BEARB_VORGANG
(
    BEARBVORG_SEQ         NUMBER(10)             not null,
    BEARBSTAT_SEQ         NUMBER(10)             null    ,
    DVPROGF_SEQ           NUMBER(10)             null    ,
    BEARBVORG_KURZ        VARCHAR2(40)           not null,
    BEARBVORG_BEZ         VARCHAR2(250)          null    ,
    BEARBVORG_TYP         NUMBER(4)              not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_BEARB_VORGANG_CK14 check (AKTIV_JN in (0,1)),
    constraint SCHL_BEARB_VORGANG_PK primary key (BEARBVORG_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_BEARB_VORGANG_SEQ;

Create Index
  SCHL_BEARB_VORGANG_FK1
On
  SCHL_BEARB_VORGANG (BEARBSTAT_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  SCHL_BEARB_VORGANG_FK2
On
  SCHL_BEARB_VORGANG (DVPROGF_SEQ asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-- ============================================================
--   Table: SCHL_BEARBLIST_STATUS                              
-- ============================================================
Create Table SCHL_BEARBLIST_STATUS
(
    BEARBSTAT_SEQ         NUMBER(10)             not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_BEARBLIST_STATUS_CK9 check (AKTIV_JN in (0,1)),
    BEARBSTAT_KURZ        VARCHAR2(40)           not null,
    BEARBSTAT_BEZ         VARCHAR2(250)          null    ,
    BEARBSTAT_TYP         NUMBER(4)              not null,
    constraint SCHL_BEARBLIST_STATUS_PK primary key (BEARBSTAT_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_BEARBLIST_STATUS_SEQ;

-- ============================================================
--   Table: SCHL_DATENBANK                                     
-- ============================================================
Create Table SCHL_DATENBANK
(
    DATENBANK_SEQ         NUMBER(10)             not null,
    DATENBANK_KURZ        VARCHAR2(40)           not null,
    DATENBANK_BEZ         VARCHAR2(250)          null    ,
    DATENBANK_NAME        VARCHAR2(8)            not null,
    UPD_GESPERRT_JN       NUMBER(1)              default 0 not null
        constraint SCHL_DATENBANK_CK5 check (UPD_GESPERRT_JN in (0,1)),
    SEL_GESPERRT_JN       NUMBER(1)              default 0 not null
        constraint SCHL_DATENBANK_CK6 check (SEL_GESPERRT_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_DATENBANK_CK14 check (AKTIV_JN in (0,1)),
    constraint SCHL_DATENBANK_PK primary key (DATENBANK_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_DATENBANK_SEQ;

-- ============================================================
--   Table: SCHL_DRUCKER                                       
-- ============================================================
Create Table SCHL_DRUCKER
(
    DRUCKER_SEQ           NUMBER(10)             not null,
    DRUCKER_KURZ          VARCHAR2(40)           not null,
    DRUCKER_BEZ           VARCHAR2(250)          null    ,
    DRUCKER_NAME          VARCHAR2(60)           not null,
    DR_DEFAULT_JN         NUMBER(1)              default 0 not null
        constraint SCHL_DRUCKER_CK5 check (DR_DEFAULT_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_DRUCKER_CK6 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint SCHL_DRUCKER_PK primary key (DRUCKER_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_DRUCKER_SEQ;

-- ============================================================
--   Table: SCHL_DV_PROG_FUNKTION                              
-- ============================================================
create table SCHL_DV_PROG_FUNKTION
(
    DVPROGF_SEQ           NUMBER(10)             not null,
    DVPROGF_KURZ          VARCHAR2(40)           not null,
    DVPROGF_BEZ           VARCHAR2(250)          null    ,
    DVPROGF_NAME          VARCHAR2(32)           not null,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_DV_PROG_FUNKTION_CK5 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    UVERF_SEQ             NUMBER(10)             null    ,
    DVPROGF_WINDOW        VARCHAR2(32)           null    ,
    RECHTGR_RECHT         VARCHAR2(10)           null    ,
    constraint SCHL_DV_PROG_FUNKTION_PK primary key (DVPROGF_SEQ)
        using index
        storage
        (
        initial 23K
        next 5K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_DV_PROG_FUNKTION_SEQ;

Create Index
  SCHL_DV_PROG_FUNKTION_FK1
On
  SCHL_DV_PROG_FUNKTION(UVERF_SEQ Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: SCHL_DV_UVERFAHREN                                 
-- ============================================================
Create Table SCHL_DV_UVERFAHREN
(
    UVERF_SEQ             NUMBER(10)             not null,
    BVERF_SEQ             NUMBER(10)             not null,
    UVERF_KURZ            VARCHAR2(40)           not null,
    UVERF_BEZ             VARCHAR2(250)          null    ,
    UVERF_TYP             NUMBER(4)              not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_DV_UVERFAHREN_CK13 check (AKTIV_JN in (0,1)),
    constraint SCHL_DV_UVERFAHREN_PK primary key (UVERF_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_DV_UVERFAHREN_SEQ;

Create Index
  SCHL_DV_UVERFAHREN_FK1
On
  SCHL_DV_UVERFAHREN(BVERF_SEQ Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: SCHL_DV_VERF_BEREICH                               
-- ============================================================
Create Table SCHL_DV_VERF_BEREICH
(
    BVERF_SEQ             NUMBER(10)             not null,
    BVERF_KURZ            VARCHAR2(40)           not null,
    BVERF_BEZ             VARCHAR2(250)          null    ,
    BVERF_TYP             NUMBER(4)              not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_DV_VERF_BEREICH_CK12 check (AKTIV_JN in (0,1)),
    constraint SCHL_DV_VERF_BEREICH_PK primary key (BVERF_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_DV_VERF_BEREICH_SEQ;

-- ============================================================
--   Table: SCHL_HIERARCHIE                                    
-- ============================================================
Create Table SCHL_HIERARCHIE
(
    HIERARCH_SEQ          NUMBER(10)             not null,
    HIERARCH_KURZ         VARCHAR2(40)           not null,
    HIERARCH_BEZ          VARCHAR2(250)          null    ,
    HIERARCHIE            NUMBER(1)              default 1 not null,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_HIERARCHIE_CK5 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint SCHL_HIERARCHIE_PK primary key (HIERARCH_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_HIERARCHIE_SEQ;

-- ============================================================
--   Table: SCHL_ORGEINHEIT                                    
-- ============================================================
Create Table SCHL_ORGEINHEIT
(
    ORGEINHEIT_SEQ        NUMBER(10)             not null,
    ORGEINHEIT_SEQ_V      NUMBER(10)             null    ,
    HIERARCH_SEQ          NUMBER(10)             null    ,
    MITARB_SEQ_L          NUMBER(10)             null    ,
    MITARB_SEQ_V          NUMBER(10)             null    ,
    ORGEINHEIT_KURZ       VARCHAR2(40)           not null,
    ORGEINHEIT_BEZ        VARCHAR2(250)          null    ,
    ORGEINHEIT_ALT        CHAR(2)                null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_ORGEINHEIT_CK9 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AUFGABEN              VARCHAR2(2000)         null    ,
    constraint SCHL_ORGEINHEIT_PK primary key (ORGEINHEIT_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_ORGEINHEIT_SEQ;

Create Index
  SCHL_ORGEINHEIT_FK1
On
  SCHL_ORGEINHEIT(ORGEINHEIT_SEQ_V Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

Create Index
  SCHL_ORGEINHEIT_FK2
On
  SCHL_ORGEINHEIT(HIERARCH_SEQ Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

Create Index
  SCHL_ORGEINHEIT_FK3
On
  SCHL_ORGEINHEIT(MITARB_SEQ_L Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

Create Index
  SCHL_ORGEINHEIT_FK4
On
  SCHL_ORGEINHEIT(MITARB_SEQ_V Asc)
Storage
(
  Initial 10K
  Next 4K
  Pctincrease 0
);

-- ============================================================
--   Table: SCHL_SONDERFALL                                    
-- ============================================================
Create Table SCHL_SONDERFALL
(
    SONDERFALL_SEQ        NUMBER(10)             not null,
    SONDERFALL_KURZ       VARCHAR2(40)           not null,
    SONDERFALL_BEZ        VARCHAR2(250)          null    ,
    SONDERFALL_TYP        VARCHAR2(6)            not null,
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_SONDERFALL_CK12 check (AKTIV_JN in (0,1)),
    constraint SCHL_SONDERFALL_PK primary key (SONDERFALL_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_SONDERFALL_SEQ;

-- ============================================================
--   Table: SCHL_TELEKRED_STATUS                               
-- ============================================================
Create Table SCHL_TELEKRED_STATUS
(
    TELEKRED_SEQ          NUMBER(10)             not null,
    TELEKRED_KURZ         VARCHAR2(40)           not null,
    TELEKRED_BEZ          VARCHAR2(250)          null    ,
    TELEKRED_TYP          NUMBER(4)              not null,
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_TELEKRED_STATUS_CK5 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint SCHL_TELEKRED_STATUS_PK primary key (TELEKRED_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_TELEKRED_STATUS_SEQ;

-- ============================================================
--   Table: SCHL_WAEHRUNG                                      
-- ============================================================
Create Table SCHL_WAEHRUNG
(
    WAEHRUNG_SEQ          NUMBER(10)             not null,
    WAEHRUNG_KURZ         VARCHAR2(40)           not null,
    WAEHRUNG_BEZ          VARCHAR2(250)          null    ,
    WAEHRUNG_ALT          NUMBER(3)              not null,
    WAEHRUNG_ISO          VARCHAR2(3)            not null,
    WAEHRUNG_BIL_JN       NUMBER(1)              default 0 not null
        constraint SCHL_WAEHRUNG_CK6 check (WAEHRUNG_BIL_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint SCHL_WAEHRUNG_CK7 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    EXPONENT              NUMBER(7)              default 1 not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint SCHL_WAEHRUNG_PK primary key (WAEHRUNG_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 10K
next 4K
pctincrease 0
);

Create Sequence SCHL_WAEHRUNG_SEQ;

-- ============================================================
--   Table: TKR_ZEILE                                          
-- ============================================================
Create Table TKR_ZEILE
(
    MITARB_SEQ            NUMBER(10)             not null,
    TKRZEILE_SEQ          NUMBER(10)             not null,
    TELEDTA_SEQ           NUMBER(10)             not null,
    TELETYP_SEQ           NUMBER(10)             not null,
    TELEKRED_SEQ          NUMBER(10)             not null,
    PARTNER_BANK_TBX      VARCHAR2(3)            not null,
    REFERENZ_KZ           VARCHAR2(40)           null    ,
    ELEK_ANTR_JN          NUMBER(1)              default 0 not null
        constraint TKR_ZEILE_CK8 check (ELEK_ANTR_JN in (0,1)),
    POST_FOLGT_JN         NUMBER(1)              default 0 not null
        constraint TKR_ZEILE_CK9 check (POST_FOLGT_JN in (0,1)),
    AKTIV_JN              NUMBER(1)              default 1 not null
        constraint TKR_ZEILE_CK10 check (AKTIV_JN in (0,1)),
    LOG_CR_TIME           DATE                   not null,
    LOG_CR_USER           VARCHAR2(30)           not null,
    LOG_UP_TIME           DATE                   not null,
    LOG_UP_USER           VARCHAR2(30)           not null,
    LOG_UP_VERS           NUMBER(7)              not null,
    LOG_CR_APPL           VARCHAR2(30)           null    ,
    LOG_UP_APPL           VARCHAR2(30)           null    ,
    constraint TKR_ZEILE_PK primary key (TKRZEILE_SEQ)
        using index
        storage
        (
        initial 10K
        next 4K
        pctincrease 0
     )
)
storage
(
initial 100K
next 40K
pctincrease 0
);

Create Sequence TKR_ZEILE_SEQ;

Create Index
  TKR_ZEILE_FK1
On
  TKR_ZEILE (MITARB_SEQ Asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  TKR_ZEILE_FK2
On
  TKR_ZEILE (TELEDTA_SEQ Asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  TKR_ZEILE_FK3
On
  TKR_ZEILE (TELEKRED_SEQ Asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

Create Index
  TKR_ZEILE_FK4
On
  TKR_ZEILE (TELETYP_SEQ Asc)
storage
(
  initial 10K
  next 4K
  pctincrease 0
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--   Foreign Key Constraints anlegen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
Alter Table
  MITARBEITER
add constraint MITARBEITER_FK1 foreign key  (ORGEINHEIT_SEQ)
  references SCHL_ORGEINHEIT (ORGEINHEIT_SEQ);

Alter Table
  MITARBEITER
add constraint MITARBEITER_FK2 foreign key  (DRUCKER_SEQ)
  references SCHL_DRUCKER (DRUCKER_SEQ);

Alter Table
  MITARBEITER
add constraint MITARBEITER_FK3 foreign key  (MITARB_SEQ_2US)
  references MITARBEITER (MITARB_SEQ);

Alter Table
  MITARBEITER
add constraint MITARBEITER_FK4 foreign key  (MITARB_SEQ_SP)
  references MITARBEITER (MITARB_SEQ);

Alter Table
  PROTOKOLL_REF
add constraint PROTOKOLL_REF_FK1 foreign key  (PROTK_SEQ)
  references PROTOKOLL_KOPF (PROTK_SEQ);

Alter Table
  PROTOKOLL_WERT
add constraint PROTOKOLL_WERT_FK1 foreign key  (PROTZ_SEQ)
  references PROTOKOLL_ZEILE (PROTZ_SEQ);

Alter Table
  PROTOKOLL_ZEILE
add constraint PROTOKOLL_ZEILE_FK1 foreign key  (PROTK_SEQ)
  references PROTOKOLL_KOPF (PROTK_SEQ);

Alter Table
  SCHL_DV_PROG_FUNKTION
add constraint SCHL_DV_PROG_FUNKTION_FK1 foreign key  (UVERF_SEQ)
  references SCHL_DV_UVERFAHREN (UVERF_SEQ);

Alter Table
  SCHL_DV_UVERFAHREN
add constraint SCHL_DV_UVERFAHREN_FK1 foreign key  (BVERF_SEQ)
  references SCHL_DV_VERF_BEREICH (BVERF_SEQ);

Alter Table
  SCHL_ORGEINHEIT
add constraint SCHL_ORGEINHEIT_FK1 foreign key  (ORGEINHEIT_SEQ_V)
  references SCHL_ORGEINHEIT (ORGEINHEIT_SEQ);

Alter Table
  SCHL_ORGEINHEIT
add constraint SCHL_ORGEINHEIT_FK2 foreign key  (HIERARCH_SEQ)
    references SCHL_HIERARCHIE (HIERARCH_SEQ);

Alter Table
  SCHL_ORGEINHEIT
add constraint SCHL_ORGEINHEIT_FK3 foreign key  (MITARB_SEQ_L)
  references MITARBEITER (MITARB_SEQ);

Alter Table
  SCHL_ORGEINHEIT
add constraint SCHL_ORGEINHEIT_FK4 foreign key  (MITARB_SEQ_V)
  references MITARBEITER (MITARB_SEQ);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--   Rechte vergeben
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
