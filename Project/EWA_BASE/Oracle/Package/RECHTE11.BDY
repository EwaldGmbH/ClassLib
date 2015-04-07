Create Or Replace Package Body RECHTE11
Is
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   DB-Paket .......:  RECHTE11 (Body)                                    **/
/**                                                                         **/
/**   Version ........:  V004 vom 07.04.2015                                **/
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
/**   Funktion .......:  Rechteverwaltung                                   **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   Änderungsgeschichte                                                   **/
/**                                                                         **/
/**   Vers. Datum       Bearb.  Aenderungsgrund (lt. Antrag)                **/
/**   --------------------------------------------------------------------  **/
/**   004   07.04.2015  EWA/JH  Anpassung für Open Source.                  **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/

/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Prozedur INIT                                                          **/
/**  Initialiserung der Rechteverwaltung                                    **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Rueckgabe: Alle globalen Rechte (ueber globale Variablen in RECHTE10)  **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/

procedure init
as

-------------------------------------------------------------------------------
-- Konstanten                                                                --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Variablen                                                                 --
-------------------------------------------------------------------------------

   vslRecht         varchar2(10);

   nlDBSel          number(01);
   nlDBUpd          number(01);
   nlDBSperre       number(01);
   nlOrgEinhSeq     number(10);

   ilCount          integer;
   ilIndex          integer;

-------------------------------------------------------------------------------
-- Definitionen für Rechte und Funktionen                                    --
-------------------------------------------------------------------------------

   cursor clRecht is
   select distinct
          upper(fu.dvprogf_name)  fu_dvprogf_name
        , hi.hierarchie           hi_hierarchie
        , gr.rechtgr_recht        gr_rechtgr_recht
     from dv_nutzer               nu
        , rechtgr_ref_dvnutzer    grnu
        , recht_gruppe            gr
        , rechtgr_ref_dvprogf     grfu
        , schl_dv_prog_funktion   fu
        , schl_hierarchie         hi
    where upper(nu.dvnutzer_name) = rechte10.vsgDBUser
      and   nu.aktiv_jn           = 1
      and   nu.dvnutzer_seq       = grnu.dvnutzer_seq
      and grnu.rechtgr_seq        =   gr.rechtgr_seq
      and   gr.dvprogf_jn         = 1
      and   gr.aktiv_jn           = 1
      and   gr.rechtgr_seq        = grfu.rechtgr_seq
      and grfu.dvprogf_seq        =   fu.dvprogf_seq
      and   fu.aktiv_jn           = 1
      and   gr.hierarch_seq       =   hi.hierarch_seq
      and   hi.aktiv_jn           = 1
    union
   select distinct
          upper(fu.dvprogf_name)
        , hi.hierarchie
        , gr.rechtgr_recht
     from dv_nutzer               nu
        , rechtgr_ref_dvnutzer    grnu
        , recht_gruppe            gr
        , recht_master            ma
        , rechtma_ref_dvprogf     mafu
        , schl_dv_prog_funktion   fu
        , schl_hierarchie         hi
    where upper(nu.dvnutzer_name) = rechte10.vsgDBUser
      and   nu.aktiv_jn           = 1
      and   nu.dvnutzer_seq       = grnu.dvnutzer_seq
      and grnu.rechtgr_seq        =   gr.rechtgr_seq
      and   gr.dvprogf_jn         = 1
      and   gr.aktiv_jn           = 1
      and   gr.dvprogf_alle_jn    = 1
      and   gr.rechtma_seq        =   ma.rechtma_seq
      and   ma.aktiv_jn           = 1
      and   ma.rechtma_seq        = mafu.rechtma_seq
      and mafu.dvprogf_seq        =   fu.dvprogf_seq
      and   gr.hierarch_seq       =   hi.hierarch_seq
      and   hi.aktiv_jn           = 1
      union
     select distinct
            upper(fu.dvprogf_name)
          , KngHierTop
          , fu.rechtgr_recht
     from schl_dv_prog_funktion fu
    where fu.rechtgr_recht is not null
      and fu.aktiv_jn = 1
    order by 1, 2;

   rlRecht clRecht%RowType;

-------------------------------------------------------------------------------
-- Definitionen für Sonderfaelle                                             --
-------------------------------------------------------------------------------

   cursor clSonder is
   select distinct
          sf.sonderfall_seq       sf_sonderfall_seq
     from dv_nutzer               nu
        , rechtgr_ref_dvnutzer    grnu
        , recht_gruppe            gr
        , rechtgr_ref_sonderfall  grsf
        , schl_sonderfall         sf
    where upper(nu.dvnutzer_name) = rechte10.vsgDBUser
      and   nu.aktiv_jn           = 1
      and   nu.dvnutzer_seq       = grnu.dvnutzer_seq
      and grnu.rechtgr_seq        =   gr.rechtgr_seq
      and   gr.sonderfall_jn      = 1
      and   gr.aktiv_jn           = 1
      and   gr.rechtgr_seq        = grsf.rechtgr_seq
      and grsf.sonderfall_seq     =   sf.sonderfall_seq
      and   sf.aktiv_jn           = 1
     order by 1;

   rlSonder clSonder%RowType;

-------------------------------------------------------------------------------
-- Definitionen für Organisationseinheit/Hierarchie                          --
-------------------------------------------------------------------------------

   cursor clOrgEinh1 is
   select distinct
          oe.orgeinheit_seq      oe_orgeinheit_seq
        , hi.hierarchie          hi_hierarchie
     from schl_orgeinheit        oe
        , schl_hierarchie        hi
    where oe.hierarch_seq        = hi.hierarch_seq
      and oe.aktiv_jn            = 1
      and oe.orgeinheit_seq in
          ( select oe2.orgeinheit_seq
              from schl_orgeinheit         oe2
             where oe2.aktiv_jn            = 1
             start with oe2.orgeinheit_seq =
                   ( select oe3.orgeinheit_seq
                       from schl_orgeinheit           oe3
                          , dv_nutzer                 nu3
                      where upper(nu3.dvnutzer_name)  = rechte10.vsgDBUser
                        and nu3.aktiv_jn              = 1
                        and nu3.orgeinheit_seq        = oe3.orgeinheit_seq )
           connect by prior oe2.orgeinheit_seq_v = oe2.orgeinheit_seq );

   cursor clOrgEinh2 is
   select distinct
          oe.orgeinheit_seq      oe_orgeinheit_seq
     from schl_orgeinheit        oe
    where oe.aktiv_jn            = 1
    start with oe.orgeinheit_seq = nlOrgEinhSeq
    connect by prior oe.orgeinheit_seq = oe.orgeinheit_seq_v;

   rlOrgEinh1 clOrgEinh1%RowType;
   rlOrgEinh2 clOrgEinh2%RowType;

begin

-------------------------------------------------------------------------------
-- Vorlauf                                                                   --
-------------------------------------------------------------------------------

   select substr(global_name,1,4)
     into rechte10.vsgDBName
     from global_name;

-------------------------------------------------------------------------------
-- Programmaufruf pruefen                                                    --
-------------------------------------------------------------------------------

   rechte10.vsgGlobal := rechte10.vsgGlobal || KvsgPgCall;

-------------------------------------------------------------------------------
-- DB-Sperre pruefen                                                         --
-------------------------------------------------------------------------------

   Begin
     select sel_gesperrt_jn
          , upd_gesperrt_jn
     into nlDBSel
        , nlDBUpd
     from
       schl_datenbank
     where
       upper(datenbank_name) = rechte10.vsgDBName;
   Exception
     When NO_DATA_FOUND
     Then
       nlDBSel := 0;
       nlDBUpd := 0;
   End;
   begin
   select db_sperre_jn
     into nlDBSperre
     from dv_nutzer
    where upper(dvnutzer_name) = rechte10.vsgDBUser
      and aktiv_jn      = 1;
   exception
   when no_data_found
   then
     nlDBSperre := 1;
   end;

   if nlDBSperre = 1
   then
     if  nlDBSel = 0
     and nlDBUpd = 0
     then
       rechte10.vsgGlobal := rechte10.vsgGlobal || KvsgDBRead || KvsgDBWrite;
     else
       if  nlDBSel = 0
       and nlDBUpd = 1
       then
         rechte10.vsgGlobal := rechte10.vsgGlobal || KvsgDBRead;
       end if;
     end if;
   else
     rechte10.vsgGlobal := rechte10.vsgGlobal || KvsgDBRead || KvsgDBWrite;
   end if;

-------------------------------------------------------------------------------
-- Rechte und Funktionen ermitteln und festhalten                            --
-------------------------------------------------------------------------------
-- Sortiert nach Funktionen und Hierarchien (aufsteigend: 0-9)               --
-- bei gleicher Funktion/gleicher Hierarchie:                                --
--   Funktion und Rechte zusammenfassen                                      --
-- bei gleicher Funktion/unterschiedlicher Hierarchie:                       --
--   Rechte aus niedriger Hierarchie zusammenfassen                          --
-------------------------------------------------------------------------------

   egRecht.DELETE;

   ilIndex := 0;

   for rlRecht in clRecht
   loop

     if nlDBSperre = 1
       and nlDBSel = 1
       and nlDBUpd = 1
     then
-- keine Rechte eintragen
       exit;
     else

       if nlDBSperre = 1
         and nlDBSel = 0
         and nlDBUpd = 1
       then
-- nur Select-Rechte eintragen
         if rlRecht.gr_rechtgr_recht like KvsgSelectV
         then
           rlRecht.gr_rechtgr_recht := KvsgSelect;
         else
          rlRecht.gr_rechtgr_recht := null;
         end if;
       end if;

     if ilIndex = 0
     then
       ilIndex := ilIndex + 1;
       egRecht(ilIndex).funkt    := rlRecht.fu_dvprogf_name;
       egRecht(ilIndex).hierarch := rlRecht.hi_hierarchie;
       egRecht(ilIndex).recht    := rlRecht.gr_rechtgr_recht;
     else

       if  rlRecht.fu_dvprogf_name = egRecht(ilIndex).funkt
       then

         vslRecht := egRecht(ilIndex).recht;

         if  vslRecht             not like KvsgSelectV
         and rlRecht.gr_rechtgr_recht like KvsgSelectV
         then
           vslRecht := vslRecht || KvsgSelect;
         end if;
         if  vslRecht             not like KvsgInsertV
         and rlRecht.gr_rechtgr_recht like KvsgInsertV
         then
           vslRecht := vslRecht || KvsgInsert;
         end if;
         if  vslRecht             not like KvsgUpdateV
         and rlRecht.gr_rechtgr_recht like KvsgUpdateV
         then
           vslRecht := vslRecht || KvsgUpdate;
         end if;
         if  vslRecht             not like KvsgDeleteV
         and rlRecht.gr_rechtgr_recht like KvsgDeleteV
         then
           vslRecht := vslRecht || KvsgDelete;
         end if;

         if rlRecht.hi_hierarchie = egRecht(ilIndex).hierarch
         then
           egRecht(ilIndex).recht := vslRecht;
         else
           ilIndex := ilIndex + 1;
           egRecht(ilIndex).funkt    := rlRecht.fu_dvprogf_name;
           egRecht(ilIndex).hierarch := rlRecht.hi_hierarchie;
           egRecht(ilIndex).recht    := vslRecht;
         end if;

       else
         ilIndex := ilIndex + 1;
         egRecht(ilIndex).funkt    := rlRecht.fu_dvprogf_name;
         egRecht(ilIndex).hierarch := rlRecht.hi_hierarchie;
         egRecht(ilIndex).recht    := rlRecht.gr_rechtgr_recht;
       end if;
     end if;
    end if;
   end loop;

   igAnzRecht := ilIndex;

-------------------------------------------------------------------------------
-- Org-Einheit/Hierarchien ermitteln und festhalten                          --
-------------------------------------------------------------------------------
-- Index ist Sequenznummer Org-Einheit                                       --
-------------------------------------------------------------------------------

   egOrgEinh.DELETE;

   ilIndex := 0;

   for rlOrgEinh1 in clOrgEinh1
   loop

     if rlOrgEinh1.hi_hierarchie != KngHierTop
     then
       nlOrgEinhSeq := rlOrgEinh1.oe_orgeinheit_seq;
       for rlOrgEinh2 in clOrgEinh2
       loop
         if egOrgEinh.EXISTS(rlOrgEinh2.oe_orgeinheit_seq)
         then
           if egOrgEinh(rlOrgEinh2.oe_orgeinheit_seq) < rlOrgEinh1.hi_hierarchie
           then
             egOrgEinh(rlOrgEinh2.oe_orgeinheit_seq) := rlOrgEinh1.hi_hierarchie;
           end if;
         else
           ilIndex := ilIndex + 1;
           egOrgEinh(rlOrgEinh2.oe_orgeinheit_seq) := rlOrgEinh1.hi_hierarchie;

         end if;
       end loop;
     end if;

   end loop;

   igAnzOrgEinh := ilIndex;

-------------------------------------------------------------------------------
-- Sonderfaelle ermitteln und festhalten                                     --
-------------------------------------------------------------------------------
-- Index ist Sequenznummer Sonderfaelle                                      --
-------------------------------------------------------------------------------

   egSonder.DELETE;

   ilIndex := 0;

   for rlSonder in clSonder
   loop

     ilIndex := ilIndex + 1;
     egSonder(rlSonder.sf_sonderfall_seq) := NULL;

   end loop;

   igAnzSonder := ilIndex;

-------------------------------------------------------------------------------
-- Nachlauf                                                                  --
-------------------------------------------------------------------------------

end init;

/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Funktion PRUEFE1                                                       **/
/**  Vorgegebene Rechte pruefen                                             **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Rueckgabe: 1 = Alle vorgegebenen Rechte vorhanden                      **/
/**             0 = Keine bzw. nur teilweise vorgegebene Rechte vorhanden   **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/

function pruefe1
         ( vspFunkt   in varchar2
         , vspRecht   in varchar2
         , npSonder   in number
         , npOrgEinh  in number )
           return        number
as

-------------------------------------------------------------------------------
-- Konstanten                                                                --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Variablen                                                                 --
-------------------------------------------------------------------------------

   vslRecht         varchar2(10);

-------------------------------------------------------------------------------
-- Definitionen                                                              --
-------------------------------------------------------------------------------

begin

-------------------------------------------------------------------------------
-- Vorlauf                                                                   --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Rechte holen                                                               --
-------------------------------------------------------------------------------

   vslRecht := rechte11.hole1 ( vspFunkt
                              , npSonder
                              , npOrgEinh );

-------------------------------------------------------------------------------
-- Rechte pruefen                                                             --
-------------------------------------------------------------------------------

   if vspRecht is NULL
   then
     if vslRecht is NULL
     then
       return(1);
     else
       return(0);
     end if;
   else
     if vslRecht is NULL
     then
       return(0);
     end if;
   end if;

   if  vspRecht like     KvsgSelectV
   and vslRecht not like KvsgSelectV
   then
     return(0);
   end if;
   if  vspRecht like     KvsgInsertV
   and vslRecht not like KvsgInsertV
   then
     return(0);
   end if;
   if  vspRecht like     KvsgUpdateV
   and vslRecht not like KvsgUpdateV
   then
     return(0);
   end if;
   if  vspRecht like     KvsgDeleteV
   and vslRecht not like KvsgDeleteV
   then
     return(0);
   end if;

-------------------------------------------------------------------------------
-- Nachlauf                                                                  --
-------------------------------------------------------------------------------

   return(1);

end pruefe1;

/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Funktion PRUEFE2                                                       **/
/**  Vorgegebene Rechte pruefen (eines anderen Benutzers)                   **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Rueckgabe: 1 = Alle vorgegebenen Rechte vorhanden                      **/
/**             0 = Keine bzw. nur teilweise vorgegebene Rechte vorhanden   **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/

function pruefe2
         ( vspFunkt   in varchar2
         , vspRecht   in varchar2
         , npSonder   in number
         , npOrgEinh  in number
         , vspUser2   in varchar2 )
           return        number
as

-------------------------------------------------------------------------------
-- Konstanten                                                                --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Variablen                                                                 --
-------------------------------------------------------------------------------

   vslRecht         varchar2(10);

-------------------------------------------------------------------------------
-- Definitionen                                                              --
-------------------------------------------------------------------------------

begin

-------------------------------------------------------------------------------
-- Vorlauf                                                                   --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Rechte holen                                                               --
-------------------------------------------------------------------------------

   vslRecht := rechte11.hole2 ( vspFunkt
                              , npSonder
                              , npOrgEinh
                              , vspUser2 );

-------------------------------------------------------------------------------
-- Rechte pruefen                                                             --
-------------------------------------------------------------------------------

   if  vspRecht like     KvsgSelectV
   and vslRecht not like KvsgSelectV
   then
     return(0);
   end if;
   if  vspRecht like     KvsgInsertV
   and vslRecht not like KvsgInsertV
   then
     return(0);
   end if;
   if  vspRecht like     KvsgUpdateV
   and vslRecht not like KvsgUpdateV
   then
     return(0);
   end if;
   if  vspRecht like     KvsgDeleteV
   and vslRecht not like KvsgDeleteV
   then
     return(0);
   end if;

-------------------------------------------------------------------------------
-- Nachlauf                                                                  --
-------------------------------------------------------------------------------

   return(1);

end pruefe2;

/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Funktion HOLE                                                          **/
/**  Alle vorhandenen Rechte holen                                          **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Rueckgabe: Alle vorhandenen Rechte (S,U,I,D) oder NULL                 **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/

function hole1
         ( vspFunkt   in varchar2
         , npSonder   in number
         , npOrgEinh  in number )
           return        varchar2
as

-------------------------------------------------------------------------------
-- Konstanten                                                                --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Variablen                                                                 --
-------------------------------------------------------------------------------

   vslRecht         varchar2(10);

   nlHierarch       number(01);

   ilIndex          integer;

-------------------------------------------------------------------------------
-- Definitionen                                                              --
-------------------------------------------------------------------------------

begin

-------------------------------------------------------------------------------
-- Vorlauf                                                                   --
-------------------------------------------------------------------------------

   vslRecht := NULL;

-------------------------------------------------------------------------------
-- Hierarchie ermitteln                                                      --
-------------------------------------------------------------------------------

   if npOrgEinh is NULL
   then
     nlHierarch := NULL;
   else

     nlHierarch := KngHierTop;

     if igAnzOrgEinh > 0
     then
       ilIndex := egOrgEinh.FIRST;

       loop
         if ilIndex = npOrgEinh
         then
           nlHierarch := egOrgEinh(ilIndex);
           exit;
         end if;
         exit when ilIndex = egOrgEinh.LAST;
         ilIndex := egOrgEinh.NEXT(ilIndex);
       end loop;

     end if;
   end if;

-------------------------------------------------------------------------------
-- Funktion/Hierarchie pruefen                                               --
-------------------------------------------------------------------------------
-- Hierarchie absteigend (9-0) lesen                                         --
-------------------------------------------------------------------------------

   if igAnzRecht > 0
   then

     ilIndex := egRecht.LAST;
     loop
       if egRecht(ilIndex).funkt = upper(vspFunkt)
       then
         if nlHierarch is NULL
         then
           vslRecht := egRecht(ilIndex).recht;
           exit;
         else
           if egRecht(ilIndex).hierarch <= nlHierarch
           then
             vslRecht := egRecht(ilIndex).recht;
             exit;
           end if;
         end if;
       end if;
       exit when ilIndex = egRecht.FIRST;
       ilIndex := egRecht.PRIOR(ilIndex);
     end loop;

   end if;
-------------------------------------------------------------------------------
-- Sonderfall pruefen                                                        --
-------------------------------------------------------------------------------

   if  npSonder is not NULL
   then
     if  igAnzSonder > 0
     and egSonder.EXISTS(npSonder)
     then
       null;
     else
       vslRecht := NULL;
     end if;
   end if;

-------------------------------------------------------------------------------
-- Nachlauf                                                                  --
-------------------------------------------------------------------------------

   return(vslRecht);

end hole1;

/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Funktion HOLE2                                                         **/
/**  Alle vorhandenen Rechte holen (eines anderen Benutzers)                **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**  Rueckgabe: Alle vorhandenen Rechte (S,U,I,D) oder NULL                 **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/

function hole2
         ( vspFunkt   in varchar2
         , npSonder   in number
         , npOrgEinh  in number
         , vspUser2   in varchar2 )
           return        varchar2
as

-------------------------------------------------------------------------------
-- Konstanten                                                                --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Variablen                                                                 --
-------------------------------------------------------------------------------

   vslRecht         varchar2(10);

   nlHierarch       number(01);

-------------------------------------------------------------------------------
-- Definitionen                                                              --
-------------------------------------------------------------------------------

begin

-------------------------------------------------------------------------------
-- Vorlauf                                                                   --
-------------------------------------------------------------------------------

   raise_application_error(-20000,'Pruefung der Rechte fuer andere Mitarbeiter noch nicht realisiert');

   vslRecht := NULL;

-------------------------------------------------------------------------------
-- Org-Einheit holen                                                         --
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Funktion/Hierarchie pruefen                                               --
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Sonderfall pruefen                                                        --
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Nachlauf                                                                  --
-------------------------------------------------------------------------------

   return(vslRecht);

end hole2;

end rechte11;
