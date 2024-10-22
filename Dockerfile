#FROM python:3
#RUN pip install django==3.2

#COPY . .

#RUN python manage.py migrate
#EXPOSE 8000
#CMD ["python","manage.py","runserver","0.0.0.0:8000"]

FROM python:3.10

# Install the required packages
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy the current directory contents into the container at /app
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
