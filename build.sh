	archisoRequiredVersion="archiso 71-1"
	buildFolder="/tmp/build"
	outFolder="/tmp/iso"
	archisoVersion=$(pacman -Q archiso)


	echo "Saving current archiso version to archiso.md"
	sed -i "s/\(^archiso-version=\).*/\1$archisoVersion/" archiso.md
	echo "Making mkarchiso verbose"
	sed -i 's/quiet="y"/quiet="n"/g' /usr/bin/mkarchiso


	echo "Copying the Archiso folder to build work"
	echo
	rm -rf $buildFolder
	mkdir $buildFolder

	cp -r archiso $buildFolder/archiso

	yes | pacman -Scc


	[ -d $outFolder ] || mkdir $outFolder
	cd $buildFolder/archiso/
	mkarchiso -v -w $buildFolder -o $outFolder $buildFolder/archiso/



 	cd $outFolder

 	echo "Creating checksums for : "$isoLabel
 	echo "##################################################################"
 	echo
 	echo "Building sha1sum"
 	echo "########################"

 #	sha256sum $isoLabel | tee $isoLabel.sha256
	echo "Moving pkglist.x86_64.txt"
	rename=$(date +%Y-%m-%d)
 	cp $buildFolder/archiso/packages.x86_64  $outFolder/archlinux-$rename-packages

