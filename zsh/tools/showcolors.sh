#!/usr/bin/zsh
# ===> Display the terminal 256 colors by blocks <=== #
showcolors (){
	typeset -A grid

	# number of lines per block
	local lines=6

	# number of blocks per terminal line
	local blocks=5
	local line=''
	local m=0
	local b=0
	local arr
	local bline

	print -P "%F{14}\t\t\t 􀎒  Terminal 256 Color Palette%f"
	for color in {16..255}; do
		# top edges
		tbox3="╭──────────────"
		tbox2="┬──────────────"
		tbox1="┬──────────────╮"

		# bottom edges
		bbox3="╰──────────────"
		bbox2="┴──────────────"
		bbox1="┴──────────────╯"

		# current line in a block
		m=$((($color-16)%$lines))

		# zero to make numbers even
		z=''
		cell=$(( $color<=99 ))
		[[ $cell = 1 ]] && z='0'
		cell2=$(( $color<10 ))
		[[ $cell2 = 1 ]] && z='00'

		# counts blocks and add line before and after each row
		[[ $b = $(($blocks - 1)) ]] && line=" │"

		# array of colors for perimeter lines
		[[ $m = 1 ]] && arr=("${color}" "${arr[@]}")

		# individual block
		grid[$m]=$grid[$m]"%F{${color}} │  ${z}${color} 􀏄􀏄􀏄􀏄􀏄  ${line}%f"

		# bottom border for each group of blocks
		if [[ $m = 5 ]]; then
			if [[ $b = 0 ]]; then
				bline="%F{$color}$bbox3"
			elif [[ $b = 4 ]]; then
				grid[$m]=$grid[$m]"\n%F{${color}}  ${bline}%f%F{${color}}$bbox1%f"
			else
				bline="${bline}%F{${color}}$bbox2"
			fi
		fi

		# count how many blocks are filled
		[[ $m = 5 ]] && b="$(($b+1))" && z=''

		# display blocks if there are 5 in the current row
		if [[ $b = $blocks ]]; then
			local cr=''
			# top border for each group of blocks
			for (( i=${#arr[@]}-1 ; i>0 ; i-- )) ; do
				local edge="$tbox2"
				[[ $i = "1" ]] && edge=$tbox1
				[[ $i = "3" ]] && edge=$tbox2
				[[ $i = "5" ]] && edge=$tbox3
				cr="${cr}%F{$arr[$i]}${edge}%f"
			done
			print -P "  $cr"
			b=0;
			arr=''
			# Display each line
			for j in {0..$m}; do
				print -P "%F{$color} $grid[$j]"
				grid[$j]=""
			done
			cr=''
		fi
		line=''
	done

	echo "\t\t\t\t       􀍠"

	# Remaining colors are displayed separately
	# because they don't blend well with the others
	typeset -A rgrid
	local rlines=3
	local bblocks=5
	for color in {0..15}; do
		local line=''
		local z=''
			  m=$(($color%$rlines))
			  cell2=$(( $color<10 ))
		[[ $cell2 = 1 ]] && z='0'
		[[ $b = $(( $bblocks - 1 )) ]] && line=" │"
		[[ $m = 0 ]] && arr=("${color}" "${arr[@]}")
		rgrid[$m]=$rgrid[$m]"%F{${color}} │  $z${color} 􀏄􀏄􀏄􀏄􀏄􀏄 %F{${color}} ${line}%f"
		if [[ $m = 2 ]]; then
			if [[ $b = 0 ]]; then
				bline="%F{$color}$bbox3"
			elif [[ $b = 4 ]]; then
				rgrid[$m]=$rgrid[$m]"\n%F{${color}}  ${bline}%f%F{${color}}$bbox1%f"
			else
				bline="${bline}%F{${color}}$bbox2"
			fi
		fi
		[[ $m = 2 ]] && b="$(($b+1))"
		if [[ $b = $bblocks ]]; then
			local cr=''
			for (( i=${#arr[@]}-1 ; i>0 ; i-- )) ; do
				local edge="$tbox2"
				[[ $i = "1" ]] && edge=$tbox1
				[[ $i = "3" ]] && edge=$tbox2
				[[ $i = "5" ]] && edge=$tbox3
				cr="${cr}%F{$arr[$i]}${edge}%f"
			done
				print -P "  $cr"
			b=0;
			for j in {0..5}; do
				print -P "%F{$color} $rgrid[$j]"
				rgrid[$j]=""
			done
			cr=''
		fi
		line=''
	done
}
