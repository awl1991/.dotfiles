set_permission() {
	2=$(sudo chown -R $(whoami) $1)
	print -P " %F{14}~~> Setting ownership of $1 >=> $(whoami)%f  ──  %F{092} %F{244} %F{092}"
	$($2)
	if [ $? -eq 0 ]; then
    	print -P " %F{14}--> Failed. %F{14}Could not set ownership of $1 to $(whoami)%f  ──  %F{09} %F{244} %F{09}\n"
	else
    	print -P " %F{14}==> $1 is now owned by $(whoami)%f  ──  %F{02}  %F{244} %F{02}\n"
	fi
}
