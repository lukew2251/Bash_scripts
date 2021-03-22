#! /bin/bash
#Luke Willis
#Mod08Homework

#alert file to write in
echo "Date,Time,Priority,Classfication,Description,SourceIP,DestinationIP" > alert_data.csv

#read the pcap
echo "Processing the pcap file...."
data=~/bash_scripts/fast_short.pcap
while IFS= read -r line
do
	date=$(echo $line | cut -d "-" -f 1)
	time=$(echo $line | cut -d " " -f 1)
	time2=$(echo $line | cut -d "-" -f 2)
	class=$(echo $line | cut -d "]" -f 4)
	class2=$(echo $class | cut -d ":" -f 2)
	priority=$(echo $line | cut -d "]" -f 5)
	priority2=$(echo $priority | cut -d ":" -f 2)
	desc=$(echo $line | cut -d "]" -f 3)
	desc2=$(echo $desc | cut -d " " -f 1)
	source=$(echo $line | cut -d "}" -f 2)
	source2=$(echo $source | cut -d " " -f 1)
	dest=$(echo $line | cut -d ">" -f 2)

#output to csv file
	output="$date,$time2,$class2,$priority2,$desc2,$source2,$dest"
	echo $output >> alert_data.csv
done < $data

clear
echo "The pcap file has been processed"

