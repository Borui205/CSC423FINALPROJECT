import cx_Oracle
import pandas as pd

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "./instantclient_19_8")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu
connection = cx_Oracle.connect(
    "", "", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()

print("Query questions.\n")

print("Show the number of order which placed by Bob Marly.\n")
def a():
	cursor.execute("""
    SELECT orderNo
    FROM Client
    Where fName = 'Bob', lName = 'Marley'
    """)

print("Show all avialable equipment avialable.\n")
def b():
	cursor.execute("""
    SELECT usage 
    FROM Equipment 
    WHERE usage = 'YES'
    """)

print("Show all of the equipment that costs between 10 to 100.\n")
def c():
	cursor.execute("""
    SELECT *
    FROM Equipment
    WHERE  10 < cost < 100
    """)
print("Show all the order start by 5 am.\n")
def d():
	cursor.execute("""
    SELECT * 
    FROM Orderr
    Where timeStart = 0500
    """)
print("Display Employee in Order by orderNo.\n")
def e():
	cursor.execute("""
    SELECT *
    FROM Employee
    ORDER BY orderNo
    """)
	
# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print(df) # examine
print(df.columns)
# print(df['FIRST_NAME']) # example to extract a column
