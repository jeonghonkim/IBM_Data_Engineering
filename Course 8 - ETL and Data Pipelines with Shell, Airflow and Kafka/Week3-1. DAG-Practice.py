# import libraries
from datetime import timedelta
from airflow import DAG 
from airflow.operators.bash_operator import BashOperator 
from airflow.utils.dates import days_ago

# define DAG arguments
default_args = {
    'onwer': 'Jeong Hoon Kim',
    'start_date': days_ago(0),
    'email': ['yourname@gmail.com'],
    'email_on_failture': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# define DAG
dag = DAG(
    dag_id = 'sample-etl-dag',
    default_args = default_args,
    description = 'Sample ETL DAG using Bash',
    schedule_interval = timedelta(days=1),
)

# define task1 - extract
extract = BashOperator(
    task_id = 'extract',
    bash_command = 'echo "extract"',
    dag = dag,
)

# define task2 - transform
transform = BashOperator(
    task_id = 'transform',
    bash_command = 'echo "transform"',
    dag = dag,
)

# define task3 - load
load = BashOperator(
    task_id = 'load',
    bash_command = 'echo "load"',
    dag = dag,
)

# task pipeline
extract >> transform >> load
