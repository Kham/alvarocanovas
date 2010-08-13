# config/initializers/delayed_job_config.rb
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 5
Delayed::Worker.max_attempts = 1
Delayed::Worker.max_run_time = 1.hour
