#! /bin/bash

set -e

config=$SPARK_HOME/conf/spark-defaults.conf

sed -i "s#__spark_app_name__#${SPARK_APP_NAME:-spark_app}#" $config
sed -i "s#__spark_driver_max_result_size__#${SPARK_DRIVER_MAX_RESULTS_SIZE:-1g}#" $config
sed -i "s#__spark_driver_memory__#${SPARK_DRIVER_MEMORY:-1g}#" $config
sed -i "s#__spark_executor_memory__#${SPARK_EXECUTOR_MEMORY:-1g}#" $config
if [ "$SPARK_DEFAULT_PARALLELISM" = "" ]
then
  sed -i "#__spark_default_parallelism__#d" $config
else
  sed -i "s#__spark_default_parallelism__#${SPARK_DEFAULT_PARALLELISM}#" $config
fi

exec "$@"
