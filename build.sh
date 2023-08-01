echo
echo "################################################################## "
tput setaf 2
echo "Phase 1 : "
echo "- Setting General parameters"
tput sgr0
echo "################################################################## "
echo

	archisoRequiredVersion="archiso 71-1"
	buildFolder=$HOME"/build"
	outFolder=$HOME"/iso"
	archisoVersion=$(sudo pacman -Q archiso)


	if [ "$archisoVersion" == "$archisoRequiredVersion" ]; then
		tput setaf 2
		echo "Archiso has the correct version. Continuing ..."
		tput sgr0
	fi



	echo
	echo "Saving current archiso version to archiso.md"
	sudo sed -i "s/\(^archiso-version=\).*/\1$archisoVersion/" archiso.md
	echo
	echo "Making mkarchiso verbose"
	sudo sed -i 's/quiet="y"/quiet="n"/g' /usr/bin/mkarchiso


	echo "Deleting the build folder if one exists - takes some time"
	[ -d $buildFolder ] && sudo rm -rf $buildFolder
	echo
	echo "Copying the Archiso folder to build work"
	echo
	mkdir $buildFolder
	cp -r archiso $buildFolder/archiso

	#yes | sudo pacman -Scc


	[ -d $outFolder ] || mkdir $outFolder
	cd $buildFolder/archiso/
	sudo mkarchiso -v -w $buildFolder -o $outFolder $buildFolder/archiso/



 	cd $outFolder

 	echo "Creating checksums for : "$isoLabel
 	echo "##################################################################"
 	echo
 	echo "Building sha1sum"
 	echo "########################"
 	#sha512sum $isoLabel | tee $isoLabel.sha512
	echo "Moving pkglist.x86_64.txt"
	rename=$(date +%Y-%m-%d)
 	cp $HOME/archx/iso/archiso/pkglist.x86_64.txt  $outFolder/archlinux-$rename-pkglist.txt

