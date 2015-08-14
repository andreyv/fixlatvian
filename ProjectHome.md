## Apraksts ##

FixLatvian pakotne uzlabo latviešu valodas atbalstu LaTeX sistēmā. Uzlabojumu saraksts:
  * punkti pēc automātiski izveidotajiem numuriem (virsrakstos, saturā, `\ref` un `\pageref` komandās);
  * izmainīts daļu un nodaļu, attēlu un tabulu, teorēmu virsrakstu noformējums («1. nodaļa», «1. att. Nosaukums», …);
  * dažu LaTeX komandu tulkojumi, alfabētiska numerācija ar latviešu burtiem;
  * pareiza zemteksta piezīmju (_footnote_) numerācija;
  * iespēja lietot komatu kā decimāldaļas atdalītāju;
  * vairāku citu pakotņu atbalsts.

Sīkāk funkcionalitāte un pašas pakotnes pirmkods ir aprakstīti [dokumentācijā](http://fixlatvian.googlecode.com/files/fixlatvian-v1a.pdf).

## Uzstādīšana ##

Vienkāršākajā gadījumā pietiek novietot `fixlatvian.sty` datni direktorijā ar lietotāja dokumenta augstākā līmeņa `.tex` datni. Dokumentā pakotni pieslēdz ar `\usepackage{fixlatvian}` komandu.

Lai lietotu pakotni ar vairākiem dokumentiem, to var novietot kādā direktorijā, kur to var atrast LaTeX (skat. 4.6. apakšnodaļu «Installing Extra Packages» [The Not So Short Introduction to LaTeX2e](http://mirror.ctan.org/info/lshort/english/lshort.pdf) grāmatā).

Atslēgvārdi: _latex latviešu valodā_, _latex latviski_, _latex latviskošana_