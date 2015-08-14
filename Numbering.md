Šeit ir apkopoti iespējamie risinājumi numerācijai ar punktiem. Neviens no tiem nav ideāls. Varbūt ir vēl kāds?

## `\the<name>` pārdefinēšana ##

Pielikt punktu visā zināmajām `\the<name>` komandām. Nepilnības:
  * nav universāls. Tiklīdz kāds izdomā definēt `\thesomething`, atkal jāraksta kods.

## `\arabic` pārdefinēšana ##

Pielikt punktu vispār visās vietās, kurās LaTeX skaitītāju vērtības tiek pārvērstas arābu skaitļos. Nepilnības:
  * ne visi skaitļi ir obligāti kādi numuri. Tad būtu jāveido izņēmumu saraksts, kas ir būtībā tas pats, kas ir iepriekšējā risinājumā;
  * gribētos pēc numuriem automātiski aizliegt rindas beigas. Kā lai atšķir, kuros gadījumos `\ref` rezultāts ir saistīts ar nākamo vārdu (tad būtu jāliek `\nobreak`) vai iepriekšējo (tad nebūtu)? Manipulācijas ar `xstring` pagaidām nedod rezultātus.

## Izvada līmeņa komandu (`\@seccntformat`, `\ref`, `\numberline`) pārdefinēšana ##

Nemainīt numuru formātu, bet gan vietās, kurās noteikti tiek izmantoti numuri, pielikt punktus. Šis risinājums tiek izmantots tagad. Nepilnības:
  * šeit `\ref` liek punktus visos gadījumos. Vajadzētu būt tā, ka pēc burtiem un citiem simboliem punktus neliktu. Bet šeit ir tāda pati problēma ar ciparu atpazīšanu;
  * ja kāda pakotne definē jaunu vietu, kur izvadīt numurus, tad ir jāraksta papildus kods. Bet šajā vietā vienalga būtu jāmaina vārdu secība («Att. 1» → «1. att.»), turklāt tādi gadījumi šķiet reti.