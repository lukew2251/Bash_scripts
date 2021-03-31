#! /bin/sh
#Luke Willis
#Project2

#string for identifiers
major_descriptors="BAD-TRAFFIC,DNS SPOOF,ET CURRENT_EVENTS,ET DNS,ET INFO,ET MALWARE,ET POLICY,ET TROJAN,ET WEB_CLIENT,ICMP,INFO,SCAN,WEB-IIS"

#parse data function
parse_func (){
	echo -e "Please be patient. Parsing data..."
	echo "Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination
IP,Destination Port" > ~/bash_scripts/alert_full_short_cleaned.csv
	
	input=~/bash_scripts/alert_full_short.pcap
	while IFS= read -r line
	do
		if [[ $line == *"[**]"* ]];then
			desc=$(echo $line | cut -d "]" -f 3)
			desc1=$(echo $desc | cut -d "[" -f 1)
		elif [[ $line == *"Classification"* ]];then
			class=$(echo $line | cut -d "]" -f 1)
			class1=$(echo $class | cut -d ":" -f 2)
			prio=$(echo $line | cut -d ":" -f 3)
			prio1=$(echo $prio | cut -d "]" -f 1)
		elif [[ $line == *"->"* ]]&&[[ $line == *"/"* ]];then
			line1=$(echo $line | cut -d " " -f 2)
			
			if [[ $line1 == *":"* ]];then
				s_ip=$(echo $line1 | cut -d ":" -f 1)
				s_port=$(echo $line1 | cut -d ":" -f 2)
			else
				s_ip=$line1
				s_port="unspecified"
			fi
			
			line2=$(echo $line | cut -d " " -f 4)
			
			if [[ $line2 == *":"* ]];then
				dest_ip=$(echo $line2 | cut -d ":" -f 1)
				dest_port=$(echo $line2 | cut -d ":" -f 2)
			else
				dest_ip=$line2
				dest_port="unspecified"
			fi
			
			date=$(echo $line | cut -d " " -f 1)
			date1=$(echo $date | cut -d "-" -f 1)
			time=$(echo $date | cut -d "-" -f 2)
			time1=${time:0:5}

		elif [[ $line == *"DgmLen:"* ]];then
			pack_type=$(echo $line | cut -d " " -f 1)
		
		elif [[ $line == "" ]];then
			class1=$(echo $class1 | tr " " "_")
			desc1=$(echo $desc1 | tr " " "_")
line_out="$date1,$time1,$prio1,$class1,$desc1,$pack_type,$s_ip,,$s_port,$dest_ip,$dest_port"

			echo $line_out >> ~/bash_scripts/alert_full_short_cleaned.csv
		else
			continue
		fi
	done < $input  
}
#Major descriptors function
maj_desc (){
	while true;
	do
		declare -a maj_desc_array=()
		declare -a matches_array=()
		declare -a major_descriptors=('BAD-TRAFFIC' 'DNS_SPOOF' 'ET_CURRENT_EVENTS' 'ET_DNS' 'ET_INFO'
'ET_MALWARE' 'ET_POLICY' 'ET_TROJAN' 'ET_WEB_CLIENT' 'ICMP' 'SCAN' 'WEB-ITS')
		echo -e "
		Enter one or more starting charachters for your major descriptor, or 
		Enter nothing to see all major descriptors, or
		Enter exit to return to the main menu: "
		read -p "Please enter your selection: " choice
		choice=$(echo $choice | tr [:lower:] [:upper:])
		
		if [[ $choice == "EXIT" ]];then
			break
		fi
		
		for i in ${major_descriptors[*]};
		do
			i=$(echo $i | tr "_" " ")
			if [[ $i == $choice* ]];then
				i=$(echo $i | tr " " "_")
				maj_desc_array+=($i)
			fi
		done
		if [[ ${#maj_desc_array[*]} -eq 0 ]];then
			clear
			echo -e "No major descriptor was found with those starting characters"
		
		elif [[ ${#maj_desc_array[*]} -eq 1 ]];then
			option=$(echo ${maj_desc_array[0]} | tr "_" " ")
			echo -e "Your selection is: " $option
			
			input=~/bash_scripts/alert_full_short_cleaned.csv
			while IFS= read -r line
			do 
				desc=$(echo $line | cut -d "," -f 5)
				if [[ $desc == *${maj_desc_array[0]}* ]];then
					if ! [[ ${matches_array[*]} == $desc ]];then
						matches_array+=($desc)
					fi
				fi
			done < $input
			echo -e "There are ${#matches_array[*]} match"
			read -p "Please hit enter to see the matches: "
			for i in ${matches_array[*]};
			do
				i=$(echo $i | tr "_" " ")
				echo $i
			done
			break
		else
			for i in ${maj_desc_array[*]};
			do
				i=$(echo $i | tr "_" " ")
				echo $i
			done
			echo "There were too many matches try again"
		fi
	done
}
#Classfications function
class_func(){
	echo "This is hatefull to do in BASH. Hard pass."
}
#Clean up and exit function
clean_up(){
	name="Willis,Luke"
	name=$(echo $name | tr "," "_")
	name=$name".tgz"
	file_name=~/bash_scripts/$name
	if [[ -f $file_name ]];then
		rm $name
	fi
	cd ~/bash_scripts
	tar -cf $name -z alert_full_short_cleaned.csv alert_full_short.pcap
	rm alert_full_short.pcap
	rm alert_full_short_cleaned.csv
}

#name strings
MY_NAME="Luke Willis"
first_name=$(echo $MY_NAME | cut -d " " -f 1)
last_name=$(echo $MY_NAME | cut -d " " -f 2)

#data file check
file_check=~/bash_scripts/alert_full_short.pcap.tgz
if ! [[ -f $file_check ]];then
	echo "Please put alert_full_short.pcap.tgz in the home directory"
	exit
elif [[ -f $file_check ]];then
	tar -xzf alert_full_short.pcap.tgz
fi

#menu
while true;
do 
	echo -e "
	----Main Menu----

	Please select from the following options:
	      
	1. Parse alert data
	2. Major Descriptors
	3. Classifications
	4. Clean up and exit"

	read -p "Options#: " pick
	
	if [[ $pick == 1 ]];then
		parse_func
	elif [[ $pick == 2 ]];then
		maj_desc
	elif [[ $pick == 3 ]];then
		class_func
	elif [[ $pick == 4 ]];then
		clean_up
		break
	else
		echo -e "That is not a valid option please select 1-4"
	fi	
done
