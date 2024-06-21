set wlen %count words $me
if $wlen > 3 then jump namecheck
jump setname

@namecheck:
    set n1 %word 1 in $me
    set n2 %word 2 in $me

    echo $n1
    echo $n2
    if $n1 is Mare jump unitcheck
    @jump cleanup

@unitcheck:
    if $n2 is Unit jump cleanup

@setname:
    xset basename db json id.name

    echo Mare Unit $basename
    jump cleanup

@cleanup:
    set wlen %undefined
    set n1 %undefined
    set n2 %undefined
    set n3 %undefined
    set basename %undefined
