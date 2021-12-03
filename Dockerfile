FROM python:latest

WORKDIR /app

#Set timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


#Copy Files
COPY chromedriver .
COPY main.py .
COPY scmt.py .
COPY utils.py .
COPY scheduler.py .
COPY telegrambot.py .
#COPY config.yaml .
#COPY data.json .

RUN mkdir __logger

RUN pip install --upgrade pip
RUN pip install pyyaml
RUN pip install python-telegram-bot --upgrade
RUN pip install schedule
RUN pip install selenium


CMD ["python", "./telegrambot.py", "&", "python", "./scheduler.py", "&"]