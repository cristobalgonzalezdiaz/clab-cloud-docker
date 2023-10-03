
# Use a base image with Python and Jupyter pre-installed
# Using LABEL for metadata
FROM jupyter/base-notebook:2023-10-02
# Using LABEL for metadata
LABEL maintainer="Cristobal Gonzalez <cristobal@cristobal-lab.net>"
LABEL Python="3.11"


# Set the working directory
#WORKDIR /app

# Install any additional packages you need

# For example, you can use pip to install packages
# Install Python packages from requirements.txt
RUN pip install -r requirements.txt

# Copy your Jupyter Notebook files into the container
#COPY . /app

# Expose the port that Jupyter Notebook will run on
#EXPOSE 8888

# Start Jupyter Notebook
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]