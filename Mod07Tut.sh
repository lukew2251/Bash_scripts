#Luke Willis
#Mod07Tutorial
#! /bin/bash

lyrics_string="Quisiera:Ayer:cambiarle:conocí:el:un:final
:cielo:al:sin:cuento|Las:sol|Y:barras:un:y:hombre:los:sin
:tragos:suelo|Un:han:santo:sido:en:testigo|De:prision|Y:el
:una:dolor:canción:que:triste:me:sin:causaste:dueño|Y:y
:conocí:to':tus:lo:ojos:que:negros|Y:hciste:ahora:conmigo|Un
:sí:infeliz:que:en:no:el:puedo:amor,:vivir:que:sin:aun
:ellos:no:yo|Le:te:pido:supera|Que:al:ahora:cielo:camina
:solo:solo:un:sin:deseo|Que:nadie:en:por:tus:todas:ojos
:las:yo:aceras|Preguntándole:pueda:a:vivir|He:Dios:recorrido
:si:el:en:mundo:verad:entero|te:el:vengo:amor:a:existe|:decir|"

declare -a lyrics=()
declare -a song1_array=()
declare -a song2_array=()
declare -a duplicates=()

clear

lyrics_string=$(echo $lyrics_string | tr ":" " ")
lyrics=($(echo $lyrics_string | cut -d " " -f 1-))
lyrics_len=${#lyrics[*]}

for (( i=0; i<$lyrics_len; i=i+2 ));
do
	song1+="${lyrics[$i]} "
	song2+="${lyrics[(($i+1))]} "


done

song1=$(echo $song1 | sed 's/|/\\n/g')
song2=$(echo $song2 | sed 's/|/\\n/g')

echo 
echo -e $song1
echo 
echo -e $song2

song1=$(echo $song1 | tr [:upper:] [:lower:])
song2=$(echo $song2 | tr [:upper:] [:lower:])

song1=$(echo $song1 | sed 's/\\n/ /g')
song2=$(echo $song2 | sed 's/\\n/ /g')

song1_array=($(echo $song1 | cut -d " " -f 1-))
song2_array=($(echo $song2 | cut -d " " -f 1-))

for i in ${song1_array[*]};
do 
	for j in ${song2_array[*]};
	do
		if [[ $j == $i ]];then
			duplicates+=("$j ")
		fi
	done

done

duplicates=($(for k in ${duplicates[*]};do echo $k; done | sort -u))

echo -e "These words are in both songs:\n"
echo ${duplicates[*]}
echo
read -p "Press Enter to exit the script"

