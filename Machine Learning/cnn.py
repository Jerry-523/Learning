#!/usr/bin/python3

import tensorflow as tf
from tensorflow.keras import datasets, layers, models

# Carregar o conjunto de dados CIFAR-10
(train_images, train_labels), (test_images, test_labels) = datasets.cifar10.load_data()

# Pré-processamento dos dados
#Os dados são pré-processados normalizando-os para ter valores entre 0 e 1.
train_images = train_images / 255.0
test_images = test_images / 255.0

# Definir a arquitetura da CNN
# A arquitetura da CNN é definida com camadas convolucionais, camadas de pooling e camadas totalmente conectadas.
model = models.Sequential()
model.add(layers.Conv2D(32, (3, 3), activation='relu', input_shape=(32, 32, 3)))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(64, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(64, (3, 3), activation='relu'))
model.add(layers.Flatten())
model.add(layers.Dense(64, activation='relu'))
model.add(layers.Dense(10))

# Compilar o modelo
# O modelo é compilado com o otimizador 'adam' e a função de perda de entropia cruzada esparsa.
model.compile(optimizer='adam',
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])

# Treinar o modelo
# o modelo é treinado usando os dados de treinamento e avaliado no conjunto de teste.
model.fit(train_images, train_labels, epochs=10, validation_data=(test_images, test_labels))

# Avaliar o desempenho do modelo
test_loss, test_acc = model.evaluate(test_images, test_labels)

# Fazer previsões em novas imagens usando o modelo treinado
predictions = model.predict(test_images)



