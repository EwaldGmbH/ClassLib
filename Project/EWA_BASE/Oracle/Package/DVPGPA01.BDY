Create Or Replace Package Body DVPGPA01
Is
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   DB-Paket .......:  DVPGPA01 (Body)                                    **/
/**                                                                         **/
/**   Version ........:  V002 vom 07.04.2015                                **/
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
/**   Funktion .......:  Ermitteln von Programmparametern und Werten        **/
/**                      Wird der Parameter nicht gefunden Neuanlage        **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   Änderungsgeschichte                                                   **/
/**                                                                         **/
/**   Vers. Datum       Bearb.  Aenderungsgrund (lt. Antrag)                **/
/**   --------------------------------------------------------------------- **/
/**   002   07.04.2015  EWA/JH  Anpassung für Open Source.                  **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
--------------------------------------------------------------------------------
-- Globale Typen (body only)                                                  --
--------------------------------------------------------------------------------
    rowDvProgParamType       DV_PROG_PARAM%ROWTYPE;
    rowDvProgParamWertType   DV_PROG_PARAM_WERT%ROWTYPE;

    TYPE recDvProgParamType  IS        record   (
      DVPROGP_PROG      DV_PROG_PARAM.DVPROGP_PROG%type,
      DVPROGP_NR        DV_PROG_PARAM.DVPROGP_NR%type,
      DVPROGP_BEZ       DV_PROG_PARAM.DVPROGP_BEZ%type,
      DVPROGP_VALUETYP  DV_PROG_PARAM.DVPROGP_VALUETYP%type,
      DVPROGPW_SORT     DV_PROG_PARAM_WERT.DVPROGPW_SORT%type,
      DVPROGPW_VALUE_A  DV_PROG_PARAM_WERT.DVPROGPW_VALUE_A%type,
      DVPROGPW_VALUE_D  DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D%type,
      DVPROGPW_VALUE_N  DV_PROG_PARAM_WERT.DVPROGPW_VALUE_N%type,
      GUELTIG_VON_DAT   DV_PROG_PARAM_WERT.GUELTIG_VON_DAT%type,
      GUELTIG_BIS_DAT   DV_PROG_PARAM_WERT.GUELTIG_BIS_DAT%type );

    TYPE recSEL_DvProgParamType  IS        record   (
      DVPROGP_PROG      DV_PROG_PARAM.DVPROGP_PROG%type,
      DVPROGP_NR        DV_PROG_PARAM.DVPROGP_NR%type,
      DVPROGP_BEZ       DV_PROG_PARAM.DVPROGP_BEZ%type,
      DVPROGP_VALUETYP  DV_PROG_PARAM.DVPROGP_VALUETYP%type,
      GUELTIG_VON_DAT   DV_PROG_PARAM_WERT.GUELTIG_VON_DAT%type,
      GUELTIG_BIS_DAT   DV_PROG_PARAM_WERT.GUELTIG_BIS_DAT%type );

    TYPE recSEL_DvProgParamReturnType  IS  record   (
      DVPROGPW_SORT     DV_PROG_PARAM_WERT.DVPROGPW_SORT%type,
      DVPROGPW_VALUE_A  DV_PROG_PARAM_WERT.DVPROGPW_VALUE_A%type,
      DVPROGPW_VALUE_D  DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D%type,
      DVPROGPW_VALUE_N  DV_PROG_PARAM_WERT.DVPROGPW_VALUE_N%type );

--------------------------------------------------------------------------------
-- Globale Konstanten                                                         --
--------------------------------------------------------------------------------
    ngDVPGPA01_TypAlpha          constant integer := 1;
    ngDVPGPA01_TypDate           constant integer := 2;
    ngDVPGPA01_TypNumber         constant integer := 3;
    ngDVPGPA01_TypTime           constant integer := 4;

--------------------------------------------------------------------------------
-- Globale Variablen                                                          --
--------------------------------------------------------------------------------
    dtgDateCurrent   date := to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss');
    dtgDateDummy     date := to_date('01.01.0001 00:00:00','dd.mm.yyyy hh24:mi:ss');

--------------------------------------------------------------------------------
-- Prozedurdeklarationen (Intern)                                             --
--------------------------------------------------------------------------------
/******************************************************************************/
/** FUNKTION zum Lesen von PROGRAMMPARAMETER-WERTEN                          **/
/**   Parameter:   Einlesestruktur .userdefined record (IN) s. globale Typen **/
/**                Werte-array (OUT), gelesene Werte v. Typ 'alphanumerisch' **/
/**                Werte-array (OUT), gelesene Werte v. Typ 'Datum'/'Uhrzeit'**/
/**                Werte-array (OUT), gelesene Werte v. Typ 'numerisch'      **/
/**                Index für Werte-Array (IN)                                **/
/******************************************************************************/
    function SEL_DvProgParamWert
    (
     recpDvProgParam     in     recSEL_DvProgParamType,
     vspDvprogpwValueA      out DvProgpwValueAType,
     dtpDvprogpwValueD      out DvProgpwValueDType,
     npDvprogpwValueN       out DvProgpwValuenType,
     npAnzahlParam       in out number
    )
        return boolean
    is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'SEL_DvProgParamWert' ;
    iPos                 integer := 1;
    nlAnzahl_in          number  := npAnzahlParam;
    blOk                 boolean := FALSE;

    reclSEL              recSEL_DvProgParamReturnType;

    CURSOR curParamAll ( vspDvprogpProg_in      in     DV_PROG_PARAM.DVPROGP_PROG%type,
                         npDvprogpNr_in         in     DV_PROG_PARAM.DVPROGP_NR%type,
                         npDvprogpValuetyp_in   in     DV_PROG_PARAM.DVPROGP_VALUETYP%type,
                         dtpGueltigVonDat_in    in     DV_PROG_PARAM_WERT.GUELTIG_VON_DAT%type,
                         dtpGueltigBisDat_in    in     DV_PROG_PARAM_WERT.GUELTIG_BIS_DAT%type )
    RETURN recSEL_DvProgParamReturnType
        IS
    select DV_PROG_PARAM_WERT.DVPROGPW_SORT,
           DV_PROG_PARAM_WERT.DVPROGPW_VALUE_A,
           DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D,
           DV_PROG_PARAM_WERT.DVPROGPW_VALUE_N
      from DV_PROG_PARAM_WERT, DV_PROG_PARAM
     where DV_PROG_PARAM_WERT.DVPROGP_SEQ = DV_PROG_PARAM.DVPROGP_SEQ
       and DV_PROG_PARAM.DVPROGP_PROG = vspDvprogpProg_in
       and DV_PROG_PARAM.DVPROGP_NR = npDvprogpNr_in
       and DV_PROG_PARAM.DVPROGP_VALUETYP = npDvprogpValuetyp_in
       and DV_PROG_PARAM.AKTIV_JN = 1
       and DV_PROG_PARAM_WERT.AKTIV_JN = 1
       and (DV_PROG_PARAM_WERT.GUELTIG_VON_DAT <= dtpGueltigVonDat_in
        or DV_PROG_PARAM_WERT.GUELTIG_VON_DAT is null)
       and (DV_PROG_PARAM_WERT.GUELTIG_BIS_DAT >= dtpGueltigBisDat_in
        or DV_PROG_PARAM_WERT.GUELTIG_BIS_DAT is null)
  order by DV_PROG_PARAM_WERT.DVPROGPW_SORT,
           DV_PROG_PARAM_WERT.GUELTIG_BIS_DAT,
           DV_PROG_PARAM_WERT.DVPROGPW_SEQ;

    begin
      ----DVTRACE.Call_Beg( slTraceFunName );

      OPEN curParamAll(recpDvProgParam.DVPROGP_PROG,
                       recpDvProgParam.DVPROGP_NR,
                       recpDvProgParam.DVPROGP_VALUETYP,
                       recpDvProgParam.GUELTIG_VON_DAT,
                       recpDvProgParam.GUELTIG_BIS_DAT );
        LOOP
          FETCH        curParamAll INTO     reclSEL;
          EXIT WHEN curParamAll%NOTFOUND OR curParamAll%NOTFOUND IS NULL;
          --DVTRACE.Call_Trace ( ' iPos := '|| iPos );

          if recpDvProgParam.DVPROGP_VALUETYP = ngDVPGPA01_TypAlpha then
            vspDvprogpwValueA(iPos) :=  reclSEL.DVPROGPW_VALUE_A;
            --DVTRACE.Call_Trace ( '  vspDvprogpwValueA(i) :='|| vspDvprogpwValueA(iPos)  );
          elsif recpDvProgParam.DVPROGP_VALUETYP = ngDVPGPA01_TypDate
               or recpDvProgParam.DVPROGP_VALUETYP = ngDVPGPA01_TypTime then
            dtpDvprogpwValueD(iPos) :=  reclSEL.DVPROGPW_VALUE_D;
            --DVTRACE.Call_Trace ( '  dtpDvprogpwValueD(i) :='|| to_char( dtpDvprogpwValueD(iPos), 'dd.mm.yyyy hh24:mi:ss')  );
          elsif recpDvProgParam.DVPROGP_VALUETYP = ngDVPGPA01_TypNumber then
            npDvprogpwValueN(iPos)  :=  reclSEL.DVPROGPW_VALUE_N;
            --DVTRACE.Call_Trace ( '  npDvprogpwValueN(i) :='|| npDvprogpwValueN(iPos)  );
          end if;

          blOk := TRUE;

          iPos := iPos + 1; -- erhöhen: naechster gefetchter ist iPos-ter Satz ...

        END LOOP;
      CLOSE curParamAll;

      iPos := iPos - 1; -- um den letzten korrigieren!

      if iPos = 0 then  -- heisst nix gelesen
        npAnzahlParam := nlAnzahl_in; -- Input-Wert zurücksgeben
      else
        npAnzahlParam := iPos ; -- neuen Wert zurückgeben
      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      --DVTRACE.Call_End( slTraceFunName );
      return  blOk;
    end;


/******************************************************************************/
/** Funktion für die Neuanlage eines Programmparameter-Werts                 **/
/**   Parameter:   Insertstruktur .rowtype (IN) Tabelle DV_PROG_PARAM_WERT   **/
/******************************************************************************/
    Function INS_DvProgParamWert
    (
     rowpDvProgParamWert          in  rowDvProgParamWertType%TYPE
    )
        Return boolean
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    blOk                 boolean := FALSE;
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'INS_DvProgParamWert' ;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      /*DVTRACE.Call_Trace ( ' .DVPROGPW_SORT :='|| rowpDvProgParamWert.DVPROGPW_SORT ||'
 .GUELTIG_VON_DAT :='|| to_char(rowpDvProgParamWert.GUELTIG_VON_DAT,'dd.mm.yyyy') ||'
 .GUELTIG_BIS_DAT :='|| to_char(rowpDvProgParamWert.GUELTIG_BIS_DAT,'dd.mm.yyyy') ||'
 .DVPROGPW_VALUE_A :='|| rowpDvProgParamWert.DVPROGPW_VALUE_A ||'
 .DVPROGPW_VALUE_D :='|| to_char(rowpDvProgParamWert.DVPROGPW_VALUE_D,'dd.mm.yyyy hh24:mi:ss')||'
 .DVPROGPW_VALUE_N :='|| to_char(rowpDvProgParamWert.DVPROGPW_VALUE_N) );*/

      insert into DV_PROG_PARAM_WERT
      ( DVPROGPW_SEQ,
        DVPROGP_SEQ,
        DVPROGPW_SORT,
        DVPROGPW_VALUE_A,
        DVPROGPW_VALUE_D,
        DVPROGPW_VALUE_N,
        GUELTIG_VON_DAT,
        GUELTIG_BIS_DAT
      ) values (
        DV_PROG_PARAM_WERT_SEQ.nextval,
        DV_PROG_PARAM_SEQ.currval,
        rowpDvProgParamWert.DVPROGPW_SORT,
        rowpDvProgParamWert.DVPROGPW_VALUE_A,
        rowpDvProgParamWert.DVPROGPW_VALUE_D,
        rowpDvProgParamWert.DVPROGPW_VALUE_N,
        rowpDvProgParamWert.GUELTIG_VON_DAT,
        rowpDvProgParamWert.GUELTIG_BIS_DAT ) ;

      blOk := TRUE;
      --DVTRACE.Call_End( slTraceFunName );
      return blOk;
    End;

/******************************************************************************/
/** Prozedur für die Neuanlage eines Programmparameters                      **/
/**   Parameter:   Insertstruktur .rowtype (IN) Tabelle DV_PROG_PARAM        **/
/******************************************************************************/
    Function INS_DvProgParam
    (
     rowpDvProgParam          in  rowDvProgParamType%TYPE
    )
        Return boolean
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    blOk                 boolean := FALSE;
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'INS_DvProgParam' ;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      /*DVTRACE.Call_Trace ( ' .DVPROGP_BEZ := '|| rowpDvProgParam.DVPROGP_BEZ ||'
 .DVPROGP_PROG := '|| rowpDvProgParam.DVPROGP_PROG ||'
 .DVPROGP_NR := '|| rowpDvProgParam.DVPROGP_NR ||'
 .DVPROGP_VALUETYP := '|| rowpDvProgParam.DVPROGP_VALUETYP );*/

      insert into DV_PROG_PARAM
      ( DVPROGP_SEQ,
        DVPROGP_BEZ,
        DVPROGP_PROG,
        DVPROGP_NR,
        DVPROGP_VALUETYP
      ) values (
        DV_PROG_PARAM_SEQ.nextval,
        rowpDvProgParam.DVPROGP_BEZ,
        rowpDvProgParam.DVPROGP_PROG,
        rowpDvProgParam.DVPROGP_NR,
        rowpDvProgParam.DVPROGP_VALUETYP ) ;

      blOk := TRUE;
      --DVTRACE.Call_End( slTraceFunName );
      return blOk;
    End;

/******************************************************************************/
/** Funktion, ermitteln / erzeugen eines Alphanumerischen Parameters         **/
/**   Parameter:   Einlesestruktur .userdefined record (IN) s. globale Typen **/
/**                Werte-array (IN/OUT), Werte v. Typ 'alphanumerisch'       **/
/**                Werte-array (IN/OUT), Werte v. Typ 'Datum'/'Uhrzeit'      **/
/**                Werte-array (IN/OUT), Werte v. Typ 'numerisch'            **/
/**                Index für Werte-Array (IN)                                **/
/******************************************************************************/
    Function GET_DvProgParamValue
    (
     recpSEL_DvProgpw    in     recSEL_DvProgParamType,
     vspDvprogpwValueA   in out DvProgpwValueAType,
     dtpDvprogpwValueD   in out DvProgpwValueDType,
     npDvprogpwValueN    in out DvProgpwValueNType,
     npAnzahlParam       in out number,
     npCommitJn          in     number
    )
        Return boolean
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_DvProgParamValue' ;

    blOk                     boolean := FALSE;
    rowlINS_DvProgParam      rowDvProgParamType%TYPE;
    rowlINS_DvProgParamWert  rowDvProgParamWertType%TYPE;

    vslDvprogpwValueA_def   DvProgpwValueAType;
    dtlDvprogpwValueD_def   DvProgpwValueDType;
    nlDvprogpwValueN_def    DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Verarbeitung                                                               --
--------------------------------------------------------------------------------
      vslDvprogpwValueA_def   := vspDvprogpwValueA;
      dtlDvprogpwValueD_def   := dtpDvprogpwValueD;
      nlDvprogpwValueN_def    := npDvprogpwValueN;

      --------------------------------------------------------------------------
      -- Parameter lesen    (ein oder alle)                                   --
      --------------------------------------------------------------------------
      if SEL_DvProgParamWert( recpSEL_DvProgpw,
                              vspDvprogpwValueA,
                              dtpDvprogpwValueD,
                              npDvprogpwValueN,
                              npAnzahlParam  ) = TRUE then
        -- Lesen erfolgreich!
        blOk := TRUE;
        --DVTRACE.Call_Trace ( ' *g*efunden!' );

    /*    for i in 1..npAnzahlParam loop
          if recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypAlpha then
            DVTRACE.Call_Trace ( ' vspDvProgpwValueA(i) := '|| vspDvprogpwValueA(i) );
          elsif recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypDate
              or recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypTime then
            DVTRACE.Call_Trace ( ' dtpDvprogpwValueD(i) := '|| to_char(dtpDvprogpwValueD(i),'dd.mm.yyyy hh24:mi:ss') );
          elsif recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypNumber then
            DVTRACE.Call_Trace ( ' npDvProgpwValueN(i) := '|| npDvprogpwValueN(i) );
          end if;
        end loop;*/

      else -- NEUANLAGE
        --DVTRACE.Call_Trace ( ' *Neu*anlage!' );
        blOk := FALSE;

        for i in 1..npAnzahlParam loop
          ----------------------------------------------------------------------
          -- alle Parameter neu anlegen                                            --
          ----------------------------------------------------------------------
          rowlINS_DvProgParam.DVPROGP_BEZ      := recpSEL_DvProgpw.DVPROGP_BEZ;
          rowlINS_DvProgParam.DVPROGP_PROG     := recpSEL_DvProgpw.DVPROGP_PROG;
          rowlINS_DvProgParam.DVPROGP_NR       := recpSEL_DvProgpw.DVPROGP_NR;
          rowlINS_DvProgParam.DVPROGP_VALUETYP := recpSEL_DvProgpw.DVPROGP_VALUETYP;

          if  i = 1  then -- nur einmal den  H e a d e r  anlegen
            blOk := INS_DvProgParam( rowlINS_DvProgParam );
          end if;

          if blOk = TRUE then
            --DVTRACE.Call_Trace ( 'nach INS_DvProgParam i -> '|| i );
/*            if recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypAlpha then
              --DVTRACE.Call_Trace ( ' vslDvprogpwValueA_def(i)= '|| vslDvprogpwValueA_def(i) );
            elsif recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypDate then
              --DVTRACE.Call_Trace ( ' dtlDvprogpwValueD_def(i)= '|| to_char(dtlDvprogpwValueD_def(i),'dd.mm.yyyy hh24:mi:ss') );
            elsif recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypTime then
              --DVTRACE.Call_Trace ( ' dtlDvprogpwValueD_def(i)= '|| to_char(dtlDvprogpwValueD_def(i),'dd.mm.yyyy hh24:mi:ss') );
            elsif recpSEL_DvProgpw.DVPROGP_VALUETYP = ngDVPGPA01_TypNumber then
              --DVTRACE.Call_Trace ( ' nlDvprogpwValueN_def(i)= '|| nlDvprogpwValueN_def(i) );
            end if;*/

            if npAnzahlParam = 1      then
              rowlINS_DvProgParamWert.DVPROGPW_SORT    := NULL ;
            else
              rowlINS_DvProgParamWert.DVPROGPW_SORT    := i ;
            end if;

            rowlINS_DvProgParamWert.DVPROGPW_VALUE_A := vslDvprogpwValueA_def(i);
            rowlINS_DvProgParamWert.DVPROGPW_VALUE_D := dtlDvprogpwValueD_def(i);
            rowlINS_DvProgParamWert.DVPROGPW_VALUE_N := nlDvprogpwValueN_def(i);

            --------------------------------------------------------------------
            -- Parameterwert neu anlegen                                      --
            --------------------------------------------------------------------
            if blOk = TRUE then
              blOk := INS_DvProgParamWert( rowlINS_DvProgParamWert );
              If blOk = FALSE then
                -- Fehler beim Anlegen des Parameter-Werts
                blOk := FALSE;
                vspDvprogpwValueA(i) := NULL;
                dtpDvprogpwValueD(i) := NULL;
                npDvprogpwValueN(i) := NULL;
              else -- Rückgabestruktur versorgen...
                vspDvprogpwValueA(i) := rowlINS_DvProgParamWert.DVPROGPW_VALUE_A;
                dtpDvprogpwValueD(i) := rowlINS_DvProgParamWert.DVPROGPW_VALUE_D;
                npDvprogpwValueN(i) := rowlINS_DvProgParamWert.DVPROGPW_VALUE_N;
              end if;
            end if;
          end if;

          exit when (i = npAnzahlParam)
                 OR (blOk = FALSE); --Ausstieg, aber immer mindesten einmal durchlaufen

        end loop;

        -- NAch der Neuanlage, falls gewünscht committen
        if blOk = TRUE and npCommitJn = 1 then
           commit;
        end if;

      end if;-- NEUANLAGE

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      --DVTRACE.Call_End( slTraceFunName ) ;
      return blOk;
    End;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Prozedurdeklarationen (Externe)                                            --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

/******************************************************************************/
/** Funktion, ermitteln / erzeugen eines Alphanumerischen Parameters         **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Default-Wert für Prog.Parameter (IN)                      **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Rückgabe-Wert für Prog.Parameter (OUT)                    **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_StrOneDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        vspDefaultValueA     In        DV_PROG_PARAM_WERT.DVPROGPW_VALUE_A%Type,
        npCommitJn           In        number,
        vspDvProgpwValueA    Out       DV_PROG_PARAM_WERT.DVPROGPW_VALUE_A%Type,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_StrOneDvProgParamValue';

    blOk                 boolean := FALSE;
    nlAnzahlParam        integer := 1;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValuedType;
    nlDvprogpwValueN     DvProgpwValuenType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr := '|| npDvProgpNr ||' vspDvProgpProg := '|| vspDvProgpProg ||'  vspDvProgpBez := '|| vspDvProgpBez ||' vspDefaultValueA := '|| vspDefaultValueA );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypAlpha;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      for i in 1..nlAnzahlParam loop
      --------------------------------------------------------------------------
      --  arrays initialisieren, NO_DATA_FOUND vermeiden                      --
      --------------------------------------------------------------------------
        --DVTRACE.Call_Trace ( 'Init der arrays i := '|| i );
        if i = nlAnzahlParam then
          vslDvprogpwValueA(nlAnzahlParam) := vspDefaultValueA;
        else
          vslDvprogpwValueA(nlAnzahlParam) := NULL;
        end if;
        dtlDvprogpwValueD(i) := NULL;
        nlDvprogpwValueN(i)  := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung                                                               --
--------------------------------------------------------------------------------
      If GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                nlAnzahlParam,
                                npCommitJn ) = TRUE then
        blOk := TRUE;
        vspDvProgpwValueA :=  vslDvprogpwValueA(nlAnzahlParam);

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      else
        npError := 1;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        --DVTRACE.Call_TraceError( slTraceFunName ||' fehlgeschlagen: '|| SQLERRM );
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));
    End;

/******************************************************************************/
/** Funktion, ermitteln / erzeugen mehrerer Alphanumerischer Parameter       **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Index für Anzahl der Werte im array (IN/OUT)              **/
/**                Werte array (IN/OUT)                                      **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_StrAllDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        npCommitJn           In        number,
        npAnzahlValues       In Out    number,
        vspDvProgpwValueA    In Out    DvProgpwValueAType,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_StrAllDvProgParamValue' ;
    blOk                 boolean := FALSE;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr :='|| npDvProgpNr );
      --DVTRACE.Call_Trace ( ' vspDvProgpProg :='|| vspDvProgpProg );
      --DVTRACE.Call_Trace ( ' vspDvProgpBez :='|| vspDvProgpBez );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypAlpha;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      for i in 1..npAnzahlValues loop
        --DVTRACE.Call_Trace ( ' vspDvProgpwValueA[i] :='|| vspDvProgpwValueA(i) ||' !Centura[i]');
        ------------------------------------------------------------------------
        --  arrays initialisieren, NO_DATA_FOUND vermeiden                    --
        ------------------------------------------------------------------------
        vslDvprogpwValueA(i) := vspDvProgpwValueA(i);
        dtlDvprogpwValueD(i) := NULL;
        nlDvprogpwValueN(i) := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung über alle Werte                                               --
--------------------------------------------------------------------------------

      if GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                npAnzahlValues,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        vspDvProgpwValueA :=  vslDvprogpwValueA;

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;
--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));
    End;

/******************************************************************************/
/** Funktion, ermitteln / erzeugen eines Numerischen Parameters              **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Default-Wert für Prog.Parameter (IN)                      **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Rückgabe-Wert für Prog.Parameter (OUT)                    **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_NumOneDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        npDefaultValueN      In        DV_PROG_PARAM_WERT.DVPROGPW_VALUE_N%Type,
        npCommitJn           In        number,
        npDvProgpwValueN     Out       DV_PROG_PARAM_WERT.DVPROGPW_VALUE_N%Type,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_NumOneDvProgParamValue';

    blOk                 boolean := FALSE;
    nlAnzahlParam        integer := 1;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr := '|| npDvProgpNr ||' vspDvProgpProg := '|| vspDvProgpProg ||' vspDvProgpBez := '|| vspDvProgpBez ||' npDefaultValueN := '|| to_char(npDefaultValueN) );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypNumber;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      -- Init auf maximal benötigte Anzahl von Elementen,
      -- damit keine NO_DATA_FOUND-Exception, wenn Element nicht initialisiert
      for i in 1..nlAnzahlParam loop
        --DVTRACE.Call_Trace ( 'Init der arrays i := '|| i );
        if i = nlAnzahlParam then
          nlDvprogpwValueN(nlAnzahlParam) := npDefaultValueN;
        else
          nlDvprogpwValueN(nlAnzahlParam) := NULL;
        end if;
        dtlDvprogpwValueD(i) := NULL;
        vslDvprogpwValueA(i)  := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung                                                               --
--------------------------------------------------------------------------------
      If GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                nlAnzahlParam,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        npDvProgpwValueN :=  nlDvprogpwValueN(nlAnzahlParam);

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        --DVTRACE.Call_TraceError( slTraceFunName ||' fehlgeschlagen: '|| SQLERRM );
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));
    End;

/******************************************************************************/
/** Funktion, ermitteln mehrerer Numerischer Parameter                       **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Index für Anzahl der Werte im array (IN/OUT)              **/
/**                Werte array (IN/OUT)                                      **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_NumAllDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        npCommitJn           In        number,
        npAnzahlValues       In Out    number,
        npDvProgpwValueN     In Out    DvProgpwValueNType,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_NumAllDvProgParamValue' ;
    blOk                 boolean := FALSE;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr :='|| npDvProgpNr );
      --DVTRACE.Call_Trace ( ' vspDvProgpProg :='|| vspDvProgpProg );
      --DVTRACE.Call_Trace ( ' vspDvProgpBez :='|| vspDvProgpBez );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypNumber;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      for i in 1..npAnzahlValues loop
        --DVTRACE.Call_Trace ( ' npDvProgpwValueN[i] :='|| npDvProgpwValueN(i) ||' !Centura[i]');
        ------------------------------------------------------------------------
        --  arrays initialisieren, NO_DATA_FOUND vermeiden                    --
        ------------------------------------------------------------------------
        nlDvprogpwValueN(i) := npDvProgpwValueN(i);
        dtlDvprogpwValueD(i) := NULL;
        vslDvprogpwValueA(i) := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung über alle Werte                                               --
--------------------------------------------------------------------------------

      if GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                npAnzahlValues,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        npDvProgpwValueN :=  nlDvprogpwValueN;

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));

    End;

/******************************************************************************/
/** Funktion, ermitteln / erzeugen eines Datum-Parameters                    **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Default-Wert für Prog.Parameter (IN)                      **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Rückgabe-Wert für Prog.Parameter (IN)                     **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_DateOneDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        dtpDefaultValueD     In        DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D%Type,
        npCommitJn           In        number,
        dtpDvProgpwValueD    Out       DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D%Type,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_DateOneDvProgParamValue';

    blOk                 boolean := FALSE;
    nlAnzahlParam        integer := 1;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr := '|| npDvProgpNr ||' vspDvProgpProg := '|| vspDvProgpProg ||' vspDvProgpBez := '|| vspDvProgpBez ||' dtpDefaultValueD := '|| to_char(dtpDefaultValueD,'dd.mm.yyyy hh24:mi:ss') );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypDate;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      -- Init auf maximal benötigte Anzahl von Elementen,
      -- damit keine NO_DATA_FOUND-Exception, wenn Element nicht initialisiert
      for i in 1..nlAnzahlParam loop
        --DVTRACE.Call_Trace ( 'Init der arrays i := '|| i );
        if i = nlAnzahlParam then
          dtlDvprogpwValueD(nlAnzahlParam) :=
            to_date(to_char(dtpDefaultValueD,'dd.mm.yyyy'), 'dd.mm.yyyy');
        else
          dtlDvprogpwValueD(nlAnzahlParam) := NULL;
        end if;
      --DVTRACE.Call_Trace ( ' dtlDvprogpwValueD(nlAnzahlParam) := '|| to_char(dtlDvprogpwValueD(nlAnzahlParam),'dd.mm.yyyy hh24:mi:ss') );
        nlDvprogpwValueN(i) := NULL;
        vslDvprogpwValueA(i)  := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung                                                               --
--------------------------------------------------------------------------------
      If GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                nlAnzahlParam,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        dtpDvProgpwValueD :=  dtlDvprogpwValueD(nlAnzahlParam);

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));

    End;

/******************************************************************************/
/** Funktion, ermitteln mehrerer Datum-Parameter                             **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Index für Anzahl der Werte im array (IN/OUT)              **/
/**                Werte array (IN/OUT)                                      **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_DateAllDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        npCommitJn           In        number,
        npAnzahlValues       In Out    number,
        dtpDvProgpwValueD    In Out    DvProgpwValueDType,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_DateAllDvProgParamValue' ;
    blOk                 boolean := FALSE;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr :='|| npDvProgpNr );
      --DVTRACE.Call_Trace ( ' vspDvProgpProg :='|| vspDvProgpProg );
      --DVTRACE.Call_Trace ( ' vspDvProgpBez :='|| vspDvProgpBez );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypDate;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      for i in 1..npAnzahlValues loop
        --DVTRACE.Call_Trace ( ' dtpDvProgpwValueD[i] :='|| dtpDvProgpwValueD(i) ||' !Centura[i]');
        ------------------------------------------------------------------------
        --  arrays initialisieren, NO_DATA_FOUND vermeiden                    --
        ------------------------------------------------------------------------
        nlDvprogpwValueN(i) := NULL;
        dtlDvprogpwValueD(i) :=
          to_date(to_char(dtpDvProgpwValueD(i),'dd.mm.yyyy'), 'dd.mm.yyyy');
        vslDvprogpwValueA(i) := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung über alle Werte                                               --
--------------------------------------------------------------------------------
      if GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                npAnzahlValues,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        dtpDvProgpwValueD :=  dtlDvprogpwValueD;

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));
    end;

/******************************************************************************/
/** Funktion, ermitteln / erzeugen eines Uhrzeit-Parameters                  **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Default-Wert für Prog.Parameter (IN)                      **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Rückgabe-Wert für Prog.Parameter (OUT)                    **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_TimeOneDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        dtpDefaultValueU     In        DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D%Type,
        npCommitJn           In        number,
        dtpDvProgpwValueU    Out       DV_PROG_PARAM_WERT.DVPROGPW_VALUE_D%Type,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_TimeOneDvProgParamValue';

    blOk                 boolean := FALSE;
    nlAnzahlParam        integer := 1;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr := '|| npDvProgpNr ||' vspDvProgpProg := '|| vspDvProgpProg ||' vspDvProgpBez := '|| vspDvProgpBez ||' dtpDefaultValueU := '|| to_char(dtpDefaultValueU,'dd.mm.yyyy hh24:mi:ss') );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypTime;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      -- Init auf maximal benötigte Anzahl von Elementen,
      -- damit keine NO_DATA_FOUND-Exception, wenn Element nicht initialisiert
      for i in 1..nlAnzahlParam loop
        --DVTRACE.Call_Trace ( 'Init der arrays i := '|| i );
        if i = nlAnzahlParam then
          dtlDvprogpwValueD(nlAnzahlParam) := to_date( to_char(dtgDateDummy,'dd.mm.yyyy')
                                              ||' '||
                                              to_char(dtpDefaultValueU, 'hh24:mi:ss'),
                                              'dd.mm.yyyy hh24:mi:ss' );
        else
          dtlDvprogpwValueD(nlAnzahlParam) := NULL;
        end if;
        --DVTRACE.Call_Trace ( 'dtpDefaultValueD := '|| to_char(dtlDvprogpwValueD(nlAnzahlParam),'dd.mm.yyyy hh24:mi:ss') );
        nlDvprogpwValueN(i) := NULL;
        vslDvprogpwValueA(i) := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung                                                               --
--------------------------------------------------------------------------------
      If GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                nlAnzahlParam,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        dtpDvProgpwValueU :=  dtlDvprogpwValueD(nlAnzahlParam);

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));

    End;

/******************************************************************************/
/** Funktion, ermitteln mehrerer Uhrzeit-Parameter                           **/
/**   Parameter:   Prog.Parameter Nummer (IN)                                **/
/**                Prog.Parameter Context (IN)                               **/
/**                Prog.Parameter Bezeichnung (IN)                           **/
/**                Flag, ob Package committen soll (IN)                      **/
/**                Index für Anzahl der Werte im array (IN/OUT)              **/
/**                Werte array (IN/OUT)                                      **/
/**                Fehlernummer (OUT)                                        **/
/******************************************************************************/
    Procedure GET_TimeAllDvProgParamValue
    (
        npDvProgpNr          In        DV_PROG_PARAM.DVPROGP_NR%Type,
        vspDvProgpProg       In        DV_PROG_PARAM.DVPROGP_PROG%Type,
        vspDvProgpBez        In        DV_PROG_PARAM.DVPROGP_BEZ%Type,
        npCommitJn           In        number,
        npAnzahlValues       In Out    number,
        dtpDvProgpwValueU    In Out    DvProgpwValueDType,
        npError              Out       number
    )
    Is
--------------------------------------------------------------------------------
-- Variablen                                                                  --
--------------------------------------------------------------------------------
    slTraceFunName       DV_PROG_PARAM.DVPROGP_PROG%type :=  'GET_DateAllDvProgParamValue' ;
    blOk                 boolean := FALSE;

    -- Übergabestrukturen
    reclSEL              recSEL_DvProgParamType;
    vslDvprogpwValueA    DvProgpwValueAType;
    dtlDvprogpwValueD    DvProgpwValueDType;
    nlDvprogpwValueN     DvProgpwValueNType;

    Begin
      --DVTRACE.Call_Beg( slTraceFunName );
      --DVTRACE.Call_Trace ( ' npDvProgpNr :='|| npDvProgpNr );
      --DVTRACE.Call_Trace ( ' vspDvProgpProg :='|| vspDvProgpProg );
      --DVTRACE.Call_Trace ( ' vspDvProgpBez :='|| vspDvProgpBez );

--------------------------------------------------------------------------------
-- Initialisierung                                                            --
--------------------------------------------------------------------------------
      npError  := 1;
      reclSEL.DVPROGP_NR := npDvProgpNr;
      reclSEL.DVPROGP_PROG := vspDvProgpProg;
      reclSEL.DVPROGP_BEZ := vspDvProgpBez;
      reclSEL.DVPROGP_VALUETYP := ngDVPGPA01_TypTime;
      reclSEL.GUELTIG_BIS_DAT := dtgDateCurrent;
      reclSEL.GUELTIG_VON_DAT := dtgDateCurrent;

      for i in 1..npAnzahlValues loop
      --DVTRACE.Call_Trace ( ' dtpDvProgpwValueU[i] :='|| dtpDvProgpwValueU(i) ||' !Centura[i]');
        ------------------------------------------------------------------------
        --  arrays initialisieren, NO_DATA_FOUND vermeiden                    --
        ------------------------------------------------------------------------
        nlDvprogpwValueN(i) := NULL;
        dtlDvprogpwValueD(i) := to_date( to_char(dtgDateDummy,'dd.mm.yyyy')
                                ||' '||
                                to_char(dtpDvProgpwValueU(i), 'hh24:mi:ss'),
                                'dd.mm.yyyy hh24:mi:ss' );
        vslDvprogpwValueA(i) := NULL;
      end loop;

--------------------------------------------------------------------------------
-- Verarbeitung über alle Werte                                               --
--------------------------------------------------------------------------------
      if GET_DvProgParamValue ( reclSEL,
                                vslDvprogpwValueA,
                                dtlDvprogpwValueD,
                                nlDvprogpwValueN,
                                npAnzahlValues,
                                npCommitJn  ) = TRUE then
        blOk := TRUE;
        dtpDvProgpwValueU :=  dtlDvprogpwValueD;

      end if;

--------------------------------------------------------------------------------
-- Nachverarbeitung                                                           --
--------------------------------------------------------------------------------
      if blOk = TRUE then
        npError := 0;
      end if;

      --DVTRACE.Call_End( slTraceFunName ) ;

--------------------------------------------------------------------------------
-- Fehlerbehandlung                                                           --
--------------------------------------------------------------------------------
    Exception
    When Others Then
        Raise_Application_Error(-20000,
                                Substr(SQLERRM ||
                                       slTraceFunName,
                                       1, 512));
    end;

End DVPGPA01;
