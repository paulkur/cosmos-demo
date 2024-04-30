#FROM quay.io/astronomer/astro-runtime:11.2.0
FROM quay.io/astronomer/astro-runtime:10.8.0
#FROM quay.io/astronomer/astro-runtime:8.8.0
#FROM quay.io/astronomer/astro-runtime:8.10.0
#FROM quay.io/astronomer/astro-runtime:9.13.0
# install dbt into a virtual environment
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
	#pip install --no-cache-dir dbt-postgres && deactivate
	pip install --no-cache-dir dbt-postgres==1.6.13 && deactivate
	#pip install --no-cache-dir dbt-postgres==1.5.11 && deactivate
    #pip install --no-cache-dir dbt-postgres==1.5.4 && deactivate


# set a connection to the airflow metadata db to use for testing
#ENV AIRFLOW_CONN_AIRFLOW_METADATA_DB=postgresql+psycopg2://postgres:postgres@postgres:5432/postgres

#ENV AIRFLOW_CONN_AIRFLOW_METADATA_DB=postgresql+psycopg2://postgres:postgres@postgres:5432/postgres
ENV AIRFLOW_CONN_AIRFLOW_METADATA_DB=postgresql+psycopg2://usr_airflow:airflow7812@192.168.1.110:5432/airflowdb

#ENV AIRFLOW_CONN_AIRFLOW_DB=postgres://airflow:pg_password@postgres:5432/airflow
# working dbt-postgres==1.6.13
# try dbt-postgres==1.7.11

#FROM quay.io/astronomer/astro-runtime:8.10.0
# working dbt-postgres==1.5.11