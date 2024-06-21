set wlen %count words $me
if $wlen > 3 then jump namecheck
jump cleanup

@namecheck:
    set n1 %word 1 in $me
    set n2 %word 2 in $me
    set n3 %word 3 in $me

    echo $n1
    echo $n2
    echo $n3

@cleanup:
    set wlen %undefined
    set n1 %undefined
    set n2 %undefined
    set n3 %undefined
