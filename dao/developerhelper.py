import cx_Oracle
from dao.credentials import *
from dao.db import OracleDb

class UserHelper:

    def __init__(self):
        self.db = OracleDb()

    def newDeveloper(self, developer_dname, developer_login, developer_email, developer_age):
        cursor = self.db.cursor

        status = cursor.var(cx_Oracle.STRING)

        cursor.callproc("DEV.NEW_DEVELOPER", [status, developer_dname, developer_login, developer_email, developer_age])

        return status.getvalue()

    def deleteDeveloper(self, developer_login):
        cursor = self.db.cursor

        status = cursor.var(cx_Oracle.STRING)

        cursor.callproc("DEV.DELETE_DEVELOPER", [status, developer_login])
        return status.getvalue()

    def updateDeveloper(self, developer_dname, developer_login, developer_email, developer_age):
        cursor = self.db.cursor

        status = cursor.var(cx_Oracle.STRING)

        cursor.callproc("DEV.UPDATE_DEVELOPER", [status, developer_dname, developer_login, developer_email, developer_age])
        return status.getvalue()

    def getDeveloperName(self, developer_login: object) -> object:
        cursor = self.db.cursor
        name = cursor.callfunc("DEV.GET_DEVELOPER_NAME", cx_Oracle.STRING, [developer_login])
        #ursor.callfunc("DEV.get_student_name", [status, developer_dname, developer_login])
        return name

    def getAllDeveloper(self):

        cursor = self.db.cursor
        query = 'SELECT * from developer '

        cursor.execute(query)
        result = cursor.fetchall()
        return  result

if __name__ == "__main__":

    helper = UserHelper()
    print(helper.getAllDeveloper())
    #print(helper.newDeveloper('Nat', 'Tim', 'Petter@jk.jo', 22))
    print(helper.getDeveloperName("Luis123"))



