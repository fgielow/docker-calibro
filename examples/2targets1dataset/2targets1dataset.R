#Note well: this example may require some time to run.

library(calibro)

#Create a new calibration environment
CE = calEnv$new(name = '2target1dataset')	


#Add a new dataset
CE$add.ds(name = 'data1', 			#dataset name
	Y.star = c('obs1.csv', 'obs2.csv'),	#targets of the calibration 
	X = 'bc.csv', 				#boundary conditions
	TT = 'inputs.csv', 			#input matrix
	Y = c('sim1.csv', 'sim2.csv')	#simulations
)

#Run calibration
CE$run.cal.prc()
#Print calibration result
CE$cal.res()
