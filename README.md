# glue-local-dev

A docker image for running AWS Glue jobs locally.

## Usage

```
docker build -t glue-local-dev .

# change directory to an arbitrary directory.
docker run -it -v `pwd`/:/app/ glue-local-dev bash

# aws credentials are required
export AWS_ACCESS_KEY_ID=xxxx
export AWS_SECRET_ACCESS_KEY=xxxx
export AWS_SECRET_ACCESS_KEY=xxxx

# run a job
# JOB_NAME is required.
/aws-glue-libs-glue-1.0/bin/gluesparksubmit sample.py --JOB_NAME='sample'
```
