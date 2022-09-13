-- Данный запрос выводит клиентов, к которым вызывали охрану по причине „Проникновение“ --

select Full_name
from Clients inner join Contracts on
Contracts.Client_ID = Clients.Client_ID
inner join Incedents_and_Violations on
Incedents_and_Violations.Contract_ID = Contracts.Contract_ID
where Reason like 'Проникновение';


-- Данный запрос выводит следующую информацию: ФИО и мобильный телефон клиентов, а также дату заключения и расторжения договора. --
select Full_name , Contact_phone,
Date_of_conclusion as 'Дата заключения договора',
Date_of_termination as 'Дата расторжения договора'
from  Clients inner join Contracts on
Contracts.Client_ID = Clients.Client_ID; 

-- Данный запрос выводит ФИО каждого клиента и количество дней, на которые был заключен контракт с каждым из клиентов.--

select Full_name, DATEDIFF(Date_of_termination, Date_of_conclusion) as 'Количество месяцев в контракте'
from  Clients inner join Contracts on
Contracts.Client_ID = Clients.Client_ID;

-- Данный запрос выводит информацию о работниках частного предприятия. -- 

select License_number_ID, Full_name, Contact_phone, Work_experience, brigade_name from Employees;

-- Данный запрос добавит информацию о новом работнике частного предприятия.--

insert into Employees values  (12378, 'Столяров Алексей Петрович', '+79875463532', '20 лет', 'Вторая');


