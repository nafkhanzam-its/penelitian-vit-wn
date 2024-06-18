import csv
import pickle

filename ='Data/Cassava/ScreenH_Reading_b.csv'
filename_write = 'Data/Cassava/ScreenHouseCassava_b.pkl'

with open(filename, 'r') as f:
  reader = csv.reader(f, delimiter=',')
  ncol = len(next(reader))
  print ("number of columns: ", ncol)
  included_cols=[i for i in range(ncol-9) ]
  #f.seek(0)

  data =[]
  label=[]
  week =[]
  plant=[]

  for row in reader:
      row_data =list(row[i] for i in included_cols)
      data.append(row_data)
      row_label = row[ncol-9]
      label.append(row_label)
      row_week = row[ncol-8]
      week.append(row_week)
      row_plant = row[ncol-6]
      plant.append(row_plant)

with open(filename_write, 'wb') as f:
  pickle.dump({'data':data,'label':label,'week':week,'plant':plant}, f)

print ("Label: ", label)
print ("Week: ", week)
print ("Plant", plant)
