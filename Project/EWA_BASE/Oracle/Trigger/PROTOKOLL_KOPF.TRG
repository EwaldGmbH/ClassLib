/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  PROTOKOLL_KOPF.TRG                                 **/
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
/**   Funktion .......:  Trigger für Tabelle protokoll_kopf                 **/
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
 
 -----------------------------------------------------------------------------
 -- Trigger 1 (before insert)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger protokoll_kopf_tr1
before insert on protokoll_kopf for each row
declare
 -- Protokollierung --
 vslLogAppl     varchar2(48);
 vslLogFunct    varchar2(32);
 vslLogUser     varchar2(64);
 -- Einfuegung durch Protokoll-Verfahren (Restore) --
 KvslProtAppl   varchar2(8) := 'PROTOK90';
 KvslProtFunct  varchar2(8) := 'RESTORE';
begin
 dbms_application_info.read_module(vslLogAppl,vslLogFunct);
 dbms_application_info.read_client_info(vslLogUser);
 -- Einfuegung durch Protokoll-Verfahren (Restore) --
 if  vslLogAppl  = KvslProtAppl
 and vslLogFunct = KvslProtFunct
 then
  null;
 else
  -- Protokollierung --
  if vslLogUser is null
  then
   vslLogUser := user;
   end if;
  :new.log_cr_time := sysdate;
  :new.log_cr_user := substr(vslLogUser,1,30);
  :new.log_cr_appl := substr(vslLogAppl,1,30);
  :new.log_up_time := sysdate;
  :new.log_up_user := substr(vslLogUser,1,30);
  :new.log_up_vers := 0;
  :new.log_up_appl := substr(vslLogAppl,1,30);
 end if;
end;
/
 
 -----------------------------------------------------------------------------
 -- Trigger 3 (before update)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger protokoll_kopf_tr3
before update on protokoll_kopf for each row
declare
 -- Protokollierung --
 vslLogAppl     varchar2(48);
 vslLogFunct    varchar2(32);
 vslLogUser     varchar2(64);
begin
 -- Aenderung nur bei Kontrollfelder erlaubt --
 if  :new.protk_seq        = :old.protk_seq
 and :new.dvprogf_name     = :old.dvprogf_name
 and :new.dvprogf_kurz     = :old.dvprogf_kurz
 and ((:new.protk_online_bis is null
 and   :old.protk_online_bis is null)
  or   :new.protk_online_bis =  :old.protk_online_bis)
 and :new.protk_archiv_jn  = :old.protk_archiv_jn
 and ((:new.protk_fach_id  is null
 and   :old.protk_fach_id  is null)
  or   :new.protk_fach_id  =  :old.protk_fach_id)
 then
  null;
 else
  raise_application_error(-20000,'Tabelle darf nicht geaendert werden');
 end if;
 -- Protokollierung --
 if  :new.log_cr_time = :old.log_cr_time
 and :new.log_cr_user = :old.log_cr_user
 and ((:new.log_cr_appl is null
 and :old.log_cr_appl is null)
  or :new.log_cr_appl = :old.log_cr_appl)
 and :new.log_up_vers = :old.log_up_vers
 then
  dbms_application_info.read_module(vslLogAppl,vslLogFunct);
  dbms_application_info.read_client_info(vslLogUser);
  if vslLogUser is null
  then
   vslLogUser := user;
  end if;
  :new.log_up_time := sysdate;
  :new.log_up_user := substr(vslLogUser,1,30);
  :new.log_up_vers := :old.log_up_vers + 1;
  :new.log_up_appl := substr(vslLogAppl,1,30);
 else
  raise_application_error(-20000,'Log-Info darf nicht geaendert werden');
 end if;
end;
/
 
 -----------------------------------------------------------------------------
 -- Trigger 5 (before delete)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger protokoll_kopf_tr5
before delete on protokoll_kopf for each row
declare
 -- Loeschung nur durch Protokoll-Verfahren --
 KvslProtAppl   varchar2(8) := 'PROTOK90';
 KvslProtFunct  varchar2(8) := 'DELETE';
 vslLogAppl     varchar2(48);
 vslLogFunct    varchar2(32);
begin
 -- Loeschung nur durch Protokoll-Verfahren --
 dbms_application_info.read_module(vslLogAppl,vslLogFunct);
 if  vslLogAppl  = KvslProtAppl
 and vslLogFunct = KvslProtFunct
 then
  null;
 else
  raise_application_error(-20000,'Tabelle darf nicht geaendert werden');
 end if;
end;
/
 