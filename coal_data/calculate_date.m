function date=calculate_date(x)
weeks=x*12;
begin = datetime(1950,1,1);
date=begin+calweeks(weeks);
