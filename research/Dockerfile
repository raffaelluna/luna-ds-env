FROM python:3.8

RUN mkdir -p /notebooks

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools

COPY /notebooks/requirements.txt /notebooks

RUN pip3 install -r /notebooks/requirements.txt

COPY . /notebooks/
WORKDIR /notebooks

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''",  "--NotebookApp.password=''"]