from flask import Flask,request,render_template
import demjson

from DBConnection import Db

app = Flask(__name__)


@app.route('/')
def home():
    return 'TINKER NEWS API v1'

@app.route('/api/add')
def addBlog():
    return render_template('addblog.html')
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



if __name__ == '__main__':
    app.run(host='0.0.0.0')
    app.run()
