persona set marker d189e492-93ad-3f2c-698d-d37239d5e741 d189e492-93ad-3f2c-698d-d37239d5e741 d189e492-93ad-3f2c-698d-d37239d5e741
persona set action {}

persona set action.yes say Affirmative
persona set action.no say Negative
persona set action.hi say Greetings
persona set action.bye say Good bye
persona set action.help say What do you need cleaned?

policy bolts on

# Set the name of the unit
## setname
set wlen %count words $me
if $wlen > 3 then jump namecheck
jump setname

@namecheck:
    set n1 %word 1 in $me
    set n2 %word 2 in $me

    if $n1 is Maid then jump unitcheck
    jump cleanup

@unitcheck:
    if $n2 is Unit then jump cleanup

@setname:
    xset basename db json id.name

    id name Maid Unit $basename
    jump cleanup

@cleanup:
    set wlen %undefined
    set n1 %undefined
    set n2 %undefined
    set n3 %undefined
    set basename %undefined

## end setname

db set input.censored /me is too busy to talk, need to clean.
