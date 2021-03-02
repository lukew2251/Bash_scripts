#! /bin/sh

clear
read -p "Press enter to move from task to task"
clear

#Task 1
echo -e "Task 1\n"
echo -e "Hello World\n"
read
clear

#Task 2
echo -e "Task 2\n"
while true;
do


	read -p "Please enter an integer: " user_guess
	if  [[ $user_guess =~ ^[+-]?[0-9] ]];then
		echo -e "\nYou entered $user_guess which is an integer\n"
		break
	else
		echo -e "\nThat is not an integer. Press Enter to try again.\n"
		read
		clear
	fi

done
read
clear

#Task 3
echo -e "Task 3\n"
echo -e "$user_guess time 3 is: $((user_guess*3))\n"
read
clear

#Task 4
echo -e "Task 4\n"
for i in {1..20..1}
	do
		if [[ $i -eq 7 ]];then
			echo "$i is a Snowflake"
		elif [[ $(($i % 2)) -eq 0 ]];then
			echo "$i is Even"
		else
			echo "$i is Odd"
		fi

	done
echo
read
clear

#Task 5
echo -e "Task 5\n"
while true;
do
	read -p "Enter a number greater than 13: " user_guess
	if [[ $user_guess -gt 13 &&  $user_guess =~ ^[+-]?[0-9] ]];then
	  for (( i-1; i<=$user_guess; i++))
		do
		  if [ $i -eq 7 ] ;then
		    echo "$i is Lucky"
		  elif [ $i -eq 13 ];then
		    echo "$i is Unlucky"
		  elif [ $(($i % 2)) -eq 0 ];then
		    echo "$i is Even"
		  else
		    echo "$i is Odd"
		  fi
		done
		break
	else
	  echo "That isn't ok"
	fi
done
echo
read
clear
				 
#Task 6
while true;
do
  echo -e "Task 6\n"
  read -p "Please enter a last name (Willis): " user_name
  if [[ $user_name == "Willis" ]];then
	break
  else
	clear
	continue
  fi
done
echo
clear

#Task 7
echo -e "Task 7\n"
counter=0
whle [[ $counter -lt 10 ]];
do
  echo $counter
  counter=$(($counter+1))
done
echo
read
clear

#Task 8
echo -e "\nTask 8\n"
small_counter=0
large_counter=0
for j in {0..30..1}
  do
    my_random=$(((RANDOM%21)-10))
    if [[ $my_random -lt $small_counter ]];then
      small_counter=$my_random
    elif [[ $my_random -gt $large_counter ]];then
      large_counter=$my_random
    fi
  done
echo "The low random value is $small_conter"
echo -e "The high random value is $large_counter\n"
read -p "Press Enter once more to leave the script"

