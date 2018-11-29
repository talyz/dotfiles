function bdbconv --description 'Konverterar bilder till bdbformat'
	
	if not test -d $argv[1]/converted
		mkdir $argv[1]/converted
	end

	for input_file in $argv[1]/*jpg
		set output_file $argv[1]'converted/'(echo $input_file | sed s_"$argv[1]"_''_)

		if not test -e $output_file
			echo "Konverterar $input_file till $output_file"
			convert $input_file -resize 547x410 $output_file
		else
			echo "Skippar $input_file: den är redan är konverterad"
		end

	end


end
