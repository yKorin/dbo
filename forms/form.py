from flask_wtf import Form
from wtforms import  StringField, DateField, validators, SubmitField, IntegerField


class userForm(Form):
    developer_dname = StringField('Name: ',[validators.DataRequired('Please enter Name.')])
    developer_login = StringField('Login: ',[validators.DataRequired('Please enter Login.')])
    developer_email = StringField('Email: ',[validators.DataRequired('Please enter Email.')])
    developer_age= IntegerField('Age: ')
    submit = SubmitField('Submit')