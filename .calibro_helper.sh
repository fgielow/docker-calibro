clear

echo "==========================================================================================="
echo ""
echo "This environment was setup for CALIBRO - http://www.esru.strath.ac.uk/Programs/Calibro.htm"
echo "The mantainer of this Docker image is Fernando Gielow <fgielow@arbnco.com>"
echo ""

echo "To help you, a test alias were created already."
echo "You can execute the SIMPLEST example simulation to test the environment by running"
echo "    $ calibro-simplest"
echo ""
echo "This will effectively run the commands: "
echo "    $ cd /root/calibro_V1.76/examples/simplest"
echo "    $ calibrino --cal simplest --obs obs.csv --sim sims.csv --input inputs.csv --bc bc.csv"
echo ""
echo "==========================================================================================="
echo ""
echo ""

alias calibro-simplest="cd /root/calibro_V1.76/examples/simplest; calibrino --cal simplest --obs obs.csv --sim sims.csv --input inputs.csv --bc bc.csv"
export PATH=/root/calibro_V1.76:$PATH