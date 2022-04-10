-- 
--  La tabla `tbl1` tiene la siguiente estructura:
-- 
--    K0  CHAR(1)
--    K1  INT
--    c12 FLOAT
--    c13 INT
--    c14 DATE
--    c15 FLOAT
--    c16 CHAR(4)
--
--  Escriba una consulta en SQL que devuelva la suma del campo c12.
-- 
--  Rta/
--     SUM(c12)
--  0  15137.63
--
--  >>> Escriba su codigo a partir de este punto <<<
--

import sqlite3
import pandas as pd

conexion = sqlite3.connect(':memory:')
cursor = conexion.cursor()

#1
tbl1_pandas = pd.read_csv('tbl1.csv', header = None)
tbl1_pandas.columns = ['K0', 'K1', 'c12', 'c13', 'c14', 'c15', 'c16']
tbl1_pandas['c14'] = pd.to_datetime(tbl1_pandas['c14'], format='%Y-%m-%d')

tbl1_pandas.to_sql(
    name='tbl1',
    con=conexion,
    if_exists='replace',
)

cursor.execute('SELECT sum(c12) FROM tbl1;').fetchall()