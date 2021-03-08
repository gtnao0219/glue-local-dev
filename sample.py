import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.utils import getResolvedOptions

args = getResolvedOptions(sys.argv, [
  "JOB_NAME"
])

JOB_NAME = args["JOB_NAME"]

sc = SparkContext()
glueContext = GlueContext(sc)
job = Job(glueContext)
job.init(JOB_NAME, args)
