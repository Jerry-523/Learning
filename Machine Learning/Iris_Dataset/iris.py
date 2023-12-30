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
