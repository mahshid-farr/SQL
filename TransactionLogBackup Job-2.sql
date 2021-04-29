USE msdb

GO;

EXEC dbo.sp_add_job

@job_name= 'TransactionLogBackup'

GO

DECLARE @full_name_new VARCHAR(1000);
SET @full_name_new = 'C:\SQLBackups\AdventureWorks\Log\log' + CONVERT(nvarchar(30), GETDATE(), 111) +'.bak';

EXEC sp._add_jobstep

@job_name= 'TransactionLogBackup'

@step_name= 'Daily Backup'

@command =  'BACKUP DATABASE AdventureWorks2017 TO DISK = @full_name_new WITH INIT',

@retry_attempts =5 ,

@retry_interval= 15

GO

EXEC sp_add_schedule

@schedule_name = 'DailyBackup' ,

@freq_type = 4,

@freq_interval = 62,

@freq_subday_type = 1,

@freq_subday_interval = 15,

@active_start_time = ' 075900'
@active_end_time = ' 180000'

GO

EXEC sp_attach_schedule

@job_name = 'TransactionLogBackup',

@schedule_name = 'DailyBackup' ;

GO