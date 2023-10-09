#======Libraries======
import coremltools
import tensorflow as tf

#======Initialization======
#Parameters for coremltools.converters.convert():
"""
model,
source='auto',
inputs=None,
outputs=None,
classifier_config=None,
minimum_deployment_target=None,
convert_to=None,
compute_precision=None,
skip_model_load=False,
compute_units=ComputeUnit.ALL,
package_dir=None,
debug=False,
pass_pipeline: Optional[PassPipeline] = None
"""

#Loads the keras model
my_model = tf.keras.models.load_model("my_model.h5", compile=False) #For some reason getting "TypeError: weight_decay is not a valid argument, kwargs should be empty for 'optimizer_experimental.Optimizer'."
my_model.compile(experimental_run_tf_function = False) #This fixes the TypeError

#Converts keras model to core_ml
core_ml = coremltools.converters.convert(my_model)

#Metadata
core_ml.author = "Tan Nguyen"
core_ml.license = "MIT"
core_ml.short_description = "Detects Parkinson's disease based off a spectrogram."

#Saves the model
core_ml.save("my_model.mlmodel")