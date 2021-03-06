/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  DB_INS01.SQL                                       **/
/**                                                                         **/
/**   Version ........:  V001 vom 07.04.2015                                **/
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
/**   Funktion .......:  Datenbanktabellen f�r die Klassenbibliotheken      **/
/**                      (ohne Wordschnittstelle) f�llen.                   **/
/**                                                                         **/
/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   �nderungsgeschichte                                                   **/
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
--   Tabellen f�llen
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- ============================================================
--   Table: EURO
-- ============================================================
Insert Into
  EURO
(
  KURS
)
Select
  1.95583
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      EURO
  );
-- ============================================================
--   Table: SCHL_WAEHRUNG
-- ============================================================
Insert Into
  SCHL_WAEHRUNG
(
  WAEHRUNG_ALT,
  WAEHRUNG_BIL_JN,
  WAEHRUNG_ISO,
  WAEHRUNG_KURZ,
  WAEHRUNG_BEZ,
  WAEHRUNG_SEQ
)
Select
  001,
  1,
  'EUR',
  'EUR',
  'Euro',
  SCHL_WAEHRUNG_SEQ.Nextval
From
  DUAL
Where
  Not Exists
  (
    Select
      1
    From
      SCHL_WAEHRUNG
    Where
      SCHL_WAEHRUNG.WAEHRUNG_ISO = 'EUR'
  );
