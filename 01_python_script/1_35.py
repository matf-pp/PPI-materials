# f.readlines() i list(f)
# vracaju listu linija datoteke
#
# f.write(niska) upisuje nisku u datoteku
print("-----Upisivanje u datoteku-----\n")
# razresiti konfuziju izmedju a+ (upisuje na kraj) i r+ (upisuje na pocetak, tj. prepisace postojeci sadrzaj)
with open("datoteka.txt","a+") as h:
    h.write("water\n")
    # h.flush() - da budemo sigurni da je prebaceno iz bafera
    # nakon write file pointer se pomerio pa da bismo procitali ceo sadrzaj vracamo se na pocetak datoteke
    h.seek(0,0)
    print(h.readlines())

