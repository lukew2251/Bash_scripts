#Luke Willis
#Mod07Homework
#! /bin/bash


name_array=('Constance_Castillo' 'Kerry_Goodwin' 'Dorothy_Carson' 'Craig_Williams' 
'Daryl_Guzman' 'Sherman_Stewart' 'Marvin_Collier' 'Javier_Wilkerson' 'Lena_Olson' 
'Claudia_George' 'Erik_Elliott' 'Traci_Peters' 'Jack_Burke' 'Jody_Turner' 'Kristy_Jenkins' 
'Melissa_Griffin' 'Shelia_Ballard' 'Armando_Weaver' 'Elsie_Fitzgerald' 'Ben_Evans' 'Lucy_Baker' 
'Kerry_Anderson' 'Kendra_Tran' 'Arnold_Wells' 'Anita_Aguilar' 'Earnest_Reeves' 'Irving_Stone' 
'Alice_Moore' 'Leigh_Parsons' 'Mandy_Perez' 'Rolando_Paul' 'Delores_Pierce' 'Zachary_Webster' 
'Eddie_Ward' 'Alvin_Soto' 'Ross_Welch' 'Tanya_Padilla' 'Rachel_Logan' 'Angelica_Richards' 
'Shelley_Lucas' 'Alison_Porter' 'Lionel_Buchanan' 'Luis_Norman' 'Milton_Robinson' 'Ervin_Bryant' 
'Tabitha_Reid' 'Randal_Graves' 'Calvin_Murphy' 'Blanca_Bell' 'Dean_Walters' 'Elias_Klein' 
'Madeline_White' 'Marty_Lewis' 'Beatrice_Santiago' 'Willis_Tucker' 'Diane_Lloyd' 'Al_Harrison' 
'Barbara_Lawson' 'Jamie_Page' 'Conrad_Reynolds' 'Darnell_Goodman' 'Derrick_Mckenzie' 
'Erika_Miller' 'Tasha_Todd' 'Aaron_Nunez' 'Julio_Gomez' 'Tommie_Hunter' 'Darlene_Russell' 
'Monica_Abbott' 'Cassandra_Vargas' 'Gail_Obrien' 'Doug_Morales' 'Ian_James' 'Jean_Moran' 
'Carla_Ross' 'Marjorie_Hanson' 'Clark_Sullivan' 'Rick_Torres' 'Byron_Hardy' 'Ken_Chandler' 
'Brendan_Carr' 'Richard_Francis' 'Tyler_Mitchell' 'Edwin_Stevens' 'Paul_Santos' 
'Jesus_Griffith' 'Maggie_Maldonado' 'Isaac_Allen' 'Vanessa_Thompson' 'Jeremy_Barton' 
'Joey_Butler' 'Randy_Holmes' 'Loretta_Pittman' 'Essie_Johnston' 'Felix_Weber' 'Gary_Hawkins' 
'Vivian_Bowers' 'Dennis_Jefferson' 'Dale_Arnold' 'Joseph_Christensen' 'Billie_Norton' 
'Darla_Pope' 'Tommie_Dixon' 'Toby_Beck' 'Jodi_Payne' 'Marjorie_Lowe' 'Fernando_Ballard' 
'Jesse_Maldonado' 'Elsa_Burke' 'Jeanne_Vargas' 'Alton_Francis' 'Donald_Mitchell' 'Dianna_Perry' 
'Kristi_Stephens' 'Virgil_Goodwin' 'Edmund_Newton' 'Luther_Huff' 'Hannah_Anderson' 'Emmett_Gill' 
'Clayton_Wallace' 'Tracy_Mendez' 'Connie_Reeves' 'Jeanette_Hansen' 'Carole_Fox' 'Carmen_Fowler' 
'Alex_Diaz' 'Rick_Waters' 'Willis_Warren' 'Krista_Ferguson' 'Debra_Russell' 'Ellis_Christensen' 
'Freda_Johnston' 'Janis_Carpenter' 'Rosemary_Sherman' 'Earnest_Peters' 'Kelly_West' 
'Jorge_Caldwell' 'Moses_Norris' 'Erica_Riley' 'Ray_Gordon' 'Abel_Poole' 'Cary_Boone' 
'Grant_Gomez' 'Denise_Chapman' 'Vernon_Moran' 'Ben_Walker' 'Francis_Benson' 'Andrea_Sullivan' 
'Wayne_Rice' 'Jamie_Mason' 'Jane_Figueroa' 'Pat_Wade' 'Rudy_Bates' 'Clyde_Harris' 'Andre_Mathis' 
'Carlton_Oliver' 'Merle_Lee' 'Amber_Wright' 'Russell_Becker' 'Natalie_Wheeler' 'Maryann_Miller' 
'Lucia_Byrd' 'Jenny_Zimmerman' 'Kari_Mccarthy' 'Jeannette_Cain' 'Ian_Walsh' 'Herman_Martin' 
'Ginger_Farmer' 'Catherine_Williamson' 'Lorena_Henderson' 'Molly_Watkins' 'Sherman_Ford' 
'Adam_Gross' 'Alfred_Padilla' 'Dwayne_Gibson' 'Shawn_Hall' 'Anthony_Rios' 'Kelly_Thomas' 
'Allan_Owens' 'Duane_Malone' 'Chris_George' 'Dana_Holt' 'Muriel_Santiago' 'Shelley_Osborne' 
'Clinton_Ross' 'Kelley_Parsons' 'Sophia_Lewis' 'Sylvia_Cooper' 'Regina_Aguilar' 
'Sheila_Castillo' 'Sheri_Mcdonald' 'Lynn_Hodges' 'Patrick_Medina' 'Arlene_Tate' 'Minnie_Weber' 
'Geneva_Pena' 'Byron_Collier' 'Veronica_Higgins' 'Leo_Roy' 'Nelson_Lopez')

#first name lookup function
fname_func(){
echo 
read -p "Enter the first name, or a partial start of the first name: " choice
f_name=$(echo $choice | cut -d "" -f 1)
f_initial=$(echo ${f_name:0:1} | tr [:lower:] [:upper:])
f_leftover=${f_name:1}
f_name="$f_initial$f_leftover"
fname_counter=0
for i in ${name_array[*]};
do
	if [[ $i == $f_name* ]];then
		echo $i | tr "_" " "
		fname_counter=$(($fname_counter+1))
	fi
done
if [[ fname_counter -eq 0 ]];then
	echo "Nobody was found with that name"
fi
echo
}

#last name lookup function
lname_func(){
	read -p Enter the last name, or a partial start of the last name: " lchoice
	lchoice=$(echo $lchoice | tr [:lower:] [:upper:])
	lname_counter=0
	for i in ${!name_array[*]};
	do 
		if [[ ${name_array[$i]} == *$lchoice* ]];then
			echo ${name_array[$i]}
			lname_counter+=1
		fi
	done
	if [[ $lname_counter -eq 0 ]];then
		echo "There was no match"
	fi
}

#add a name function
add_func(){
	read -p "\nEnter the new first name: " finput
	if [[ finput == "* *" ]];then
		echo -e "Just the first name, please. No spaces."
	fi
	read -p "Enter the new last name: " linput
	new_name = $finput+$linput
	name_array+=$(new_name)
	echo -e "$new_name has been added"
}

#delete a name function
del_func(){
	echo -e "Delete a name by entering the full name ie:John Smith"
	read -p	"Enter the full name (Q to return to the main menu, 1 to search first names): \n" 
	delete
	unset -v ${name_array[delete]}
}

#menu
while true;
do
	echo -e "Please Select from the following options:
		1.	List all names starting with one or more letters of the first name
		2.	List all names starting with one or more letters of the last name
		3.	Add a name
		4.	Delete a name
		5.	Exit
		"

	read -p "Option #: " pick
	#options 1-5 
	if [[ pick == 1 ]];then
		fname_func
		continue
	elif [[ pick == 2 ]];then
		lname_func
		continue
	elif [[ pick == 3 ]];then
		add_func
		continue	
	elif [[ pick == 4 ]];then
		del_func
		continue
	elif [[ pick == 5 ]];then
		break
	else
		echo -e "That is not a valid option. Please try again."
		continue
	fi

done
