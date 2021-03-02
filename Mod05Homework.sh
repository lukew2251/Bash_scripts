#! /bin/sh
#Luke Willis
#Mod05Homework

echo -e "Welcome to the soda machine. You can enter values of 5, 10, or 25 in payement.\n"
read -p "What type of soda would you like? \n" user_choice

#variables
Total=0
price=$(((RANDOM%7*5)))
results=$(($price+100))


echo -e "The current price of $user_choice is $results cents.\n"
while true;
do

	if [[ $results -gt 0 ]];then
		read -p "Enter a coin: " coins
		if [[ $coins -eq 5 ]];then
			echo -e "You have inserted a nickel."
			results=$(($results-5))
			echo -e "You still owe $results cents\n."
		elif [[ $coins -eq 10 ]];then
			echo -e "You have inserted a dime."
			results=$(($results-10))
			echo -e "You still owe $results cents.\n"
		elif [[ $coins -eq 25 ]];then
			echo -e "You have inserted a quarter."
			results=$(($results-25))
			echo -e "You still owe $results cents.\n"
		else
			echo -e "You have entered a wrong coin value. Please try again."
		fi
	elif [[ $results -lt 0 ]];then
		echo -e "You have been refunded $(($results*-1)) cents.\n"
		echo -e "Your $user_choice is being dispensed. Thank you!\n"
		break
	else [[ $results -eq 0 ]]
		echo -e "Your $user_choice is being dispensed. Thank you!\n"
		break 
	fi
		

done
echo
echo -e "Press enter to end script"
read
close
