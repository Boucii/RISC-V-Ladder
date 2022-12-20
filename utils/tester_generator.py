#read in a csv file with path
import csv
'''
def read_csv(path):
    with open(path, 'r') as f:
        reader = csv.reader(f)
        your_list = list(reader)
    return your_list
def get_column(data, column):
    return [row[column] for row in data]
'''
import numpy as np
import pandas as pd
data = pd.read_csv("./test.CSV", sep=',', header=None)
data = data.T
#print (data[1][0])

num_rows = len(data.columns)
num_cols = len(data[0])

time_points=data[0][2:num_cols-1]
#print(time_points)
for i in range(num_rows):
    if data[i][0] =='output':
        num_input_sig = i-1
        break
num_output_sig= num_rows-num_input_sig

#generate tester script
for i in range(2,num_cols):
    print("//clock="+str(data[0][i]))

    for j in range(1,num_input_sig+1):
        if(str(data[j][i])!='nan'):
            print('c.io.'+str(data[j][1])+'.poke('+str(data[j][i])+')')

    print('c.clock.step('+str(int(data[0][i])-int(data[0][i-1]))+')')

    for j in range(num_input_sig+1,num_rows):
        if(str(data[j][i])!='nan'):
            print('c.io.'+str(data[j][1])+'.expect('+str(data[j][i])+')')
    print('\n')
