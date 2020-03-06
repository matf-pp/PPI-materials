# Pomaganje u unapređenju materijala

Pravila prilikom postavljanja kontribucija.

## Issue
- Truditi se da ime oslikava problem
- Navesti poglavlje/liniju u kojoj se javlja problem
- Opisati ponašanje trenutnog stanja

Primer dobro formiranog issue-a:
```
naziv: Korišćenje deprecated funkcije foo()

U fajlu [ime_fajla](<direktorijum/ime_fajla.stagod>#L<broj_linije>) se koristi funkcija `foo()` koja je označena kao deprecated i u budućoj verziji jezika se neće naći.
```

## Pull request

Ukoliko želite ručno da ispravite problem, forkovati repozitorijum i otvoriti pull request na `master` branch. Pratiti sledeće smernice:
- Ime pull request-a treba da oslikava rešeni problem
- Navesti problem i korake za reprodukciju istog
- Navesti trenutno ponašanje `master` grane i ponašanje nakon popravki
- Imena commit-ova treba da budu u formatu: ``[Fix] <detalji>`` 

Primer dobro formiranog pull request-a:
```md
naziv: Dodata provera ulaza u zadatku 4.11

U zadatku 4.11 se očekuje int na ulazu i pretpostavlja se da je uneti ulaz ispravan - što se nigde ne pretpostavlja u tekstu zadatka. Dodata je provera ulaza odmah nakon učitavanja. U slučaju da uneti broj nije ispravan, program traži ponovni unos od korisnika.

Ponašanje pre:
$ python 4.11.py
Unesite broj: abc
<exception>

Ponašanje nakon priloženih izmena:
$ python 4.11.py
Unesite broj: abc
Unesite broj: 

commits: 
- [Fix] Dodata provera ulaza u zadatku 4.11 
```

