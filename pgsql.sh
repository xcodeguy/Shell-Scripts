#!/bin/sh

/Library/PostgreSQL/8.4/bin/pg_ctl stop -D /Library/PostgreSQL/8.4/data/ -m smart
/Library/PostgreSQL/8.4/bin/pg_ctl start -D /Library/PostgreSQL/8.4/data/

