persona set marker 28cf0d04-5c84-e3d3-ac7d-d644be2146a9 4dd58695-8b24-9ded-7c11-a9304acdecd7 a8e2016b-874e-7369-86e2-4a246f849a39
persona set path $rlv/persona/maid
persona set action {}

persona set action.yes Affirmative
persona set action.no Negative
persona set action.hi Greetings
persona set action.bye Good bye
persona set action.help? What do you need cleaned?

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
