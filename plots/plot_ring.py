import matplotlib.pyplot as plt
import collections

f = open("../results/r_50_result.txt", "r")
g = open("../results/r_result_trimmed.txt", "w")
current_index = 0
results = {}

for line in f:
    if current_index == 0:
      current_index = 1;
      continue
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
   g.write(key + " " + str(results[key]/50) +  "\n")
g.close()

g = open("../results/r_result_trimmed.txt", "r")
x=[]
y=[]
for line in g:
    columns = line.split()
    x.append(columns[0])
    y.append(columns[1])
g.close()

plt.plot(x,y,'bs')
plt.ylabel('Compile Time (second)')
plt.xlabel('Size of Ring')
plt.ylim(0, 5)
plt.show()

