import os 
import numpy as np 
import tensorflow as tf  

## Data Vectors f(x)=2*x-1
xs = np.array([-1.0,  0.0, 1.0, 2.0, 3.0, 4.0], dtype=float) 
ys = np.array([-3.0, -1.0, 1.0, 3.0, 5.0, 7.0], dtype=float)  

## Model Definition
model = tf.keras.Sequential([tf.keras.layers.Dense(units=1, input_shape=[1])]) 
model.compile(optimizer='sgd', loss='mean_squared_error') 
history = model.fit(xs, ys, epochs=500, verbose=0) 
print("Finished training the model")  

## Saving Model
MODEL_DIR = "./demo_model" 
version = 1 
export_path = os.path.join(MODEL_DIR, str(version)) 
model.save(export_path, save_format="tf") 
print('\nexport_path = {}'.format(export_path))