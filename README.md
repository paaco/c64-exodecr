# c64-exodecr

Exomizer decruncher routine from original [release][1], assembled and linked with ca65 toolchain to $0810. Includes a get_crunched_byte routine and initialization code.

[1]: https://bitbucket.org/magli143/exomizer/wiki/Home

### SYS start

Include the `exo_0810.bin` binary at `$0810` in your assembly code directly after the BASIC start up code and use the routine as follows to decrunch the data ending at `endaddr`:

    * = $0810
    !binary 'exo_0810.bin'

    * = $1000
    ldx #<endaddr
    ldy #>endaddr
    jsr $0810
    ...

    !binary 'exomized.data.bin'
    endaddr:

Note that Exomizer stores the original start-address inside the data, so it will always be decrunched to the same address.

### Cartridge usage

Include the `exo_8009.bin` binary at `$8009` in your assembly code directly after the CBM80 header and use `jsr $8009` to start decrunch.

### Makefile

- The included make.bat assumes ca65 toolchain in PATH
- `ifexodecrunch.s` is the decrunch routine at `$0810`
- `ifexodecrunch_crt.s` is the decrunch routine at `$8009`, copying `get_crunched_byte` routine to `$50-$5B` (12 bytes)
- `exodecrunch.s` is the original 3.0.2 decruncher with `decruncher_table` set to `$0334`
