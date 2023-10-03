
# Use a base image with Python and Jupyter pre-installed
# Using LABEL for metadata
FROM jupyter/base-notebook:2023-10-02
# Using LABEL for metadata
LABEL maintainer="Cristobal Gonzalez <cristobal@cristobal-lab.net>"
LABEL Python="3.11"


# Install any additional packages you need
# Set the working directory
WORKDIR /requirements
# Copy your Jupyter Notebook requiriment into the container
COPY ./requirements.txt /requirements

# Install Python packages from requirements.txt
RUN pip install -r requirements.txt

# Expose the port that Jupyter Notebook will run on
#EXPOSE 8888

# Start Jupyter Notebook
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]