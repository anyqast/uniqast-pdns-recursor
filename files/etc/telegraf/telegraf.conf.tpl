[global_tags]
[agent]
interval = "{{TELEGRAF_AGENT_COLLECT_INTERVAL}}"
round_interval = true
metric_batch_size = 1000
metric_buffer_limit = 1000
collection_jitter = "0s"
flush_interval = "{{TELEGRAF_AGENT_FLUSH_INTERVAL}}"
flush_jitter = "0s"
precision = ""
debug = false
quiet = true
logfile = ""
hostname = ""
omit_hostname = false

[[inputs.exec]]
commands = ["/dump-metrics.sh"]
data_format = "influx"


