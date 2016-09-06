# /etc/csh.login

# System wide environment and startup programs, for login setup

#add sbin directories to the path
foreach p ( /usr/local/sbin /usr/sbin )
	switch (":${PATH}:")
	case "*:${p}:*":
		breaksw
	default:
		if ( $uid == 0 ) then
                        set path = ( ${p} ${path:q} )
		else
                        set path = ( ${path:q} ${p} )
		endif
		breaksw
	endsw
end

setenv HOSTNAME `/usr/bin/hostname`
set history=1000

if ( -d /etc/profile.d ) then
        set nonomatch
        foreach i ( /etc/profile.d/*.csh )
                if ( -r "$i" ) then
	                        if ($?prompt) then
	                              source "$i"
	                        else
	                              source "$i" >& /dev/null
	                        endif
                endif
        end
        unset i nonomatch
endif
