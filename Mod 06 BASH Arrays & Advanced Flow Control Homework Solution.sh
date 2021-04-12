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

#declare the play suits
declare -a play_spades=()
declare -a play_diamonds=()
declare -a play_clubs=()
declare -a play_hearts=()

#function to shuffle the deck
new_deck () {
	spades_gone=0;diamonds_gone=0;clubs_gone=0;hearts_gone=0
	play_spades=(${spades[*]})
	play_diamonds=(${diamonds[*]})
	play_clubs=(${clubs[*]})
	play_hearts=(${hearts[*]})
}

#function to draw cards
get_card () {
	clear
	#check for valid input
	read -p "How many cards would you like to draw from this deck? " cards_requested
	if ! [[ $cards_requested =~ ^[+]?[0-9] ]] 2>>/dev/null;then
	clear
		echo "Invalid option.  Press Enter to return to the main menu: "
		read
		return
	fi
	
	#see if there are enough cards in the deck to meet the request
	cards_remaining=$(( ${#play_spades[@]} + ${#play_diamonds[@]} + ${#play_clubs[@]} + ${#play_hearts[@]}))
	if [[ $cards_requested -gt $cards_remaining ]];then
		clear
		echo -e "There are only $cards_remaining cards left in the deck but you have requested $cards_requested cards.\n"
		echo "Press the Enter key to return to the main menu: "
		read
		return
	fi
	echo -e "Your cards are:\n"
	
	#loop and get the number of requested cards
	while [[ $cards_requested -gt 0 ]];
	do
		#check to see if all suits are empty
		if [[ spades_gone -eq 1 && diamonds_gone -eq 1 && clubs_gone -eq 1 && hearts_gone -eq 1 ]];then
			echo "all done"
			break
		fi
		
		#get a random suit
		suit=$((RANDOM%4))
		if [[ $suit -eq 0 ]];then #get a spade
			suit_length=${#play_spades[@]}
			if [[ $suit_length -eq 0 ]]; then
				spades_gone=1
				continue
				else
				card=$((RANDOM%suit_length))
				echo ${play_spades[$card]}
				play_spades=(${play_spades[*]:0:$card} ${play_spades[*]:$(($card + 1))})
				cards_requested=$(($cards_requested-1))
			fi

		elif [[ $suit -eq 1 ]];then #get a diamond
			suit_length=${#play_diamonds[@]}
			if [[ $suit_length -eq 0 ]]; then
				diamonds_gone=1
				continue
				else
				card=$((RANDOM%suit_length))
				echo ${play_diamonds[$card]}
				play_diamonds=(${play_diamonds[*]:0:$card} ${play_diamonds[*]:$(($card + 1))})	
				cards_requested=$(($cards_requested-1))
			fi
		elif [[ $suit -eq 2 ]];then #get a club
			suit_length=${#play_clubs[@]}
			if [[ $suit_length -eq 0 ]]; then
				clubs_gone=1
				continue
				else
				card=$((RANDOM%suit_length))
				echo ${play_clubs[$card]}
				play_clubs=(${play_clubs[*]:0:$card} ${play_clubs[*]:$(($card + 1))})
				cards_requested=$(($cards_requested-1))
			fi
		else 
			suit_length=${#play_hearts[@]}
			if [[ $suit_length -eq 0 ]]; then #get a heart
				hearts_gone=1
				continue
				else
				card=$((RANDOM%suit_length))
				echo ${play_hearts[$card]}
				play_hearts=(${play_hearts[*]:0:$card} ${play_hearts[*]:$(($card + 1))})
				cards_requested=$(($cards_requested-1))
			fi
		fi
	done
	echo
	read -p "Press Enter to continue"
}

#get the new deck for the first time
new_deck

#menu
while true;
do

	clear
	echo "
Welcome to the card deck simulator.

Please select from the following options:

	1.  Draw a selected number of cards from the current deck
	2.  Get a new deck of cards
	3.  Exit
"
	read -p "Option#: " user_menu_choice
	 
	if [[ $user_menu_choice -eq 1 ]];then
		get_card
	elif [[ $user_menu_choice -eq 2 ]];then
		new_deck
	elif [[ $user_menu_choice -eq 3 ]];then
		clear
		break
	else	
		read -p "That is not a valid selection.  Press Enter to continue: "
	fi
done











