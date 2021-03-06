/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  BEARBEITUNG_LISTE.TRG                              **/
/**                                                                         **/
/**   Version ........:  V002 vom 07.04.2015                                **/
/**                                                                         **/
/**   Autor: .........:  Ewald GmbH          (Kontakt: info@ewald.de)       **/
/**                                                                         **/
/**   Dieses Programm ist freie Software. Sie k�nnen es unter den Beding-   **/
/**   ungen der GNU General Public License, wie von der Free Software       **/
/**   Foundation ver�ffentlicht, weitergeben und/oder modifizieren, ent-    **/
/**   weder gem�� Version 3 der Lizenz oder (nach Ihrer Option) jeder       **/
/**   sp�teren Version.                                                     **/
/**                                                                         **/
/**   Die Ver�ffentlichung dieses Programms erfolgt in der Hoffnung, dass   **/
/**   es Ihnen von Nutzen sein wird, aber OHNE IRGENDEINE GARANTIE, sogar   **/
/**   ohne die implizite Garantie der MARKTREIFE oder der VERWENDBARKEIT    **/
/**   F�R EINEN BESTIMMTEN ZWECK. Details finden Sie in der GNU General     **/
/**   Public License.                                                       **/
/**                                                                         **/
/**   Sie sollten ein Exemplar der GNU General Public License zusammen mit  **/
/**   diesem Programm erhalten haben.                                       **/
/**                                                                         **/
/**   Funktion .......:  Trigger f�r Tabelle BEARBEITUNG_LISTE              **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   �nderungsgeschichte                                                   **/
/**                                                                         **/
/**   Vers. Datum       Bearb.  Aenderungsgrund (lt. Antrag)                **/
/**   --------------------------------------------------------------------  **/
/**   002   07.04.2015  EWA/JH  Anpassung f�r Open Source.                  **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
 
 -----------------------------------------------------------------------------
 -- Trigger 1 (before insert)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger BEARBEITUNG_LISTE_tr1
before insert on BEARBEITUNG_LISTE for each row
declare
 -- Protokollierung --
 vslLogAppl     varchar2(48);
 vslLogFunct    varchar2(32);
 vslLogUser     varchar2(64);
begin
 -- Protokollierung --
 dbms_application_info.read_module(vslLogAppl,vslLogFunct);
 dbms_application_info.read_client_info(vslLogUser);
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
end;
/
 
 -----------------------------------------------------------------------------
 -- Trigger 3 (before update)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger BEARBEITUNG_LISTE_tr3
before update on BEARBEITUNG_LISTE for each row
declare
 -- Protokollierung --
 vslLogAppl     varchar2(48);
 vslLogFunct    varchar2(32);
 vslLogUser     varchar2(64);
begin
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
