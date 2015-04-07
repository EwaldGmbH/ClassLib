Create Or Replace Package Body KRMASK01
Is
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   DB-Paket .......:  KRMASK01 (Body)                                    **/
/**                                                                         **/
/**   Version ........:  V003 vom 07.04.2015                                **/
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
/**   Funktion ......:  Funktionen für Masken                               **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   Änderungsgeschichte                                                   **/
/**                                                                         **/
/**   Vers. Datum       Bearb.  Aenderungsgrund (lt. Antrag)                **/
/**   --------------------------------------------------------------------- **/
/**   003   07.04.2015  EWA/JH  Anpassung für Open Source.                  **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
--------------------------------------------------------------------------------
-- Funktionen                                                                 --
--------------------------------------------------------------------------------
/******************************************************************************/
/** Funktion, die den Altwert aus dem Protokoll liefert                      **/
/******************************************************************************/
/*                                                                            */
/* Rückgabe: Altwert mit festem Satzformat:                                   */
/*                                                                            */
/*         10        20        30        40        50        60 ... 254       */
/* 123456789012345678901234567890123456789012345678901234567890 ... 254       */
/* |                                                                          */
/* 12-Anzahl der gelesenen Saetze insg., evtl. mit fuehrender '0'             */
/*  |                                                                         */
/*  34-momentan leer                                                          */
/*     |                                                                      */
/*     ABCDE...-250 Zeichen beliebiger String / Altwerttext                   */
/*                                                                            */
/******************************************************************************/
    Function GET_ALTWERT
    (
        npBearblistSeq       In     BEARBEITUNG_LISTE.BEARBLIST_SEQ%Type,
        npProtzZeileSeq      In     PROTOKOLL_ZEILE.PROTZ_ZEILE_SEQ%Type,
        vspProtzTabelle      In     PROTOKOLL_ZEILE.PROTZ_TABELLE%Type,
        vspProtwSpalte       In     PROTOKOLL_WERT.PROTW_SPALTE%Type

    )
        Return  varchar2
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
        cslProtwWertReturn          Varchar2(254) := NULL;
        cslProtwWertAnz             Char(2) := '00';
        cslProtwWertFrei            Char(2) := '00';
        cslProtwWertAlt             PROTOKOLL_WERT.PROTW_WERT_ALT%Type := NULL;
        cslProtwWertFetched         PROTOKOLL_WERT.PROTW_WERT_ALT%Type := NULL;
        ilCountAltwert              Integer := 0;

--------------------------------------------------------------------------------
-- Cursor                                                                     --
--------------------------------------------------------------------------------
        Cursor clSelProtokAltwertLast Is
        -- Sinn ist es den Altwert vor juengster Änderung zu sehen
        Select
            Substr( PROTOKOLL_WERT.PROTW_WERT_ALT,1,250 )
        From
            PROTOKOLL_KOPF,
            PROTOKOLL_WERT,
            PROTOKOLL_ZEILE
        Where
            PROTOKOLL_KOPF.PROTK_SEQ = PROTOKOLL_ZEILE.PROTK_SEQ And
            PROTOKOLL_ZEILE.PROTZ_SEQ = PROTOKOLL_WERT.PROTZ_SEQ And
            (
                (
                    PROTOKOLL_WERT.PROTW_WERT_ALT Is Null And
                    PROTOKOLL_WERT.PROTW_WERT_NEU Is Not Null
                ) Or
                (
                    PROTOKOLL_WERT.PROTW_WERT_ALT Is Not Null And
                    PROTOKOLL_WERT.PROTW_WERT_NEU Is Null
                ) Or
                PROTOKOLL_WERT.PROTW_WERT_ALT != PROTOKOLL_WERT.PROTW_WERT_NEU
            ) And
            PROTOKOLL_ZEILE.PROTZ_TABELLE = vspProtzTabelle And
            PROTOKOLL_ZEILE.PROTZ_ZEILE_SEQ = npProtzZeileSeq And
            PROTOKOLL_WERT.PROTW_SPALTE = vspProtwSpalte
        Order By
            PROTOKOLL_KOPF.LOG_CR_TIME Desc;

        Cursor clSelProtokAltwertFirst Is
        -- Sinn ist es den Altwert im 'Urzustand' auszulesen (= erste Aenderung)
        Select
            Substr( PROTOKOLL_WERT.PROTW_WERT_ALT,1,250 )
        From
            PROTOKOLL_KOPF,
            PROTOKOLL_WERT,
            PROTOKOLL_ZEILE,
            DVPROGV_REF_PROTK,
            BEARBEITUNG_LISTE
        Where
            PROTOKOLL_KOPF.PROTK_SEQ = PROTOKOLL_ZEILE.PROTK_SEQ And
            PROTOKOLL_ZEILE.PROTZ_SEQ = PROTOKOLL_WERT.PROTZ_SEQ And
            PROTOKOLL_KOPF.PROTK_SEQ = DVPROGV_REF_PROTK.PROTK_SEQ And
            DVPROGV_REF_PROTK.DVPROGV_SEQ = BEARBEITUNG_LISTE.DVPROGV_SEQ And
            (
                (
                    PROTOKOLL_WERT.PROTW_WERT_ALT Is Null And
                    PROTOKOLL_WERT.PROTW_WERT_NEU Is Not Null
                ) Or
                (
                    PROTOKOLL_WERT.PROTW_WERT_ALT Is Not Null And
                    PROTOKOLL_WERT.PROTW_WERT_NEU Is Null
                ) Or
                PROTOKOLL_WERT.PROTW_WERT_ALT != PROTOKOLL_WERT.PROTW_WERT_NEU
            ) And
            PROTOKOLL_ZEILE.PROTZ_TABELLE = vspProtzTabelle And
            PROTOKOLL_ZEILE.PROTZ_ZEILE_SEQ = npProtzZeileSeq And
            PROTOKOLL_WERT.PROTW_SPALTE = vspProtwSpalte And
            BEARBEITUNG_LISTE.BEARBLIST_SEQ = npBearblistSeq
        Order By
            PROTOKOLL_KOPF.log_cr_time Asc;

--------------------------------------------------------------------------------
-- Cursor                                                                     --
--------------------------------------------------------------------------------
    Begin
    -- je nachdem, ob eine Bearbeitungslisten Sequenze mitgegeben wird oder nicht
    -- wird entschieden, welcher Altwert gelesen werden soll
        Begin
            If
                npBearblistSeq Is Null
            Then
            -- Sinn ist es den ALtwert vor letzter Änderung zu sehen
                Open clSelProtokAltwertLast;
                Loop
                    Fetch clSelProtokAltwertLast Into cslProtwWertFetched;
                    Exit When
                        clSelProtokAltwertLast %NOTFOUND Or
                        clSelProtokAltwertLast %NOTFOUND Is Null;

                    ilCountAltwert := ilCountAltwert + 1;
                    If
                        ilCountAltwert = 1
                    Then
                        cslProtwWertAlt := cslProtwWertFetched;
                    End If;
                End Loop;
                Close clSelProtokAltwertLast;
            Else
            -- Sinn ist es den Altwert im 'Urzustand' auszulesen (= erste Änderung)
                Open clSelProtokAltwertFirst;
                Loop
                    Fetch clSelProtokAltwertFirst Into cslProtwWertFetched;
                    Exit When
                        clSelProtokAltwertFirst %NOTFOUND Or
                        clSelProtokAltwertFirst %NOTFOUND Is Null;

                    ilCountAltwert := ilCountAltwert + 1;
                    If
                        ilCountAltwert = 1
                    Then
                        cslProtwWertAlt := cslProtwWertFetched;
                    End If;
                End Loop;
                Close clSelProtokAltwertFirst;
            End If;

            cslProtwWertAnz  := Lpad( ilCountAltwert,2,'0' );
            cslProtwWertFrei := '00';
            cslProtwWertReturn :=  cslProtwWertAnz ||
                                   cslProtwWertFrei ||
                                   cslProtwWertAlt;
            Exception
                When Others Then
                    cslProtwWertReturn := NULL ;
        End;

        Return cslProtwWertReturn;

    End GET_ALTWERT;
End KRMASK01;

