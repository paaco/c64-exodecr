cl65 -C c64_0810.cfg --no-target-lib -v -o exo_0810.bin ifexodecrunch.s exodecrunch.s
da65 --hexoffs --comments 3 --start-addr $0810 exo_0810.bin > exo_0810.txt

cl65 -C c64_8009_crt.cfg --no-target-lib -v -o exo_8009_crt.bin ifexodecrunch_crt.s exodecrunch.s
da65 --hexoffs --comments 3 --start-addr $8009 exo_8009_crt.bin > exo_8009_crt.txt