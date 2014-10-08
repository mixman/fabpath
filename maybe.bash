#!/bin/bash
[ ! -d "venv" ]&&virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
unset PYTHONPATH

echo -e "\nNo ImportError due 'python -m' adding the current directory (='') to sys.path:"
CMD='python -m fabric hello'
echo $CMD
$CMD

echo -e "\nNo ImportError because we add current path to sys.path using PYTHONPATH"
CMD='PYTHONPATH= fab hello'
echo $CMD
$CMD

echo -e "\nNo ImportError, because directory *of script being run* is automatically added to sys.path"
CMD='python hello.py'
echo $CMD
$CMD

echo -e "\nImportError follows during *task execution* because current directory is not in sys.path"
echo "(import would work outside the function; affects dynamic imports)"
CMD='fab hello'
echo $CMD
$CMD
