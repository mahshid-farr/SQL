use msdb;
GO
 -- add job with schedule
 exec dbo.sp_add_job
 @job_name = 'DifferentialBackup';
GO

 
DECLARE @DifferentialBackupName VARCHAR(500);
SET @DifferentialBackupName = 'C:\SQLBackups\AdventureWorks\Diff\diff' + SYSDATETIME() +'.bak';

 exec sp_add_jobstep
@step_name = 'Weekly Differential Backup',
@subsystem = 'TSQL',
@command =  'BACKUP DATABASE [AdventureWorks2017] to disk = @DifferentialBackupName with differential, init',
@retry_attempts = 5,
@retry_interval = 5
GO
-- create a schedule for this job, backups occur each night Monday to Thursday inclusive at 11:59pm
EXEC sp_add_schedule
@schedule_name = 'WeeklyBackup' ,
@freq_type = 8,
@freq_interval = 30  ,
@active_start_time = 235900 ;
GO
-- attach the schedule to the job
EXEC sp_attach_schedule
@job_name = 'FullBackup',
@schedule_name = 'WeeklyBackup' ;
GO