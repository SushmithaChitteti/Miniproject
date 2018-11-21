create schema mini




drop table mini.EmployeeDetails

create table mini.EmployeeDetails(
 EmployeeId int identity primary key,
 FirstName varchar(20) not null,
 LastName varchar(20) not null,
 Age int not null,
 Gender varchar(10) not null,
 AddressofEmp varchar(50) not null,
username varchar(15) not null unique,
password varchar(20) not null,
managerName varchar(20) 
)
select * from mini.EmployeeDetails

create proc mini.Employeelogin(

@username varchar(20),
@password varchar(20)
)
as
begin 
Select username,password from mini.EmployeeDetails where Username=@Username
end


select *from mini.EmployeeDetails
delete mini.EmployeeDetails where EmployeeId=6


--create table mini.AssignManager(
-- ManagerId int foreign key references mini.EmployeeDetails(ManagerId),
-- ManagerName varchar(30) not null
--)

drop table  mini.Managerlogin

create table mini.Managerlogin
(
username varchar(20) not null,
password varchar(20) not null
)

create proc mini.EmployeeLogin(
@UserName varchar(20),
@password varchar(20)

drop table mini.Agentlogin
create table mini.Agentlogin
(
AgentName varchar(15),
AgentUsername varchar(15) not null,
AgentPass varchar(20) not null
)



create table mini.AdminLogin
(

AdminUsername varchar(15) unique not null,
AdminPass varchar(20) not null
)
insert into mini.AdminLogin values('admin','admin')

drop proc mini.AddTravelAgent
create proc mini.AddTravelAgent
(
@AgentName varchar(15),
@Username varchar(20),
@Password varchar(20)
)
as 
begin
insert into mini.Agentlogin values(@AgentName,@Username,@Password)
end
select * from mini.Agentlogin 



drop table mini.TravelRequest

create table mini.TravelRequest
(
RequestId int identity not null,
RequestDate date not null,
FromLocation varchar(20) not null,
ToLocation varchar(50) not null,
EmployeeId int not null,
ManagerName Varchar(20) not null,
CurrentStatus varchar(150) 
)

select *from mini.TravelRequest

create table mini.ManagerLogin
(
Username varchar(20),
Password varchar(20)
)
 insert into  mini.ManagerLogin values('John','John')
 insert into  mini.ManagerLogin values('Paul','Paul')
 insert into  mini.ManagerLogin values('Priya','Priya')
  insert into  mini.ManagerLogin values('Riya','Riya')
-----------------------------------------------------------------------------------------------------------------------------



drop proc mini.addEmployee
create proc mini.addEmployee(
 @EmployeeId int out,
 @FirstName varchar(20),
 @LastName varchar(20),
 @Age int,
 @Gender varchar(10),
 @AddressofEmp varchar(50),
 @uname varchar(20),
 @password varchar(20),
 @ManagerName Varchar(20)
 )
 as 
 begin
 insert into mini.EmployeeDetails values(@FirstName,@LastName,@Age,@Gender,@AddressofEmp,@uname,@password,@ManagerName )
 set  @EmployeeId=SCOPE_IDENTITY()
 end


 select *from mini.EmployeeDetails



 create proc mini.DeleteEmployee
(
@EmployeeId int
)
as
begin
	delete from  mini.EmployeeDetails
	where EmployeeId = @EmployeeId
end



drop proc mini.AssignManager1


create procedure mini.AssignManager1
(
@EmployeeId int,
@ManagerName varchar(20)
)
as
begin
 update  mini.EmployeeDetails set ManagerName=@ManagerName where EmployeeId=@EmployeeId
end




create procedure mini.ManagerDisplay
(
@ManagerName varchar(20)
)
as
begin
 select * from  mini.TravelRequest where ManagerName=@ManagerName
end

Alter procedure mini.DisplayRequestForAgent

as
begin
 select * from  mini.TravelRequest where CurrentStatus='Manager Approved'
end




create procedure mini.DisplayEmpRequest
(
@EmployeeId int
)
as
begin
 select * from  mini.TravelRequest where EmployeeId=@EmployeeId
end


create procedure mini.DisplayEmpRequest
(
@EmployeeId int
)
as
begin
 select * from  mini.TravelRequest where EmployeeId=@EmployeeId
end


select *from mini.TravelRequest
drop proc mini.bookingRequest

create procedure mini.bookingRequest(
@RequestId int out,
@requestDate date,
@FromLocation varchar(20),
@ToLocation varchar(20),
@EmployeeId int,
@ManagerName varchar(20)
)
as
begin
insert into mini.TravelRequest(RequestDate,FromLocation,ToLocation,EmployeeId,ManagerName) values(@requestDate, @FromLocation,@ToLocation,@EmployeeId,@ManagerName)
set  @RequestId=SCOPE_IDENTITY()
end

select *from mini.TravelRequest


create procedure mini.updateStatusByManager
(
@CurrentStatus varchar(150),
@EmployeeId int
)
as
begin
 update mini.TravelRequest set CurrentStatus= @CurrentStatus where EmployeeId=@EmployeeId
end

drop proc mini.updateStatusByTravelAgent



create procedure mini.updateStatusByTravelAgent
(
@CurrentStatus varchar(150),
@RequestId int
)
as
begin
 update mini.TravelRequest set CurrentStatus= @CurrentStatus where RequestId =@RequestId
end

create procedure mini.Cancelrequest
(
@employeeid int
)
as
 begin
  delete from mini.TravelRequest where employeeid=@employeeid
end




create procedure mini.getdetails
(
@username varchar(15),
@password varchar(20),
@EmployeeId int out,
@managerName varchar(20) out
)
as
begin
	select   @EmployeeId=EmployeeId , @managerName=managerName from mini.EmployeeDetails where username=@username and password=@password
end


select *from mini.TravelRequest




