# pull from base VertexAI CPU image
FROM gcr.io/deeplearning-platform-release/base-cpu

# install the required packages for working with EE in Python
RUN pip install --no-cache \
    earthengine-api \
    geemap[core] \
    ipyleaflet 

# enable the leaflet extension to view map objects
RUN jupyter nbextension enable --py --sys-prefix ipyleaflet

RUN git clone https://github.com/KMarkert/ee-workshop-esa2023/ \
 && cp ee-workshop-esa2023/notebooks /home/jupyter/ \
 && rm -rf ee-workshop-esa2023

# the base VertexAI image will have all that is required for Jupyter runtime
# just need to install the pacakges for the kernel
