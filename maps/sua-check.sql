select distinct s.airsp_id, s.airsp_name,a.airsp_id, a.airsp_name,s.airsp_type
from sua s
left join sua_airspace a on a.airsp_id = s.airsp_id 
where a.airsp_name IS NULL
order by s.airsp_name
