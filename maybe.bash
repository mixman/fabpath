#!/bin/bash
[ ! -d "venv" ]&&virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
unset PYTHONPATH

echo "No ImportError due 'python -m' adding the current directory (='') to sys.path:"
python -m fabric hello

echo "No ImportError because we add current path to sys.path using PYTHONPATH"
PYTHONPATH= fab hello

echo "ImportError follows during *task execution* because current directory is not in sys.path"
echo "(import would work outside the function; the sys.path state affects runtime imports)"
fab hello
