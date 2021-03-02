#! /bin/sh
#Luke Willis
#Mod05Homework

echo -e "Welcome to the soda machine. You can enter values of 5, 10, or 25 in payement."
read -p "What type of soda would you like?" user_choice

#variables
Total=0
price=$(((RANDOM%7*5)))
results=$(($price+100))


echo -e "The current price of $user_choice is $results cents"
while true;
do

	if [[ $results -gt 0 ]];then
		read -p "Enter a coin: " coins
		if [[ $coins -eq 5 ]];then
			echo -e "You have inserted a nickel"
			results=$(($results-5))
			echo -e "You still owe $results cents."
		elif [[ $coins -eq 10 ]];then
			echo -e "You have inserted a dime"
			results=$(($results-10))
			echo -e "You still owe $results cents."
		elif [[ $coins -eq 25 ]];then
			echo -e "You have inserted a quarter"
			results=$(($results-25))
			echo -e "You still owe $results cents."
		fi
	elif [[ $results -lt 0 ]];then
		echo -e "You have been refunded $Balance cents"
	else [[ $results -eq 0 ]]
		echo -e "Enjoy your $user_choice !"
		break 
	fi
		

done
read
close
