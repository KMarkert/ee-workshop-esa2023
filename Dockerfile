# pull from base VertexAI CPU image
FROM gcr.io/deeplearning-platform-release/base-cpu


# install the required packages for working with EE in Python
RUN conda update -n base -c defaults conda \
  && conda install -y -c conda-forge earthengine-api geemap \
    # jupyter_contrib_nbextensions \
  && conda clean --all -f -y

# enable extra extensions for notebook experience
# RUN jupyter nbextension enable scratchpad/main

# the base VertexAI image will have all that is required for Jupyter runtime
# just need to install the pacakges for the kernel
