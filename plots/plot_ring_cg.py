import matplotlib.pyplot as plt
import collections

f = open("../results/scribble_result.txt", "r")
g = open("../results/scribble_result_trimmed.txt", "w")
current_index = 0
results = {}

for line in f:
    columns = line.split()
    key = columns[0].replace(",","")
    if results.has_key(key):
      results[key] += float(columns[1].replace(",",""))
    else:
      results[key] = float(columns[1].replace(",",""))
    current_index = current_index + 1
f.close()
sorted_results = collections.OrderedDict(sorted(results.items(), key=lambda t: int(t[0])))
for key in sorted_results:
   g.write(key + " " + str(results[key]) +  "\n")
g.close()

g = open("../results/scribble_result_trimmed.txt", "r")
x=[]
y=[]
for line in g:
    columns = line.split()
    x.append(columns[0])
    y.append(columns[1])
g.close()

plt.plot(x,y)
plt.ylabel('Compile Time (second)')
plt.xlabel('No. of Participants')
plt.show()

