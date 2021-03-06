/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  PROTOKOLL_ZEILE.TRG                                **/
/**                                                                         **/
/**   Version ........:  V004 vom 07.04.2015                                **/
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
/**   Falls nicht, siehe <http://www.gnu.org/licenses/>.                    **/
/**                                                                         **/
/**   Funktion .......:  Trigger f�r Tabelle protokoll_zeile                **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   �nderungsgeschichte                                                   **/
/**                                                                         **/
/**   Vers. Datum       Bearb.  Aenderungsgrund (lt. Antrag)                **/
/**   --------------------------------------------------------------------  **/
/**   004   07.04.2015  EWA/JH  Anpassung f�r Open Source.                  **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
 
 -----------------------------------------------------------------------------
 -- Trigger 3 (before update)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger protokoll_zeile_tr3
before update on protokoll_zeile for each row
declare
begin
 -- Keine Aenderung erlaubt --
 raise_application_error(-20000,'Tabelle darf nicht geaendert werden');
end;
/
 
 -----------------------------------------------------------------------------
 -- Trigger 5 (before delete)                                               --
 -----------------------------------------------------------------------------
 
create or replace trigger protokoll_zeile_tr5
before delete on protokoll_zeile for each row
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
 