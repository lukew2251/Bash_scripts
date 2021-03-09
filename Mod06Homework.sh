#Luke Willis
#Mod06Homework
#! /bin/sh

#declare and fill the four suits for the deck
declare -a spades=('Ace_of_Spades' 'King_of_Spades' \
            'Queen_of_Spades' 'Jack_of_Spades' \
            '10_of_Spades' '9_of_Spades' \
            '8_of_Spades' '7_of_Spades' \
            '6_of_Spades' '5_of_Spades' \
            '4_of_Spades' '3_of_Spades' \
            '2_of_Spades')

declare -a diamonds=('Ace_of_Diamonds' 'King_of_Diamonds' \
            'Queen_of_Diamonds' 'Jack_of_Diamonds' \
            '10_of_Diamonds' '9_of_Diamonds' \
            '8_of_Diamonds' '7_of_Diamonds' \
            '6_of_Diamonds' '5_of_Diamonds' \
            '4_of_Diamonds' '3_of_Diamonds' \
            '2_of_Diamonds')

declare -a clubs=('Ace_of_Clubs' 'King_of_Clubs' \
            'Queen_of_Clubs' 'Jack_of_Clubs' \
            '10_of_Clubs' '9_of_Clubs' \
            '8_of_Clubs' '7_of_Clubs' \
            '6_of_Clubs' '5_of_Clubs' \
            '4_of_Clubs' '3_of_Clubs' \
            '2_of_Clubs')
			
declare -a hearts=('Ace_of_Hearts' 'King_of_Hearts' \
            'Queen_of_Hearts' 'Jack_of_Hearts' \
            '10_of_Hearts' '9_of_Hearts' \
            '8_of_Hearts' '7_of_Hearts' \
            '6_of_Hearts' '5_of_Hearts' \
            '4_of_Hearts' '3_of_Hearts' \
            '2_of_Hearts')

#declaring new suits
declare -a playS=()
declare -a playD=()
declare -a playC=()
declare -a playH=()

new_deck(){
	playS=(${spades[*]})
	playD=(${diamonds[*]})
	playC=(${clubs[*]})
	playH=(${hearts[*]})

	#zero cards
	spades_gone=0
	diamonds_gone=0
	clubs_gone=0
	hearts_gone=0

}

#draw function
draw_func(){
	read -p "How many cards would you like to draw from this deck? " user_pick
	if ![[ $user_pick=~[*]?[0-9] ]] 2>>/dev/null;then
		echo -e "That is not a valid amount of cards to draw"
		return
	fi
	
	spades_count=${#playS[*]}
	diamonds_count=${#playD[*]}
	clubs_count=${#playC[*]}
	hearts_count=${#playH[*]}
	full_count=$(($spades_count+$diamonds_count+$clubs_count+$hearts_count))
	
	if [[ $user_pick -gt full_count ]];then
		echo -e "There are $full_count card left, you can't draw $user_pick cards\n"
		return
	fi

	echo -e "Your cards are: \n"
	
	while [[ $user_pick -gt 0 ]];
	do 
		suit=$((RANDOM%3))
		if [[ suit -eq 0 ]];then
			spades_count=${#playS[*]}
			if [[ spades_count -eq 0 ]];then
				spades_gone=1
				continue
			else
				pick=$(( ($RANDOM%spades_count) ))
				echo ${playS[$pick]}
				playS=(${playS[*]:0:$pick} ${playS[*]:$(($pick+1))})
				user_pick=$(($user_pick-1))
			fi
		elif [[ suit -eq 1 ]];then
			diamonds_count=${#playD[*]}
			if [[ diamonds_count -eq 0 ]];then
				diamonds_gone=1
				continue
			else
				pick=$(( ($RANDOM%diamonds_count) ))
				echo ${playD[$pick]}
				playD=(${playD[*]:0:$pick} ${playD[*]:$(($pick+1))})
				user_pick=$(($user_pick-1))
			fi
		elif [[ suit -eq 2 ]];then
			clubs_count=${#playC[*]}
			if [[ clubs_count -eq 0 ]];then
				clubs_gone=1
				conintue
			else
				pick=$(( ($RANDOM%clubs_count) ))
				echo ${playC[$pick]}
				playC=(${playC[*]:0:$pick} ${playC[*]:$(($pick+1))})
				user_pick=$(($user_pick-1))
			fi
		elif [[ suit -eq 3 ]];then
			hearts_count=${#playH[*]}
			if [[ hearts_count -eq 0 ]];then
				hearts_gone=1
				continue

			else
				pick=$(( ($RANDOM%hearts_count) ))
				echo ${playH[$pick]}
				playH=(${playH[*]:0:$pick} ${playH[*]:$(($pick+1))})
				user_pick=$(($user_pick-1))
			fi
		fi
	done
echo 
read -p "Press enter to continue"
}

#menu
while true;
do
echo -e "Welcome to the card deck simulator.\n"
echo -e "Please select from the following options: \n"
echo -e "
1. Draw a selected number of cards from the current deck
2. Get a new deck of cards
3. Exit
"
read -p "Option: " user_choice
echo
echo
	if [[ $user_choice -eq 1 ]];then
		draw_func
	elif [[ $user_choice -eq 2 ]];then
		echo -e "Your cards have been shuffled"
		new_deck
		continue
	elif [[ $user_choice -eq 3 ]];then
		break
	else
		echo "That is not a valid menu option please try again."
		continue
	fi 
done
