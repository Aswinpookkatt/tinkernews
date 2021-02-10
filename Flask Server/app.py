from flask import Flask, request, render_template, redirect, url_for, session
from deta import  Deta
import demjson,socket



from DBConnection import Db

deta = Deta('xxxxxxxxxxxxxxxxxxxxxxx') # addd the DETA project key here
db = deta.Base('tinkerblog')  # access your DB
app = Flask(__name__)
app.secret_key="tinkernews"

@app.route('/')
def home():
    return "TinkerNews API v1"
#---------------------------------- Deta Hosted DB  ----------------------------
@app.route('/api/fetch')
def fetch():
    v = {}
    data = []
    blog = db.fetch()
    for i in blog:
        for j in range(len(i)):

           title = i[j]['title']
           description = i[j]['description']
           date = i[j]['date']
           urlToImage = i[j]['url']
           oneData = {"title": title, "description": description, "date": date, "urlToImage": urlToImage}
           print(oneData)
           data.append(oneData)
    v['status'] = "ok"
    v['articles'] = data
    return demjson.encode(v)

@app.route('/api/addfunction',methods=['POST'])
def addBlogFunction():
    title = request.form['title']
    date =  request.form['date']
    url =  request.form['url']
    desc = request.form['desc']
    try:
        blog = db.put({
            "title": title,
            "date": date,
            "url": url,
            "description": desc,
        })

        print(blog)
        return "Added Successfully"
    except:
        return "Couldn't connect to DETA Base, Try again!"


@app.route('/api/list')
def list():
    if 'login' in session:  #auth check
        loginId = session['login']
        if (loginId == True):
            s = socket.socket()
            s.settimeout(15)
            blog = db.fetch()
            result = []
            keyData = []
            for i in blog:
                for j in range(len(i)):
                    k = {}
                    k['title'] = i[j]['title']
                    k['key'] = i[j]['key']
                    result.append(k)
            print(result)
            return render_template('list.html', data=result)

    else:
        return redirect(url_for('login'))

@app.route('/api/list/delete/<key>')
def delete(key):
    res = db.delete(key)
    return redirect(url_for('list'))




#---------------------------------- Ends here ------------------------------------

@app.route('/api/add')
def addBlog():
    if 'login' in session:  #auth check
        loginId = session['login']
        if (loginId == True):
            return render_template('addblog.html')
    else:
        return redirect(url_for('login'))


@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/loginFn',methods=['POST'])
def loginFn():
    username = request.form['username']
    password = request.form['password']
    if(username=="admin" and password=="root"):
        session['login'] = True
        return redirect(url_for('addBlog'))
    else:

        return "<script>alert('Invalid username or password');window.location='/login';</script>"





@app.route('/logout')
def logout():
    session.pop('login',None)
    return redirect(url_for('login'))



#----------------------------------- SQL DB ---------------------------

@app.route('/api/addfn',methods=['POST'])
def addBlogfn():
    title = request.form['title']
    date =  request.form['date']
    url =  request.form['url']
    desc = request.form['desc']
    db = Db()
    db.insert(
        "INSERT INTO blog(title,date,urlToImage,description) values ('" + title + "','" + date + "','"+url+"','"+desc+"') ")
    return "Added Successfully"


@app.route('/api/news')
def blog():
    v={}
    data =[]
    db = Db()
    result = db.select("SELECT * FROM blog")
    #print(result)

    for j in range(len(result)):
        title = result[j]['title']
        description = result[j]['description']
        date = result[j]['date']
        urlToImage = result[j]['urlToImage']
        oneData = {"title": title, "description": description, "date": date, "urlToImage": urlToImage}
        print(oneData)
        data.append(oneData)
    v['status'] = "ok"
    v['articles'] = data
    return demjson.encode(v)

#----------------------------------- Ends here -------------------------------

if __name__ == '__main__':
    app.run(host='0.0.0.0')
    app.run()
