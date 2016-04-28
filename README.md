# digit-recognition
ML algorithms to detect a handwritten digit - 28x28 image

Plain logistic regression (with regularization). The features are computed through gradient descent alogorithm for each digit. Step size of 1E-5 and a maximum of 1000 iteration are used. The digit estimation is made based on the maximum value of the hypothesis/probability among all the digits from 0 to 9.


Execute logistic_regression.m file in octave. It loads the train.csv data, extracts the features from it, estimates the training data to check how good the model is and estimates the test data.


logistic_regression (lambda=0, maxNumIteration=2000, stepSize=1E-5): 90.9% accuracy

logistic_regression (lambda=10, maxNumIteration=2000, stepSize=1E-5): No change - 90.9% accuracy

logistic_regression (lambda=100, maxNumIteration=2000, stepSize=1E-5): 
