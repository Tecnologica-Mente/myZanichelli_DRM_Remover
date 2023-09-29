# myZanichelli_DRM_Remover
DRM Protection Removal and Downloader for myZanichelli Platform

ITALIAN

1) Scaricare l'archivio ed estrarlo in una posizione a piacere
2) Scaricare la versione binaria (.zip) di Node.js LTS a 32-bit o 64-bit (a seconda del sistema operativo installato) dal sito:
https://nodejs.org/en/download/
Se non si sa quale versione installare, scegliere quella a 32-bit.
3) Scaricare la versione portable di Python a 32-bit o 64-bit (a seconda del sistema operativo installato) dal sito:
https://sourceforge.net/projects/portable-python/
Se non si sa quale versione installare, scegliere quella a 32-bit.
4) Estrarre gli archivi scaricati nei precedenti punti 2) e 3) e spostare tutti i file nella stessa cartella dove si è estratto l'archivio del punto 1) (vedi immagine allegata "files_position_image.png" - tutti i file devono stare nella stessa cartella).
5) Fare doppio clic sul file "myZanichelli_DRM_Remover_AIO.cmd" e premere il tasto 1 sulla tastiera per avviare l'installazione/aggiornamento del programma. Attendere il completamento dell'operazione.
6) Collegarsi al sito:
https://my.zanichelli.it/
ed eseguire l'accesso con le proprie credenziali.
7) Nella schermata "Preferiti" o "Adottati nelle tue scuole" dove vengono visualizzati i propri libri, cliccare su "Leggi l'ebook su" (oppure nella schermata "Tutti" cliccare su "Leggi online") in corrispondenza del libro che si vuole scaricare e attendere il caricamento dello stesso sul webreader. Premere sulla tastiera il tasto F12 per visualizzare la DevTools.
a) Se si sta utilizzando Google Chrome, spostarsi nella scheda "Network", assicurandosi che sia spuntata la voce "Disable cache" e selezionata la voce "Fetch/XHR". Premere F5 per aggiornare la pagina.
b) Se si sta utilizzando Firefox, spostarsi nella scheda "Rete" e ripetere gli stessi passi del punto a).
c) Se si sta utilizzando Microsoft Edge, spostarsi nella scheda "Rete" e ripetere gli stessi passi del punto a).
8) Nella DevTools cliccare sulla scheda "Console", incollare il seguente comando:
window.angularComponentRef.render.settings.encResource
e premere Invio.
Se come risultato viene restituito un valore che non è "undefined", copiare la stringa di output senza doppi apici.
9) Andare sul menù di myZanichelli DRM Remover e premere il tasto 2 sulla tastiera. Quando richiesto se il libro è crittografato, se nel passo 8) il valore è "undefined" rispondere no (n), altrimenti rispondere si (y) e incollare la chiave di crittografia copiata precedentemente e premere Invio.
10) Tornare nella scheda "Network" della DevTools e tra i numerosi file elencati, cercare quello che nome "content.opf" e cliccare su di esso. Verranno visualizzati il percorso completo e altre informazioni. Sul menù di myZanichelli DRM Remover, quando richiesto, inserire come ebookID il numero presente 2 volte nel campo "Request URL" https://webreader.zanichelli.it/########/html5/########/OPS/content.opf (viene indicato al posto dei caratteri con ########) e come Cookie il valore riportato più in basso nel campo omonimo "Cookie" facendo attenzione a selezionare tutto il suo contenuto.
11) Attendere il download del libro. Il PDF sbloccato del libro verrà scaricato nella stessa cartella dove si trova il file "download_kitaboo.js".
12) Per scaricare gli altri libri sarà sufficiente ripetere i passi a partire dal punto 7).
13) Per scaricare i libri presenti in Booktab, accessibile on-line al seguente link:
https://web-booktab.zanichelli.it/BooktabWeb/
basterà invece andare sul menù di myZanichelli DRM Remover e premere il tasto 3 sulla tastiera. Inserendo, quando richiesto, i propri dati di accesso alla piattaforma myZanichelli, saranno elencati i libri disponibili. Digitare l'ISBN del libro che si vuole scaricare tra quelli elencati per avviare il download. Il PDF sbloccato del libro verrà scaricato nella stessa cartella dove si trova il file "download_booktab.py".
14) Per scaricare gli altri libri sarà sufficiente inserire un altro ISBN per il successivo libro.
15) Per uscire dal programma basterà andare sul menù di myZanichelli DRM Remover e premere il tasto 5 sulla tastiera.

Divertitevi ;-)

p.s. Ricorda che sei responsabile di ciò che stai facendo su Internet e anche se questo script esiste, potrebbe non essere legale nel tuo paese creare backup personali dei libri.

L'UTILIZZO DEL SOFTWARE È A PROPRIO ESCLUSIVO RISCHIO E PERICOLO. IL SOFTWARE È FORNITO DAI DETENTORI DEL COPYRIGHT E DAI COLLABORATORI "COSÌ COM'È" E NON SI RICONOSCE ALCUNA ALTRA GARANZIA ESPRESSA O IMPLICITA, INCLUSE, A TITOLO ESEMPLIFICATIVO, GARANZIE IMPLICITE DI COMMERCIABILITÀ E IDONEITÀ PER UN FINE PARTICOLARE. IN NESSUN CASO IL PROPRIETARIO DEL COPYRIGHT O I RELATIVI COLLABORATORI POTRANNO ESSERE RITENUTI RESPONSABILI PER DANNI DIRETTI, INDIRETTI, INCIDENTALI, SPECIALI, PUNITIVI, O CONSEQUENZIALI (INCLUSI, A TITOLO ESEMPLIFICATIVO, DANNI DERIVANTI DALLA NECESSITÀ DI SOSTITUIRE BENI E SERVIZI, DANNI PER MANCATO UTILIZZO, PERDITA DI DATI O MANCATO GUADAGNO, INTERRUZIONE DELL'ATTIVITÀ), IMPUTABILI A QUALUNQUE CAUSA E INDIPENDENTEMENTE DALLA TEORIA DELLA RESPONSABILITÀ, SIA NELLE CONDIZIONI PREVISTE DAL CONTRATTO CHE IN CASO DI "STRICT LIABILITY", ERRORI (INCLUSI NEGLIGENZA O ALTRO), ILLECITO O ALTRO, DERIVANTI O COMUNQUE CORRELATI ALL'UTILIZZO DEL SOFTWARE, ANCHE QUALORA SIANO STATI INFORMATI DELLA POSSIBILITÀ DEL VERIFICARSI DI TALI DANNI.

Licenza MIT (Massachusetts Institute of Technology)

------------------------------------------------------------------------------------
ENGLISH

1) Download the archive and extract it to a location of your choice
2) Download the binary version (.zip) of Node.js LTS 32-bit or 64-bit (depending on the installed operating system) from the site:
https://nodejs.org/en/download/
If you don't know which version to install, choose the 32-bit version.
3) Download the portable version of Python 32-bit or 64-bit (depending on the installed operating system) from the site:
https://sourceforge.net/projects/portable-python/
If you don't know which version to install, choose the 32-bit version.
4) Extract the archives downloaded in points 2) and 3) above and move all the files to the same folder where you extracted the archive in point 1) (see attached image "files_position_image.png" - all files must be in the same folder).
5) Double click on the "myZanichelli_DRM_Remover_AIO.cmd" file and press the 1 key on your keyboard to start installing/updating the program. Wait for the operation to complete.
6) Connect to the site:
https://my.zanichelli.it/
and log in with your credentials.
7) In the "Favorites" or "Adopted in your schools" screen where your books are displayed, click on "Read the ebook on" (or in the "All" screen click on "Read online") corresponding to the book you want wants to download and wait for it to load on the webreader. Press the F12 key on your keyboard to view DevTools.
a) If you are using Google Chrome, move to the "Network" tab, making sure that "Disable cache" is checked and "Fetch/XHR" is selected. Press F5 to refresh the page.
b) If you are using Firefox, move to the "Network" tab and repeat the same steps as in point a).
c) If you are using Microsoft Edge, move to the "Network" tab and repeat the same steps as in point a).
8) In DevTools click on the "Console" tab, paste the following command:
window.angularComponentRef.render.settings.encResource
and press Enter.
If the result returns a value that is not "undefined", copy the output string without double quotes.
9) Go to the myZanichelli DRM Remover menu and press the 2 key on the keyboard. When asked if the book is encrypted, if in step 8) the value is "undefined" answer no (n), otherwise answer yes (y) and paste the encryption key copied previously and press Enter.
10) Go back to the "Network" tab of DevTools and among the numerous files listed, look for the one called "content.opf" and click on it. The full path and other information will be displayed. On the myZanichelli DRM Remover menu, when requested, enter the number present twice in the "Request URL" field as the ebookID https://webreader.zanichelli.it/########/html5/##### ###/OPS/content.opf (it is indicated in place of the characters with ########) and as Cookie the value shown further down in the "Cookie" field of the same name, making sure to select all its contents.
11) Wait for the book to download. The unlocked PDF of the book will be downloaded to the same folder where the "download_kitaboo.js" file is located.
12) To download the other books, simply repeat the steps starting from point 7).
13) To download the books in Booktab, accessible online at the following link:
https://web-booktab.zanichelli.it/BooktabWeb/
instead, simply go to the myZanichelli DRM Remover menu and press the 3 key on the keyboard. By entering, when requested, your access data to the myZanichelli platform, the available books will be listed. Type the ISBN of the book you want to download from those listed to start the download. The unlocked PDF of the book will be downloaded to the same folder where the "download_booktab.py" file is located.
14) To download the other books, simply enter another ISBN for the next book.
15) To exit the program, simply go to the myZanichelli DRM Remover menu and press the 5 key on the keyboard.

Enjoy ;-)

p.s. Remember that you are responsible for what you are doing on the Internet and even if this script exists, it might not be legal in your country to create personal backups of books.

USE OF THE SOFTWARE IS AT YOUR OWN RISK. THE SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND COLLABORATORS "AS IS" AND THERE IS NO EXPRESS OR IMPLIED WARRANTY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR. IN NO EVENT SHALL THE OWNER OF THE COPYRIGHT OR ITS COLLABORATORS BE HELD LIABLE FOR DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, DAMAGES, DAMAGES ARISING FROM THE LOSS OF DATA OR FAILURE TO EARN, INTERRUPTION OF BUSINESS), CAUSED BY ANY CAUSE AND REGARDLESS OF THE THEORY OF LIABILITY, BOTH IN THE CONDITIONS PROVIDED BY THE CONTRACT AND IN CASE OF "STRICT LIABILITY", ERRORS (INCLUDING NEGLIGENCE OR OTHERWISE), ARISING OR OTHERWISE RELATED TO YOUR USE OF THE SOFTWARE, EVEN IF YOU HAVE BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.

MIT (Massachusetts Institute of Technology) licence
