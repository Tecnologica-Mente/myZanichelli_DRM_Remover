import sys
import time
import requests
import xmltodict, json
import PyPDF2
import getpass
from io import BytesIO, SEEK_SET, SEEK_END 

class ResponseStream(object):
      
    def __init__(self, request_iterator):
        self._bytes = BytesIO()
        self._iterator = request_iterator
   
    def _load_all(self):
        self._bytes.seek(0, SEEK_END)
          
        for chunk in self._iterator:
            self._bytes.write(chunk)
   
    def _load_until(self, goal_position):
        current_position = self._bytes.seek(0, SEEK_END)
          
        while current_position < goal_position:
            try:
                current_position = self._bytes.write(next(self._iterator))
                  
            except StopIteration:
                break
   
    def tell(self):
        return self._bytes.tell()
   
    def read(self, size = None):
        left_off_at = self._bytes.tell()
          
        if size is None:
            self._load_all()
        else:
            goal_position = left_off_at + size
            self._load_until(goal_position)
   
        self._bytes.seek(left_off_at)
          
        return self._bytes.read(size)
   
    def seek(self, position, whence = SEEK_SET):
          
        if whence == SEEK_END:
            self._load_all()
        else:
            self._bytes.seek(position, whence)

print("Please enter your myZanichelli site login credentials.")
userid = input("E-mail or mobile number: ")
passw = getpass.getpass()


session = requests.session()
login_data = {"username":f"{userid}","password":f"{passw}"}
login = session.post("https://idp.zanichelli.it/v4/login/", json=login_data)
if 'token' in login.text:
  print("Login successful!")
  

  merger = PyPDF2.PdfWriter()
  
  mess = session.get("https://web-booktab.zanichelli.it/api/v5/messages")
  usr = session.post("https://web-booktab.zanichelli.it/api/v1/sessions_web")
  elenco_books = session.get("https://web-booktab.zanichelli.it/api/v1/books_web").json()
  
  for isbn in elenco_books['books']:
     isbn = isbn['isbn']
     volume_xml = session.get('https://web-booktab.zanichelli.it/api/v1/resources_web/' + isbn + '/volume.xml')
     json_libro = xmltodict.parse(volume_xml.text)
     title = json_libro['config']['volume']['settings']['volumetitle']
     print(isbn + ') ' + title)
  
  isbn = input("Please insert the ISBN of the book: ")
  
  volumexml = session.get('https://web-booktab.zanichelli.it/api/v1/resources_web/' + isbn + '/volume.xml')
  if (volumexml.status_code == 302):
    print('Incorrect cookies, try again!')
    sys.exit()
  elif (volumexml.status_code != 200):
    print('Wrong ISBN or site no longer reachable, try again!')
    sys.exit()
  else:
    json = xmltodict.parse(volumexml.text)
    title = json['config']['volume']['settings']['volumetitle'] #titolo del libro
    titolo = title + ".pdf" #titolo da salvare in pdf
    array_unita = json['config']['volume']['units']['unit']
    print("\nLibro: " + title + "\n")
    time.sleep(2)
    print("Downloading chapters...")
    for unittitle in array_unita:
      if '@plusbook' not in unittitle or unittitle['@plusbook'] != '-1': #plusbook deve essere nullo o avere valore 10, diverso comunque da -1
        id_unit = unittitle['@btbid']
        config_xml = session.get('https://web-booktab.zanichelli.it/api/v1/resources_web/' + isbn + '/' + id_unit + '/config.xml')
        config_json = xmltodict.parse(config_xml.text)
        if 'content' in config_json['unit']:
          content2 = config_json['unit']['content'] + ".pdf"
          entry = config_json['unit']['filesMap']['entry']
          for entry in entry:
              if entry['@key'] == content2:
                richiesta = session.get('https://web-booktab.zanichelli.it/api/v1/resources_web/' + isbn + '/' + id_unit + '/' + entry['#text'] + ".pdf")
                pdf = PyPDF2.PdfReader(ResponseStream(richiesta.iter_content(64)))
                print('Download completed by: ' + content2)
                for page in range(len(pdf.pages)):
                   merger.add_page(pdf.pages[page])
    with open(titolo, 'wb') as g:
      print('Merging of chapters in progress...')
      merger.write(g)
  print("Finished! You will find the pdf in the script folder")
  exit()

else:
  print("LOGIN error")
  exit()
