Ok part 4.
**FIXED** I tillader: if nil = nil then ..
**FIXED** Tillader assignments til for-variabel, hvis det er gemt bag en funktion.
**FIXED** Det ser ud til, at det samme sker, hvis assignment er inde i en let. Måske også andre steder.
**FIXED** Skriver ikke fejlbeskeder, hvis der findes et "break", hvor det ikke må være. Laver dog ErrorExp.
**FIXED** I tillader ikke, at en funktion kan returnere nil.
**FIXED** Jeres lister af fields i en RecordExp virker reversed.
**FIXED** "var b: rectype := nil", her siger i at b har typen nil!
**FIXED** I laver break om til ErrorExp i vardecls
I giver arrays forkert type, når der bruges subscript på dem.

Når i har alias-typer, må i gerne skrælle mellemledende væk:
Name c = Name b = Name a = Array of INT -> Name c = Array of INT
Dette er dog mest for at printe TAbsyn pænere. Hvis i hele tiden sørger for at bruge actualTy nok gange, når i skal bruge typen af noget, så er det ikke et problem.

**FIXED** Der er steder hvor i skriver: TAbs.SimpleVar(S.symbol "_")
**FIXED** Ville det ikke være bedre at skrive en fejlbesked frem for at generere noget placeholder kode?
**FIXED** TAbs.SimpleVar(S.symbol "_") kunne nemt overses i outputtet fra f.eks. merge.tig.

Er "nil" et lovligt tiger program? Og er der andre steder, hvor der kan opstå samme problem?

**FIXED** Funktionen "checkshit" måtte gerne hedde noget andet. Det her er potentielt jeres bacheloropgave.
