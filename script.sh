#!/bin/bash
echo "------------------------------"
echo "           MAIN MENU          "
echo "------------------------------"
echo "1) Compute Number of Reviews "
echo "2) Compute the number of places in the Places dataset for every price range."
echo "3) Create a subset of the users dataset by keeping only the ‘IT Specialist’ users"
echo "4) Retrieve all reviews from the Reviews dataset that are written by ‘IT Specialist’ users"
echo "5) Compute the number of places in the Places dataset that are permanently closed."
echo "6) Compute the number of places that are still operating for every price range"
echo "7) Compute the average rating for each category in the Reviews dataset."
echo "8) Find the top 5 categories in the Reviews dataset that have the highest average rating."
echo "9) Retrieve all places that have more than 3 reviews."
echo "10) Find the place (id and name) that has received the largest number of reviews."
echo "11) Exit Application"
read -p "Enter your option: " option 
if [ $option -eq 1 ]; then
	echo "What review star rating do you want to view?"
	read -p "Enter rating: " variable
	impala-shell --var=variable_name=$variable --quiet -f FunctionOne.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Number of reviews with rating $variable star reviews is $line"; done < result.txt
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 2 ]; then
	impala-shell --var=variable_name='$' --quiet -f FunctionTwo.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Price range $ contains $line places"; done < result.txt
	impala-shell --var=variable_name='$$' --quiet -f FunctionTwo.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Price range $ $ contains $line places"; done < result.txt
	impala-shell --var=variable_name='$$$' --quiet -f FunctionTwo.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Price range $ $ $ contains $line places"; done < result.txt
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 3 ]; then
	impala-shell --quiet -f FunctionThree.sql --delimited
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 4 ]; then
	impala-shell --quiet -f FunctionFour.sql --delimited
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 5 ]; then
	impala-shell --var=variable_name='False' --quiet -f FunctionFive.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "$line False"; done < result.txt
	impala-shell --var=variable_name='True' --quiet -f FunctionFive.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "$line True"; done < result.txt
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 6 ]; then
	impala-shell --var=variable_name='$' --quiet -f FunctionSix.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Price range $ contains $line places"; done < result.txt
	impala-shell --var=variable_name='$$' --quiet -f FunctionSix.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Price range $ $ contains $line places"; done < result.txt
	impala-shell --var=variable_name='$$$' --quiet -f FunctionSix.sql -o result.txt --delimited > /dev/null 2>&1
	while read line; do echo "Price range $ $ $ contains $line places"; done < result.txt
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 7 ]; then
	impala-shell --quiet -f FunctionSeven.sql --delimited
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 8 ]; then
	impala-shell --quiet -f FunctionEight.sql --delimited
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 9 ]; then
	impala-shell --quiet -f FunctionNine.sql --delimited
  bash <(sed -n '1,$p' script.sh)

elif [ $option -eq 10 ]; then
	impala-shell --quiet -f FunctionTen.sql --delimited
  bash <(sed -n '1,$p' script.sh)
  
elif [ $option -eq 11 ]; then
	echo "Application Ending"

fi 
