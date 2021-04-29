use msdb;
go
 -- add job with schedule
 exec dbo.sp_add_job
 @job_name = 'FullBackup';
 go

 DECLARE @FullBackupName VARCHAR(500);
SET @FullBackupName = 'C:\SQLBackups\AdventureWorks\Full\full' + SYSDATETIME() +'.bak';

 exec sp_add_jobstep
@step_name = 'Weekly Full Backup',
@subsystem = 'TSQL',
@command =   'BACKUP DATABASE [AdventureWorks2017] TO DISK = @FullBackupName WITH INIT',
@retry_attempts = 5,
@retry_interval = 5
GO
-- create a schedule for this job, backups occur once a week each Friday at 11:59 pm
EXEC sp_add_schedule
@schedule_name = 'WeeklyBackup' ,
@freq_type = 8,
@freq_interval = 32,
@active_start_time = 235900 ;
GO
-- attach the schedule to the job
EXEC sp_attach_schedule
@job_name = 'FullBackup',
@schedule_name = 'WeeklyBackup' ;
GO

