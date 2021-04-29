use msdb;
GO
 -- add job with schedule
 exec dbo.sp_add_job
 @job_name = 'TransactionLog';
GO

 
DECLARE @TransactionLogpName VARCHAR(500);
SET @TransactionLogpName = 'C:\SQLBackups\AdventureWorks\Full\diff' + SYSDATETIME() +'.bak';

 exec sp_add_jobstep
@step_name = 'Weekly Differential Backup',
@subsystem = 'TSQL',
@command =  'BACKUP LOG [AdventureWorks2017] to disk = @TransactionLogpNamee with differential, init',
@retry_attempts = 5,
@retry_interval = 5
GO
-- create a schedule for this job, backups occur once a week each Friday at 11:59 pm
EXEC sp_add_schedule
@schedule_name = 'WeeklyBackup' ,
@freq_type = 8,
@freq_interval = 62  ,
@freq_subday_type = 1,
@freq_relative_interval = 15,
@active_start_time = 080000,
@active_end_time = 180000
GO
-- attach the schedule to the job
EXEC sp_attach_schedule
@job_name = 'FullBackup',
@schedule_name = 'WeeklyBackup' ;
GO