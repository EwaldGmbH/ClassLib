/*****************************************************************************/
/*****************************************************************************/
/**                                                                         **/
/**   SQL-Script .....:  INSTALL_99.SQL                                     **/
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
/**   Funktion .......:  Installation der Datenbank für die Beispiel-       **/
/**                      applikation BSPIEL01.APP                           **/
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
-- Verzeichnisse der Installationsdateien definieren
-------------------------------------------------------------------------------
Define SQL_PACKAGE_DIR=J:\Development\TD61\Project\EWA_BSPL\Oracle\Package\
Define SQL_SCRIPT_DIR=J:\Development\TD61\Project\EWA_BSPL\Oracle\Script\
Define SQL_TRIGGER_DIR=J:\Development\TD61\Project\EWA_BSPL\Oracle\Trigger\

-------------------------------------------------------------------------------
-- Datenbanktabellen und zugehörige Objekte installieren
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Packages installieren
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Trigger installieren
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Datenbanktabellen füllen
-------------------------------------------------------------------------------
@&SQL_SCRIPT_DIR.DB_INS99.SQL

-------------------------------------------------------------------------------
-- Commit ausführen
-------------------------------------------------------------------------------
Commit;