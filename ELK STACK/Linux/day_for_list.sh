#!/bin/bash

# list variables
months=(
	'january'
	'february'
	'march'
	'april'
	'may'
	'june'
	'july'
	'august'
	'september'
	'october'
	'november'
	'december'
)
days=('mon' 'tues' 'wed' 'thur' 'fri' 'sat' 'sun')

# my for loop
for day in ${days[@]};
do
	if [ $day = 'sun' ] || [ $day = 'sat' ]
	then
		echo "it is $day. Take it easy."
	else
		echo "it is $day. get to work."
	fi
done



