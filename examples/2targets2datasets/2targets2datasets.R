#Note well: this example may require some tine to run.

library(calibro)

#Create a new calibration environment
CE = calEnv$new(name = '2target1dataset')	


#Add a new dataset
CE$add.ds(name = 'data1', 	#dataset name
	Y.star = 'obs1.csv',	#targets of the calibration 
	X = 'bc.csv', 		#boundary conditions
	TT = 'inputs.csv', 	#input matrix
	Y = 'sim1.csv'		#simulations
)

#Add a new dataset
CE$add.ds(name = 'data2', 	#dataset name
	Y.star = 'obs2.csv',	#targets of the calibration 
	X = 'bc.csv', 		#boundary conditions
	TT = 'inputs.csv',	#input matrix
	Y = 'sim2.csv'		#simulations
)

#Run the calibration process
CE$run.cal.prc()
#Print calibration result
CE$cal.res()


