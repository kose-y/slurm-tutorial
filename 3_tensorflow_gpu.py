import tensorflow as tf
# The code is based on https://www.tensorflow.org/tutorials.
print(tf.__version__) # this is a pretty old version of TF. 
# you might want to install newer version on your own
# or request it to Mr. Choi. 
mnist = tf.keras.datasets.mnist

(x_train, y_train),(x_test, y_test) = mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0

model = tf.keras.models.Sequential([
  tf.keras.layers.Flatten(input_shape=(28, 28)),
  tf.keras.layers.Dense(512, activation=tf.nn.relu),
  tf.keras.layers.Dropout(0.2),
  tf.keras.layers.Dense(10, activation=tf.nn.softmax)
])
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

model.fit(x_train, y_train, epochs=5, verbose=0) # verbose=0: no progress bar
loss, accuracy = model.evaluate(x_test, y_test, verbose=0)
print("loss: {}, accuracy: {}".format(loss, accuracy))
