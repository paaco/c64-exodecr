# c64-exodecr

Exomizer decruncher routine from original [release][1], assembled and linked with ca65 toolchain to $0810. Includes a get_crunched_byte routine and initialization code.

[1]: https://bitbucket.org/magli143/exomizer/wiki/Home

Include the `exo_0810.bin` binary at `$0810` in your assembly code and use the routine as follows to decrunch the data ending at `endaddr`:

    * = $0810
    !binary 'exo_0810.bin'
    
    * = $1000
    stx #<endaddr
    sty #>endaddr
    jsr $0810
    ...

Note that Exomizer stores the original start-address inside the data, so it will always be decrunched to the same address.

### Makefile

- The included make.bat assumes ca65 toolchain in '..'
- `ifexodecrunch.s` is the decrunch routine at `$0810`
- `exodecrunch.s` is the original 3.0.2 decruncher with `decruncher_table` set to `$0334` 
