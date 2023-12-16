# import libraries
from datetime import timedelta
from airflow import DAG 
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

# define DAG arguments
defualt_args = {
    'owner': 'Jeong Hoon Kim',
    'start_date': days_ago(0),
    'email': ['yourname@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# define DAG
dag = DAG(
    'my-first-dag',
    default_args = default_args,
    description = 'My first DAG',
    schedule_interval = timedelta(days=1),
)

# define first task
extract = BashOperator(
    task_id = 'extract',
    bash_command = 'cut -d":" -f1,3,6 /etc/passwd > /home/project/airflow/dags/extracted-data.txt',
    dag = dag,
)

# define second task
transform_and_load = BashOperator(
    task_id = 'transform',
    bash_command = 'tr ":" "," < /home/project/airflow/dags/extracted-data.txt > /home/project/airflow/dags/transformed-data.csv',
    dag = dag,
)

# task pipeline
extract >> transform_and_load
