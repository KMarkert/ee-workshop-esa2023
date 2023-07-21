# pull from base VertexAI CPU image
FROM gcr.io/deeplearning-platform-release/base-cpu

# install the required packages for working with EE in Python
RUN pip install --no-cache-dir \
    earthengine-api \
    geemap \
    ipyleaflet 

# enable the leaflet extension to view map objects
# RUN jupyter nbextension enable --py --sys-prefix ipyleaflet
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-leaflet

# the base VertexAI image will have all that is required for Jupyter runtime
# just need to install the pacakges for the kernel
