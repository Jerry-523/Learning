from sklearn import datasets

iris=datasets.load_iris()
features=iris.data
targets=iris.target

featuresAll=[]
for observation in features:
    featuresAll.append([observation[0]+observation[1]+observation[2]+observation[3]])

import matplotlib.pyplot as plt

plt.scatter(featuresAll, targets, color='red', alpha=1.0)
plt.rcParams['figure.figsize']=[10,8]
plt.title('Iris Dataset scatter Plot')
plt.xlabel('Features')
plt.ylabel('Targets')
plt.show() # show graphics

#Grafico de  dispersao Sepala(Relacao entre comprimento e largura)
sepal_len=[]
sepal_width=[]
for feature in features:
    sepal_len.append(feature[0])
    sepal_width.append(feature[1])
 
groups = ('Iris_setosa','Iris_versicolor','Iris_virginica')
colors = ('blue','green','red')
data = ((sepal_len[:50], sepal_width[:50]), (sepal_len[50:100], sepal_width[50:100]), (sepal_len[100:150], sepal_width[100:150]))

for item, color, group in zip(data, colors, groups):
    x0, y0 = item
    plt.scatter(x0, y0,color=color,alpha=1)
    plt.title('Iris Dataset scatter Plot')

plt.xlabel('Sepal length')
plt.ylabel('Sepal width')
plt.show()

#Grafico de  dispersao Petala(Relacao entre comprimento e largura)
petal_len=[]
petal_width=[]
for feature in features:
    petal_len.append(feature[2])
    petal_width.append(feature[3])
 
groups = ('Iris_setosa','Iris_versicolor','Iris_virginica')
colors = ('blue','green','red')
data = ((petal_len[:50], petal_width[:50]), (petal_len[50:100], petal_width[50:100]), (petal_len[100:150], petal_width[100:150]))

for item, color, group in zip(data, colors, groups):
    x0, y0 = item
    plt.scatter(x0, y0,color=color,alpha=1)
    plt.title('Iris Dataset scatter Plot')

plt.xlabel('Petal length')
plt.ylabel('Petal width')
plt.show()
