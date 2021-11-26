
FROM python:3.7.7-stretch

RUN apt-get update && apt-get install -y \
RUN apt install ghostscript
RUN pip install 'git+https://github.com/facebookresearch/detectron2.git#egg=detectron2'
RUN apt-get install tesseract-ocr
RUN mkdir static
RUN mkdir templates
python3-dev \
build-essential    
        
# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME demo-app-fix-version-match

# Run app.py when the container launches
CMD ["python", "app.py"]