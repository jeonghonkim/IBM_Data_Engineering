# import libraries
from datetime import timedelta
from airflow import DAG 
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

# define DAG arguments
default_args = {
    'onwer': 'Jeong Hoon Kim',
    'start_date': days_ago(0),
    'email': ['JeongHoon.Kim@cbre.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# define DAG
dag = DAG(
    dag_id = 'ETL-Server-Access-Log-Processing',
    default_args = default_args,
    description = 'ETL DAG Practice',
    schedule_interval = timedelta(days=1),
)

# define task1 - Download
download = BashOperator(
    task_id = 'download',
    bash_commnad = 'wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Apache%20Airflow/Build%20a%20DAG%20using%20Airflow/web-server-access-log.txt"',
    dag = dag,
)

# define task2 - Extract
extract = BashOperator(
    task_id = 'extract'.
    bash_command = 'cut -f1,4 -d"#" web-server-access-log.txt > /home/project/airflow/dags/extracted.txt',
    dag = dag,
)

# define task3 - Transform
transform = BashOperator(
    task_id = 'transform',
    bash_command = 'tr "[a-z]" "[A-Z]" < /home/project/airflow/dags/extracted.txt > /home/project/airflow/dags/capitalized.txt',
    dag = dag,
)

# define task4 - Load
load = BashOperator(
    task_id = 'load',
    bash_command = 'zip log.zip capitalized.txt',
    dag = dag,
)

# task pipeline
download >> extract >> transform >> load
