# База данных для частного охранного предприятия.
Данная база данных содержит информацию о клиентах охранного предприятия, работниках охранного предприятия, сервисах в контрактах,контрактах,проишествия и нарушения.

# Типовые запросы к базе данных.
1. **Данный запрос вывести клиентов, к которым вызывали охрану по причине „Проникновение“.**

```sql
select Full_name
from Clients inner join Contracts on
Contracts.Client_ID = Clients.Client_ID
inner join Incedents_and_Violations on
Incedents_and_Violations.Contract_ID = Contracts.Contract_ID
where Reason like 'Проникновение'
```

2.**Данный запрос выведет следующую информацию: ФИО и мобильный телефон клиентов, а также дату заключения и расторжения договора.**

```sql
select Full_name , Contact_phone,
Date_of_conclusion as ‘Дата заключения договора',
Date_of_termination as ‘Дата расторжения договора'
from  Clients inner join Contracts on
Contracts.Client_ID = Clients.Client_ID
```

3. **Данный запрос выведет ФИО каждого клиента и количество дней, на которые был заключен контракт с каждым из клиентов.**

```sql
select Full_name, DATEDIFF(Date_of_termination, Date_of_conclusion) as [Количество месяцев в контракте]
from  Clients inner join Contracts on
Contracts.Client_ID = Clients.Client_ID
```
4.**Данный запрос выведет информации о работниках частного предприятия.**

```sql
select License_number_ID, Full_name, Contact_phone, Work_experience, brigade_name  from Employees
```

5.**Данный запрос добавит информацию о новом охраннике частного предприятия.** 

```sql 
insert into Employees values (12378, 'Столяров Алексей Петрович', '+79875463532', '20 лет', 'Вторая')
```

# Для запуска нужно:
+ [файл](https://github.com/Sizertt/course_work_chop_db/blob/main/dump_chop_db.sql) дампа базы данных.
