#!/bin/bash

touch timeOutput.txt
echo '' > timeOutput.txt

#Basic battery timing tests
echo "Planning:" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro basicBattery.ez planning/plan.ez plan.ez >> /dev/null")' >> timeOutput.txt

echo "Replan 1 (Scenario 2):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro basicBattery.ez planning/replan1.ez plan.ez >> /dev/null")' >> timeOutput.txt

echo "Replan 2 (Scenario 1):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro basicBattery.ez planning/replan2.ez plan.ez >> /dev/null")' >> timeOutput.txt

echo "Hist 2 (Scenario 1):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro basicBattery.ez histories/hist2.ez diag.ez >> /dev/null")' >> timeOutput.txt

echo "Hist 3 (Scenario 2):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro basicBattery.ez histories/hist3.ez diag.ez >> /dev/null")' >> timeOutput.txt

echo "Adv Replan 2 (Scenario 3):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro advBattery.ez planning/advReplan2.ez plan.ez >> /dev/null")' >> timeOutput.txt

echo "Replan 1 (Scenario 4):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro advBattery.ez planning/replan1.ez plan.ez >> /dev/null")' >> timeOutput.txt

echo "Adv Hist 1 (Scenario 3):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro advBattery.ez histories/advHist1.ez diag.ez >> /dev/null")' >> timeOutput.txt

echo "Hist 3 (Scenario 4):" >> timeOutput.txt 
python -m timeit -n 5 -r 20 -s 'import os' 'os.system("ezcsp --mkatoms --gams:knitro advBattery.ez histories/hist3.ez diag.ez >> /dev/null")' >> timeOutput.txt
