"""
DAG simples para verificar a instalação do Airflow
"""
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'start_date': datetime(2023, 1, 1),
}

dag = DAG(
    'hello_world',
    default_args=default_args,
    description='DAG simples para teste',
    schedule_interval=None,
    catchup=False,
)

def print_hello():
    return 'Olá! Airflow está funcionando corretamente!'

hello_task = PythonOperator(
    task_id='hello_task',
    python_callable=print_hello,
    dag=dag,
)

hello_task
