..\cl65 -C c64_0810.cfg --no-target-lib -v -o exo_0810.bin ifexodecrunch.s exodecrunch.s
..\da65 --hexoffs --comments 3 --start-addr $0810 exo_0810.bin > exo_0810.txt
