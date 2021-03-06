from flask import Flask,render_template,request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
from datetime import datetime
import os
import math
import urllib.request
with open('config.json','r') as c:
    params=json.load(c)['params']
local_server=True
app = Flask(__name__)
app.secret_key= 'super-secret-key'
app.config['UPLOAD_FOLDER']=params['upload_location']
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)
class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),  nullable=False)
    email = db.Column(db.String(50), nullable=False)
    Phone_Num = db.Column(db.String(15), nullable=False)
    Message = db.Column(db.String(120), nullable=False)
    Date = db.Column(db.String(120), nullable=True)
class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(80),  nullable=False)
    Slug = db.Column(db.String(25), nullable=False)
    Content = db.Column(db.String(120), nullable=False)
    Tag_line = db.Column(db.String(120), nullable=False)
    Date = db.Column(db.String(120), nullable=True)
    img_file = db.Column(db.String(120), nullable=True)
@app.route('/')
def home():
    posts=Posts.query.filter_by().all()
    for i in range(9):
       if(i<3):
           with urllib.request.urlopen("https://newsapi.org/v2/top-headlines?country=in&apiKey=b25124c3cdcb4cccbcee8fd9f3ebc022") as url:
               data = json.loads(url.read())
           topheadlines = data['articles']
       if(i>2 and i<6):
           with urllib.request.urlopen("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b25124c3cdcb4cccbcee8fd9f3ebc022") as url:
               data = json.loads(url.read())
           business = data['articles']
       if(i>5 and i<9):
           with urllib.request.urlopen("http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b25124c3cdcb4cccbcee8fd9f3ebc022") as url:
               data = json.loads(url.read())
           tech = data['articles']
    return render_template('index.html', params=params,topheadlines=topheadlines,business=business,tech=tech,i=i,posts=posts)
@app.route("/about")
def about():
    return render_template('about.html',params=params)
@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method =='POST':
            box_title=request.form.get('Title')
            tline=request.form.get('tline')
            Slug=request.form.get('Slug')
            Content=request.form.get('Content')
            img_file=request.form.get('img_file')
            Date=datetime.now()
            if sno=='0':
                post=Posts(Title=box_title,Slug=Slug,Content=Content,Tag_line=tline,img_file=img_file,Date=Date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.Title=box_title
                post.Slug=Slug
                post.Content=Content
                post.img_file=img_file
                post.Tag_line=tline
                post.Date=Date
                db.session.commit()
                return redirect('/edit/'+ sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post=post,sno=sno )
@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user']==params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)
    if request.method=='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if(username==params['admin_user'] and userpass==params['admin_password']):
            # set the session variable
            session['user'] = username
            posts=Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)
    return render_template('login.html',params=params)
@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(Slug=post_slug).first()
    return render_template('post.html',params=params,post=post)
@app.route("/logout")
@app.route('/topheadlines')
def topheadlines():
    posts = Posts.query.filter_by().all()
    with urllib.request.urlopen(
            "https://newsapi.org/v2/top-headlines?country=in&apiKey=b25124c3cdcb4cccbcee8fd9f3ebc022") as url:
        data = json.loads(url.read())
    topheadlines = data['articles']
    return render_template('topheadlines.html', params=params,topheadlines=topheadlines,posts=posts)
@app.route('/business')
def business():
    posts = Posts.query.filter_by().all()
    with urllib.request.urlopen(
            "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b25124c3cdcb4cccbcee8fd9f3ebc022") as url:
        data = json.loads(url.read())
    business= data['articles']
    return render_template('business.html', params=params,business=business,posts=posts)
@app.route('/tech')
def tech():
    posts = Posts.query.filter_by().all()
    with urllib.request.urlopen(
            "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b25124c3cdcb4cccbcee8fd9f3ebc022") as url:
        data = json.loads(url.read())
    tech = data['articles']
    return render_template('tech.html', params=params,tech=tech,posts=posts)
def logout():
    session.pop('user')
    return redirect('/dashboard')
@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')
@app.route("/uploader",methods=["GET","POST"])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == "POST"):
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded Successfully"
@app.route("/contact",methods=["GET","POST"])
def contact():
    if(request.method=="POST"):
        '''Add entry to the database'''
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        msg=request.form.get('msg')
        entry=Contacts(name=name,email=email,Phone_Num=phone,Message=msg,Date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html',params=params)
app.run(debug=True)