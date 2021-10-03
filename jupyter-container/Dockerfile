FROM jupyter/scipy-notebook

USER root

RUN conda install --quiet --yes \
    'scikit-learn' \
    'psycopg2'

RUN mkdir -p /notebooks/

COPY ./ /notebooks/

WORKDIR /notebooks