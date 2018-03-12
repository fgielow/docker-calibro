library(calibro)

#Create a new calibration environment
CE = calEnv$new(name = 'simplest')

#Add a new dataset
CE$add.ds(
	name = 'data1',		#data set name
	Y.star = 'obs.csv',	#path to the observation csv file
	X = 'bc.csv',		#path to the boundary conditions csv file
	TT = 'inputs.csv',	#path to the input csv file
	Y = 'sims.csv'		#path to the simulation csv file
)

#Run the calibration process
CE$run.cal.prc()
CE$cal.res()				#Returns calibration results



